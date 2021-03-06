<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/mv/comment.css"/>
<script type="text/javascript" src="${ctx}/static/js/mv/comments.js"></script>
<script type="text/javascript">
    var id = '${mv_id}';
    var getcomments=$_ctx+'/comment/findComment';
    var releasecontent=$_ctx+'/comment/saveComment';
    var pagesize=5;
    var pagenum=1;
    $(function(){


        $('.release').prop('id',id);
        $('#mycomment').focus(function() {
            var content = '';
            document.onkeyup = function(event) {
                content = $('#mycomment').val();
                var len = content.length;
                var re = '';
                if (len <= 200) {
                    re += '已输入字符' + len + '/200';
                } else {
                    $('#mycomment').val(content.substring(0, 200))
                    re = '字符已超过指定数目';
                }
                $('#remain').text(re);
            };
        });
        $('.release').click(function() {
            var releaseid=this.id;
            var content = $('#mycomment').val();
            if (content.length < 1) {
                window.wxc.xcConfirm('评论不能为空！', window.wxc.xcConfirm.typeEnum.error, {
                    title: "温馨提示"
                });
            } else {

                  $.post(releasecontent, {

                      musicid: releaseid,
                      content: content
                  }, function (data,stadius) {
                      if(stadius=='success'){
                          if(data=='ok'){
                              $('#mycomment').val('');
                              $('#remain').text('已输入字符0/200');
                              showco(releaseid);
                          }else{
                              window.wxc.xcConfirm('评论前请登录！', window.wxc.xcConfirm.typeEnum.error, {
                                  title: "温馨提示",
                                  onOk:function(){
                                      $('#login-wrap').fadeIn(1200);
                                  }
                              });
                          }
                      }

                  });

            }
        });

        showco(id,pagesize,pagenum);

        $('.addmore').click(function (){
            pagenum++;
            showco(id,pagesize,pagenum);
        });
    });


    var showco=function(showid,pagesize,pagenum) {
        $.get(getcomments, {
            musicid:showid,
            pagesize:pagesize,
            pagenum:pagenum
        }, function (data, status) {
            var count = Math.ceil(data.data.total / 5);
            var start = data.data.pagenum;
            if(start>=count){
                $('.addmore').remove();
            }
            showcomment(data.data.rows)
        });
    }
</script>
<div id="mycomment-wrap" class="col-md-8 col-md-offset-1">
    <textarea id="mycomment" name="mycomment"></textarea>
    <p id="remain">已输入字符0/200</p>
    <a class="release btn">发布</a>
    <div id="comments" style="margin-top: 70px">
    </div>
    <div class="addmore col-md-4 col-md-offset-4" style="text-align: center;background-color: #0f0f0f;color: #F6F6F6;cursor: hand">更多评论</div>
</div>

