/**
 * Created by 87671 on 2016/1/16.
 */

(function(win, $) {


    var musiclistElem;

    /**
     *歌曲分类查询数据
     * @param typeid type的id
     */
    var musicSortData=function(typeid,pagenumber){
        var data={
            typeid:typeid,
            pagenumber:pagenumber||1,
            pagesize:4
        };
        return utils.post(CONTEXTPATH+'/music/musicSort.do',data,function(data){
            return data;
        },'json');

    };



    /**
     * 拿到当前用户的创建的歌单的数据
     * @returns {*}
     */
    var currentUserCreateMusiclistData=function(){

        return utils.post(CONTEXTPATH+'/musiclist/myMusiclist.do',{},function(data){
            return data;
        },'json');
    };

    /**
     * 获取当前用户收藏的歌单的数据
     * @returns {*}
     */
    var currentUseCollectMusiclistData = function(){
        return utils.post(CONTEXTPATH+'/musiclist/userCollectMusiclist.do',{},function(data){
            return data;
        },'json');
    }




    /**
     * 添加歌曲到歌单，向后台请求
     * @param musicid
     * @param musiclistId
     * @returns {*}
     */
    var addMusicToMusicList=function(musicid,musiclistId){
        var adddata={
            musicid:musicid,
            musiclistId:musiclistId
        };
        return utils.post(CONTEXTPATH+'/musiclist/addMusicToMusicList.do',adddata,function(data){
            return data;
        });
    };



    //刷新添加到歌单对话框
    var refreshAddMusicToMusicListDialog=function(){
        musiclistElem=undefined;
        //把model去掉
        $("#addToMusiclist_Modal").remove();
    };




    /**
     * 添加歌曲到歌单，弹出对话框
     * @param musicid
     */
    var showAddMusicToMusicListDialog=function(musicid){
        if(!isLogin()){
            return;
        }

        //放到全局变量中
        iwantAddMusicId=musicid;
        if(!musiclistElem){

            //请求拿到数据
            currentUserCreateMusiclistData().done(function(data){
                if(!data.flag){
                    //用户未登录,弹出登录框
                    console.info("当前用户未登录，请先登录");
                    return;
                }else{

                    //初始化
                    $("#modal").setTemplateURL(CONTEXTPATH + "/static/template/template_addToMusiclist.html?date=" + (+new Date()), null, {filter_data: true});
                    $("#modal").processTemplate(data.data);
                    //把addToMusiclist_Modal放到body后面
                    $("#addToMusiclist_Modal").prependTo("body");

                   musiclistElem=$("#addToMusiclist_Modal");

                    //显示
                    $("#addToMusiclist_Modal").modal("show");
                }
            });




        }
        //弹出歌单添加模态框
        $("#addToMusiclist_Modal").modal("show");


    };


    //只是刷新评论
    var refreshMusicComments=function(musicid,page){
        if($("#comment_ch").length>0){
            //
            commnetDataForMusic(musicid,page).done(function(data){
                var commData=data.data;
                $("#comments_body").setTemplateURL(CONTEXTPATH + "/static/template/template_comments.html?date=" + (+new Date()), null, {filter_data: true});
                $("#comments_body").processTemplate(commData);
            });

        }

    };

    //在页面初始化评论
    var initMusicComments=function(musicid){
        commnetDataForMusic(musicid).done(function(data){
            //初始化分页
            if(data.flag){
                var commData=data.data;
                commData.music_id=musicid;

                $("#music_comment").setTemplateURL(CONTEXTPATH + "/static/template/template_comments_AndOther.html?date=" + (+new Date()), null, {filter_data: true});
                $("#music_comment").processTemplate(commData);


                var pageSize=data.data.pageSize;
                var total=data.data.total;

                var totalPages=total%pageSize==0?total/pageSize:parseInt(total/pageSize)+1;

                if(commData.pageSize<commData.total){
                    //分页显示
                    //渲染分页
                    var pageOptions={
                        bootstrapMajorVersion:3,
                        currentPage: 1,
                        totalPages:totalPages,
                        onPageClicked:function(event, originalEvent, type,page){
                            //只是刷新数据,但分页不刷新

                            refreshMusicComments(musicid,page);

                        }


                    };
                    $('#compage').bootstrapPaginator(pageOptions);


                }
            }





        });

    };




    /**
     * 判断用户是否登陆
     * @returns {boolean}
     */
    var isLogin=function(){
        var isLogin=false;
        utils.getSync(CONTEXTPATH+'/user/loginIsNew.do').done(function(data){
            if(data.flag){
                isLogin=true
            }else{
                Alert.error('当前用户未登录');

                isLogin=false;
            }
        });
        return isLogin;
    };




    /**
     * 对歌曲播放数加  1
     * @param musicid
     */
    var addMusicPlayCount=function(musicid){
        var musicdata={
            musicid:musicid
        };
        utils.post(CONTEXTPATH+'/music/addMusicPlayCount.do',musicdata,function(data){
            return data;
        },"json")
    };




    /**
     * 歌曲下载
     * @param musicid
     */
    var musicDownload=function(musicid){
        if(!musicid){
            Alert.error("歌曲不合法");
            return;
        }
        window.location.href=CONTEXTPATH+'/music/musicDownlaod.do?musicid='+musicid;
    };



    /**
     * 歌曲的评论数据
     * @param musicid
     */
    var commnetDataForMusic=function(musicid,page){
        var musicdata={
            musicid:musicid,
            pagenumber:page||1,
            pagesize:3
        };
        return utils.post(CONTEXTPATH+'/user/showuserComment.do',musicdata,function(data){
            return data;
        },"json")

    };

    //发送评论数据
    var submitComment=function(musicid,comment){

        var commentData={
            content:comment,
            musicId:musicid
        };
        return utils.post(CONTEXTPATH+'/user/userComment.do',commentData,function(data){
            return data;
        },'json');
    };

    //登录用户创建的歌单
    var musiclist = function(){
        currentUserCreateMusiclistData().done(function(data){
            var ml=data.data;
            $("#myCreatedMusicList").setTemplateURL(CONTEXTPATH + "/static/template/template_myCreatedMusicList.html?date=" + (+new Date()), null, {filter_data: true});
            $("#myCreatedMusicList").processTemplate(ml);
        });
        currentUseCollectMusiclistData().done(function(data){
            var ml=data.data;
            $("#myCollectMusicList").setTemplateURL(CONTEXTPATH + "/static/template/template_myCreatedMusicList.html?date=" + (+new Date()), null, {filter_data: true});
            $("#myCollectMusicList").processTemplate(ml);
        })
    };

    /**
     * 新建歌单,向后台发送请求
     * @param musiclistName
     * @returns {*}
     */
    var newMusiclist=function(musiclistName){
        var musiclistData={
            musiclistName:musiclistName
        };
        return utils.post(CONTEXTPATH+'/musiclist/newMusiclist.do',musiclistData,function(data){
            return data;
        });
    };


    /**
     * 喜欢这首歌的用户的数据
     * @param musicid
     * @returns {*}
     */
    var userlikeThisMusic=function(musicid){
        var musicData={
            musicid:musicid
        };
        return utils.post(CONTEXTPATH+'/music/findUsersLikeThisMusic.do',musicData,function(data){
            return data;
        });
    };


    /**
     * 相似歌曲的数据
     * @param musicid
     * @returns {*}
     */
    var musicSimilar=function(musicid){
        var musicData={
            musicid:musicid
        };
        return utils.post(CONTEXTPATH+'/music/musicSimilarRecommend.do',musicData,function(data){
            return data;
        });

    };

    /**
     * 收藏歌曲到歌单
     * @param musiclistId
     * @returns {*}
     */
    var collectMusiclist=function(musiclistId){
        var collectData={
            musiclistId:musiclistId
        };

        return utils.post(CONTEXTPATH+'/musiclist/collectMusiclist.do',collectData,function(data){
            return data;
        });
    };


    win.dao = {

        /**
         * 歌曲分类查询数据
         */
        musicSortData:musicSortData,

        /**
         * 添加歌曲到歌单,向后台请求
         */
        addMusicToMusicList:addMusicToMusicList,


        /**
         * 添加歌曲到歌单，弹出对话框
         */
        showAddMusicToMusicListDialog:showAddMusicToMusicListDialog,


        /**
         * 用户是否登陆,返回true,false
         */
        isLogin:isLogin,

        /**
         * 对歌曲播放数加  1
         */
        addMusicPlayCount:addMusicPlayCount,


        /**
         * 歌曲下载
         */
        musicDownload:musicDownload,

        /**
         * 歌曲评论数据
         */
        commnetDataForMusic:commnetDataForMusic,

        /**
         * 当前用户创建的歌单数据
         */
        currentUserCreateMusiclistData:currentUserCreateMusiclistData,

        /**
         * 初始化评论
         */
        initMusicComments:initMusicComments,

        /**
         * 刷新评论
         */
        refreshMusicComments:refreshMusicComments,


        //提交评论
        submitComment:submitComment,

        //登录用户创建的歌单
        musiclist:musiclist,


        //新建歌单,向后台发送请求
        newMusiclist:newMusiclist,

        //刷新添加到歌单对话框
        refreshAddMusicToMusicListDialog:refreshAddMusicToMusicListDialog,

        //喜欢这首歌的用户的数据
        userlikeThisMusic:userlikeThisMusic,

        //相似歌曲的数据
        musicSimilar:musicSimilar,

        //收藏歌曲到歌单
        collectMusiclist:collectMusiclist


    }

})(window, jQuery);