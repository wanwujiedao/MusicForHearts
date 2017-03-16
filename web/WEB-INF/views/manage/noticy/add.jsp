<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/inc/meta.jsp" %>
<style>
    #myParCont{
        font-size: 20px;
    }
    .userlist{

        position: absolute;
        z-index: 20;
        background-color: #00AA88;
        color: #ffffff;
        /*width:670px;*/
        width:96%;
        display: none;

    }

   .userlist>ul{


   }
    .userlist li{
        cursor: pointer;
        list-style-type: none;
        margin-left:-40px ;
    }

    .uh{
        background-color: #79564a;
        color: #FFFF00;
    }

</style>
<script>
    var pagesize=5;
    var pagenum=1;

    var getUserList=function(pagenum,pagesize){
        $.post($_ctx+'/user/find',{
            pagenum:pagenum,
            pagesize:pagesize
        },function(data,stadius){
            if(stadius=='success'){
              var str='';
                str+='<li class="tag" id="0">所有人</li>';
                $.each(data.data.rows,function(index,item){
                    str+='<li class="tag" id="'+item.id+'">'+item.name+'</li>';
                });
                var pagetotal= Math.ceil(data.data.total /5 );
                $('.changepage span').html('共'+pagetotal+'页，当前为第'+data.data.pagenum+'页');

                if(data.data.pagenum==1){
                    $('a.pre').prop('id','');
                    $('a.pre').html('');
                    $('a.next').prop('id',data.data.pagenum+1);
                    $('a.next').html('下一页');
                }else if(data.data.pagenum==pagetotal){
                    $('a.pre').prop('id',data.data.pagenum-1);
                    $('a.pre').html('上一页');
                    $('a.next').prop('id','');
                    $('a.next').html('');

                }else{
                    $('a.pre').prop('id',data.data.pagenum-1);
                    $('a.pre').html('上一页');
                    $('a.next').prop('id',data.data.pagenum+1);
                    $('a.next').html('下一页');

                }
                $('.userlist>ul').html(str);
                $('a.pre').css({'text-decoration':'none','cursor': 'pointer'});
                $('a.next').css({'text-decoration':'none','cursor': 'pointer'});
            }
            $('.userlist li').hover(function(){
                $(this).addClass('uh');
            },function(){
                $(this).removeClass('uh');
            });
            $('.userlist li').click(function(){
                var txt=$(this).text();
                var txtid=this.id;
                $('#targetname').val(txt);
                $('#target').val(txtid);
                $('.userlist').fadeToggle(1000);
            });

            $('.userlist a').click(function(){
                getUserList(this.id,pagesize);

            });

        });}


    $(function () {
        $('#noticy-show').addClass('clickmenu');
        $('[name="targetname"]').click(function(){
            $('.userlist').fadeToggle(1000);
            getUserList(pagenum,pagesize);
        });
        $('.dao-return').click(function(){
             history.go(-1);
        });

    })
</script>


<div id="myParCont">
    <div class="row" id="content">
        <div class="vbox col-md-8 col-md-offset-2" style="margin-top: 50px">


            <h1 align="center">发布公告</h1>
                    <!-- 基本信息填写 -->
                    <small class="text-muted m-b">
                        <form action="${ctx}/noticy/insertNoticy" class="bs-example form-horizontal" id="noticy_form"  method="post" onsubmit="return check(this)">



                            <div class="form-group">
                                <label id="name_label" class="col-lg-2 col-md-2 control-label" for="title">公告标题：</label>
                                <div class="col-lg-9 col-md-9">
                                    <input type="text" name="title" id="title" class="form-control" required="required" title="公告标题" placeholder="请输入公告标题" style="border:none;border-bottom:1px solid #000 "/>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-lg-2 col-md-2 control-label" for="targetname">选择目标：</label>
                                <div class="col-lg-9 col-md-9 myselect">
                                        <input type="text" name="targetname" id="targetname" class="form-control" placeholder="请选择目标" value="所有人" readonly/>
                                        <input type="hidden" name="target" id="target" value="0"/>
                                    <div class="userlist" >
                                        <ul>

                                        </ul>
                                        <div style="border-top:1px solid #000;" class="changepage"><a class="dao-btn pre"></a><span class="page" ></span><a class="dao-btn next"></a></div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 col-md-2 control-label" for="notice">公告内容：</label>
                                <div class="col-lg-9 col-md-9">
                                    <textarea style="height: 80px"  name="notice" id="notice" class="form-control" required="required"  title="公告内容" placeholder="请输入公告内容"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-9 col-md-offset-2 col-md-9">

                                    <button type="submit"  class="btn btn-success text-right">发布</button>
                                    <button type="button" class="btn btn-primary text-right dao-return">返回</button>
                                </div>
                            </div>
                        </form>
                    </small>
                </div>



    </div>
</div>
