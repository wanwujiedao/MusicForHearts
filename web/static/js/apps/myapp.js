/**
 * Created by 87671 on 2016/1/17.
 */


//收藏歌曲到歌单中，存到数据库中
function collect(musiclistItem){

    //关闭模态框
    $("#addToMusiclist_Modal").modal('hide');

    //歌单id
    var musiclistId=$(musiclistItem).data("list_id");

    //获取songid，看看这个歌单中有没有，如果有则提示已经存在，没有就存入此歌单。
    //拿到歌曲id
    console.info("我要收藏此"+iwantAddMusicId+"到"+musiclistId+"这个歌单中");

    dao.addMusicToMusicList(iwantAddMusicId,musiclistId).done(function(data){

        if(data.flag){
            Message.show("收藏成功");
            //刷新一下歌单

            //dao.refreshAddMusicToMusicListDialog();
        }else{
            Alert.error("收藏失败,当前歌曲已存在");
        }
    });


}


//新建歌单的modal显示
function newx() {
    $('#addToMusiclist_Modal').modal('hide');
    $('#newMusiclist_Modal').modal('show');


}




//提交评论
function submit_comment(it){
    var music_id=$(it).attr("data-music_id");

    //先判断用户
    if(!dao.isLogin()){
        return;
    }

    //评论内容
    var comment=$("#addcomment").val();

    if(!$.trim(comment)==''){
        console.info("评论内容为:"+comment+",musicid:"+music_id);
        //评论
        dao.submitComment(music_id,comment).done(function(data){

            if(data.flag){
                //评论成功
                Message.show("评论成功");
                //刷新
                dao.refreshMusicComments(music_id,1);
                //清空输入框
                $("#addcomment").val('');

            }else{
                Message.show("评论失败");
            }
        });

    }else{
        Alert.error("评论内容不能为空");
    }
}




//新建歌单提交
function newMusicList(){
    //取得值
    var newListName=$('#mynewlistname').val();
    if(!$.trim(newListName)==''){
        if(newListName=='我喜欢'){
            Alert('此歌单不能被创建,请更换名称');
        }else{

            //发送请求

            dao.newMusiclist(newListName).done(function(data){
                if(data.flag){
                    Message.show('新建歌单成功');
                    //刷新一下歌单

                    dao.refreshAddMusicToMusicListDialog();
                }else{
                    Alert.error("歌单新建失败");
                }
            });
        }

    }else{
        Alert.error("歌单名不合法");
    }

}



// data-bjax api
+function ($) {
    "use strict";
    var Bjax = function (element, options) {
        this.options = options
        this.$element = $(this.options.target || 'html');
        this.start()
    }
    var st=0;

    Bjax.DEFAULTS = {
        backdrop: true,
        url: '',
        replace:true,
        target:'#myParCont',
        el:'#content'
    }

    Bjax.prototype.start = function () {
        var that = this;
        this.backdrop();
        $.ajax(this.options.url).done(function (r) {
            that.$content = r;
            that.complete();
        });
    }

    Bjax.prototype.complete = function () {
        var that = this;
        if (this.$element.is('html') || (this.options.replace)) {
            try {

                    if(this.options.url!=st){
                        window.history.pushState({}, '', this.options.url);
                        st=this.options.url;
                    }



            } catch (e) {
                window.location.replace(this.options.url)
            }
        }

        this.updateBar(100);
    }

    Bjax.prototype.backdrop = function () {
        //utils.loading($(this.options.target));

        this.$element.css('position', 'relative')
        this.$backdrop = $('<div class="backdrop fade bg-white"></div>')
            .appendTo(this.$element);
        if (!this.options.backdrop) this.$backdrop.css('height', '2');
        this.$backdrop[0].offsetWidth; // force reflow
        this.$backdrop.addClass('in');

        this.$bar = $('<div class="bar b-t b-2x b-info"></div>')
            .width(0)
            .appendTo(this.$backdrop);
    }

    Bjax.prototype.update = function () {
        this.$element.css('position', '');
        if (!this.$element.is('html')) {
            if (this.options.el) {
                this.$content = $(this.$content).find(this.options.el);
            }
            this.$element.html(this.$content);
        }
        if (this.$element.is('html')) {
            if ($('.ie').length) {
                location.reload();
                return;
            }
            document.open();
            document.write(this.$content);
            document.close();
        }
    }

    Bjax.prototype.updateBar = function (per) {

        var that = this;
        this.$bar.stop().animate({
            width: per + '%'
        }, 100, 'linear', function () {
            if (per == 100) that.update();
        });

    }

    Bjax.prototype.enable = function () {

        return true;
    }

    $.fn.bjax = function (option) {
        return this.each(function () {
            var $this = $(this);
            var data = $this.data('app.bjax');
            var options = $.extend({}, Bjax.DEFAULTS, $this.data(), typeof option == 'object' && option)
            if (!data) $this.data('app.bjax', (data = new Bjax(this, options)))
            if (data) data['start']()
            if (typeof option == 'string') data[option]()

        })
    }

    $.fn.bjax.Constructor = Bjax

    $(window).on("popstate", function (e) {
        //if (e.originalEvent.state !== null) {
        //    window.location.reload(true);
        //}
        window.location.reload(true);
        e.preventDefault();
    });






    $(document).delegate('[data-bjax]','click', function (e) {
        if (!Bjax.prototype.enable()) return;
        var url=CONTEXTPATH+$(this).attr('data-url');
        $(this).bjax({url: url});
        e.preventDefault();
    });

    $('.escape').each(function(){
        var $this = $(this);
        var t = $this.html();
        $this.html(t.replace(/</g, '&lt;').replace(/>/g, '&gt;'));
    });


}(jQuery);