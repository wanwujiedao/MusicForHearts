/**
 * Created by 87671 on 2016/1/16.
 */




var utils = {

    //同步获取数据
    getSync:function(url,handler,dataType){
        var dtd=$.Deferred(),
            data;
        $.ajax({
            url:url,
            data:data||{},
            dataType:dataType||'json',
            type:'get',
            async:false
        }).done(function(data){
            data = handler ?handler(data) :data;
            dtd.resolve(data);
        }).fail(function(a,b,c){
            dtd.reject(data);
        });
        return dtd.promise();
    },

    post: function(url, data, handler, dataType) {
        var dtd = $.Deferred(),
            data;
        $.ajax({
            url: url,
            data: data || {},
            dataType: dataType || 'json',
            type: 'post',
            async:true
        }).done(function(data) {
            data = handler ? handler(data) : data;
            dtd.resolve(data);
        }).fail(function(a, b, c) {
            dtd.reject(data);
        });
        return dtd.promise();
    },
    get : function(url,handler,dataType){
        var dtd=$.Deferred(),
            data;
        $.ajax({
            url:url,
            data:data||{},
            dataType:dataType||'json',
            type:'get',
            async:true
        }).done(function(data){
            data = handler ?handler(data) :data;
            dtd.resolve(data);
        }).fail(function(a,b,c){
            dtd.reject(data);
        });
        return dtd.promise();
    },

    /**
     * 用此loading需导入ball-clip-rotate-multiple   css
     * @param parentDiv
     */
    loading:function(parentDiv){
        parentDiv.empty();
        $item = $('<div class="la-ball-clip-rotate-multiple"><div></div><div></div></div>');
        parentDiv.append($item);
    },

    /**
     * 获取用户的歌单列表
     * @param myjson
     */
    mylist:function(myjson){
        if (myjson.flag) {
            var data = myjson.data;
            beforStr = '<a href="#" class="list-group-item" id="newList" onclick="newx()">新建歌单</a>';
            str = "";
            $.each(data, function(index, iteam) {
                str += '<a href="#" class="list-group-item" data_list_id="'+iteam.id+'" onclick="collect()"><img id="imgx" src="' + iteam.cover + '"/>' + iteam.listname + ' [共' + iteam.collectcount + '首歌曲]</a>';
            });
            $('#songlists').html(beforStr + str);
        } else {
            console.info(myjson.msg);
            $('#songlists').html("未登录，请登录!");
        }
    }


};



//提示信息
var Message = (function() {
    "use strict";

    var elem,
        hideHandler,
        that = {};

    that.init = function() {
        console.info("我被初始化了");
        $("body").append("<div id=\"mymyalert\" class=\"bb-alert alert alert-info\" style=\"display: none;\"> <span>Confirm result: true</span> </div>");
        elem = $("#mymyalert");
    };

    that.show = function(text) {

        if(!elem){
            that.init();
        }

        clearTimeout(hideHandler);

        elem.find("span").html(text);
        elem.delay(200).fadeIn().delay(1000).fadeOut();
    };

    return that;
}());



//信息提示框
var Alert={

    info:function(message){
        bootbox.dialog({
            backdrop:true,
            onEscape:true,
            title:"提示",
            message: message||"提示信息",
            buttons:{
                ok:{
                    label:'确定',
                    className:'btn-primary'

                }
            }

        })
    },
    error:function(message){
        bootbox.dialog({
            backdrop:true,
            onEscape:true,
            className:'text-danger',
            title:"错误",
            message: message||"提示信息",
            buttons:{
                ok:{

                    label:'确定',
                    className:'btn-primary'

                }
            }

        })
    }
};