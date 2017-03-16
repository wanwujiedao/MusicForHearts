<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<style>
    .complain {
        background-image: url(/sources/otherimg/complain.jpg);
        width: 100%;
        height: 700px;
    }

    .noticy {
        display: block;

        position: relative;
        top: 200px;
        color: #FFFFFF;
    }

    .noticy p {
        line-height: 20px;
        transition: 0.2s ease-out;
        -moz-transition: 0.2s ease-out;
        -webkit-transition: 0.2s ease-out;
    }

    .noticy p:hover {
        color: #000000;
        width: auto;
        transform: scale(1.05);
        -ms-transform: scale(1.05);
        -moz-transform: scale(1.05);
        -webkit-transform: scale(1.05);
        background-color: #BCE8F1;
    }

    #complain {
        position: relative;
        top: 200px;
        color: #ffffcc;
        font-size: 18px;
        display: none;
    }

    div.objname span,
    .objname {
        display: none;
    }

    #submit, #button {
        position: relative;
        top: 20px;
        transition: 0.2s ease-out;
        -moz-transition: 0.2s ease-out;
        -webkit-transition: 0.2s ease-out;
    }

    #submit {
        background-color: #528B8B;
    }

    #submit:hover, #button:hover {
        color: #000000;
        transform: scale(1.2);
        -ms-transform: scale(1.2);
        -moz-transform: scale(1.2);
        -webkit-transform: scale(1.2);
        background-color: #97FFFF;
    }
</style>

<script type="text/javascript">
    $(function () {
        $('#enter').click(function () {
            $('.noticy').slideUp();
            $('#complain').slideDown();
        });
        $('#button').click(function () {

            $('#complain').slideUp();
            $('.noticy').slideDown();
        });

        $('#obj').on('change', function () {
            var keyvalue = '.objname' + $(this).val();
            if ($(this).val() == 0) {
                $('.objname').fadeOut();
                $(keyvalue).fadeOut();
            } else {

                $('.objname span').hide("fast");
                $('.objname').show();
                $(keyvalue).show();
            }
        });
    });
    function checkcom(){
        var obj=$('#obj').val();
        var objname=$('#objname').val();
        var content=$('#content').val();
        if(obj==0){
            $('#obj').focus();
            window.wxc.xcConfirm('评价信息：尊敬的用户，请选择举报对象！', window.wxc.xcConfirm.typeEnum.warning, {
                title: "小提醒"
            });
            return false;
        }
        if(objname==''){
            $('#objname').focus();
            window.wxc.xcConfirm('评价信息：尊敬的用户，请选择举报标志！', window.wxc.xcConfirm.typeEnum.warning, {
                title: "小提醒"
            });
            return false;
        }
        if(content==''){
            $('#content').focus();
            window.wxc.xcConfirm('评价信息：尊敬的用户，请选择举报详细内容！', window.wxc.xcConfirm.typeEnum.warning, {
                title: "小提醒"
            });
            return false;
        }
        return true;
    }
</script>

<div class="complain">
    <div class="row col-md-10 col-md-offset-1 ">
			<span class="noticy col-md-offset-2">
				<p>举报须知：请各位MUSIC好友带着认真负责的态度来到此页面，你们的支持是我们勇往直前的向导，下面将介绍举报内容。</p>
				<p>1).举报对象有三类，即MUSIC工作团队，所有用户，以及网站资源。</p>
				<p>2).MUSIC工作团队利用在该网页，但凡有危害他人利益，可举报。</p>
				<p>3).MUSIC用户在该网站辱骂他人，发布不良信息，窃取商业机密，可举报。</p>
				<p>4).MUSIC网站上存在不良信息，如色情、暴力，违反国家法律规定内容，可举报。</p>
				<p>5).所有举报，都会进行详细审查，慎重处理。</p>
				<p>6).建立举报机制，目的是为了监督MUSIC工作人员，以及支持净网行动。</p> <font size="4">举报入口<i
                    class="fa  fa-hand-o-right"></i></font><a class="btn" id="enter"><font
                    color="#FF0000">请点击</font></a>
			</span>

        <div id="complain">
            <form action="${ctx}/say/insertComplain" method="post" class="form form-horizontal" accept-charset="UTF-8" onsubmit="return checkcom()">
                <div class="form-group">
                    <label class="control-label col-md-5" for="obj"> 请选择举报对象：
                    </label>

                    <div class="col-md-5">
                        <select name="obj" id="obj" class="form-control">
                            <option value="0">---请选择---</option>
                            <option value="1">MUSIC工作人员</option>
                            <option value="2">MUSIC用户</option>
                            <option value="3">MUSIC网站内容</option>
                        </select>
                    </div>
                </div>

                <div class="form-group objname">
                    <label class="control-label col-md-5" for="objname"> <span
                            class="objname1"> 请输入举报的MUSIC工作室工作人员的工作号： </span> <span
                            class="objname2"> 请输入举报的MUSIC网站用户的用户名： </span> <span
                            class="objname3"> 请输入举报的MUSIC网站的网址： </span>
                    </label>

                    <div class="col-md-5">
                        <input type="text" name="objname" id="objname" value=""
                               class="form-control"/>
                    </div>
                </div>

                <div class="objcontent form-group">
                    <label class="control-label col-md-5" for="objcontent">请输入举报的详细信息：</label>

                    <div class="col-md-5">
							<textarea name="objcontent" id="content" rows="5" cols="4" id="objcontent"
                                      class="form-control"></textarea>
                    </div>
                </div>
                <div class="col-md-2 col-md-offset-5">
                    <input type="submit" value="提交" class="btn btn-block"
                           name="submit" id="submit"/>
                </div>
                <div class="col-md-2 ">
                    <input type="button" value="举报须知"
                           class="btn btn-block btn-warning" name="button" id="button"/>
                </div>
            </form>
        </div>

    </div>

</div>