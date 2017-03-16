<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<style>
    .advice_wrap {
        width: 100%;
        height: 720px;
        padding-top: 160px;
        background: -webkit-linear-gradient(left, #1aa298, #cdc851);
        /* Safari 5.1 - 6.0 */
        background: -o-linear-gradient(right, #1aa298, #cdc851);
        /* Opera 11.1 - 12.0 */
        background: -moz-linear-gradient(right, #1aa298, #cdc851);
        /* Firefox 3.6 - 15 */
        background: linear-gradient(to right, #1aa298, #cdc851);
    }

    .advice {
        padding-top: 50px;
        width: 700px;
        margin: auto;
        height: 430px;
    }

    .advice_title > span {
        display: block;
        font-weight: bold;
        font-size: 20px;
        color: #464646;
    }

    .advice_text {
        width: 85%;
        margin: auto;
    }

    #advice {
        width: 120px;
        line-height: 25px;
        border-radius: 20px;
        float: right;
        transition: 0.2s ease-out;
        -moz-transition: 0.2s ease-out;
        -webkit-transition: 0.2s ease-out;
    }

    #advice:hover {
        transform: scale(0.9);
        -ms-transform: scale(0.9);
        -moz-transform: scale(0.9);
        -webkit-transform: scale(0.9);
    }
</style>

<script type="text/javascript">

        function checkadvice() {
            if (currentUser[0]!= null &&currentUser[0]!= '') {
                $('#userid').val(currentUser[0].id);
                console.info($('#content').val())
                if($('#content').val()!=''){

                   return true;
                }else{
                    window.wxc.xcConfirm('评价信息：尊敬的用户，请输入评价内容！', window.wxc.xcConfirm.typeEnum.warning, {
                        title: "小提醒"
                    });
                    return false;
                }

            } else {

                window.wxc.xcConfirm('评价信息：尊敬的用户，您尚未登录，不能对网站做出评价！', window.wxc.xcConfirm.typeEnum.error, {
                    title: "小提醒",
                    onOk:function(v) {
                        $('#login-wrap').fadeIn(1200);
                    }
                });
                return false;
            }


        }
</script>

<div class="advice_wrap">
    <div class="advice">
        <div class="advice_title">

            <span>您的评价使我们进步的动力，您的建议使我们进步的源泉！</span>
            <br>
        </div>
        <form id="myapply_form" action="${ctx}/say/insertAdvice" method="post" onsubmit="return checkadvice()">
            <div class="form-group" style="display: none">
                <label class="col-lg-2 col-md-2 control-label" for="userid">用户ID：</label>

                <div class="col-lg-9 col-md-9">

                    <input type="text" name="userid" id="userid" class="form-control"  title="用户ID"/>
                </div>
            </div>

            <div class="advice_text">
                <div class="col-md-11">
                    <textarea name="content" id="content" type="text"  class="form-control" placeholder="请输入评价内容"
                              title="评价内容" rows="5"></textarea>
                </div>

            </div>
            <input type="submit" name="submit" class="btn btn-success" id="advice" value="送出"/>
        </form>
    </div>
</div>

