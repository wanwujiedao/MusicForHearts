<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script src="${ctx}/static/js/user/user.js"></script>
<style>
    .btn-bar {
        line-height: 60px;
    }

    .btn-bar > dao {
        display: block;
        width: 120px;
        line-height: 40px;
        text-align: center;
        border: 1px solid #7FFF00;
        margin: 20px;
        font-size: 20px;
        float: right;
        background-color: rgba(29, 63, 22, 0.68);
        color: #ffffff;
        cursor: pointer;
    }

    .btn-bar > dao:hover {
        background-color: #000000;
        color: #8A2BE2;
    }

    .look {
        cursor: pointer;
    }
</style>

<script>
    var userurl = $_ctx + '/user/find';
    var lhyhurl = $_ctx + '/user/lhyh';
    var qxlhurl=$_ctx+'/user/qxlh';
    var pagenum = 1;
    var pagesize = 10;
    
    var getuser = function (pagenum, pagesize) {
        $.post(userurl, function (data, stadius) {
            if (stadius == 'success') {
                var count = Math.ceil(data.data.total / 10);
                var start = data.data.pagenum;

                $('.userpage').css({
                    'margin-left': '450px'
                });
                if (count >= 1) {
                    makeuserlist(data.data.rows);
                    $(".userpage").paginate({
                        count: count,
                        start: start,
                        display: 7,
                        border: false,
                        border_color: '#fff',
                        text_color: '#4F4F4F',
                        background_color: '#EEE9E9',
                        border_hover_color: '#8B8682',
                        text_hover_color: '#fff',
                        background_hover_color: '#8B8682',
                        images: false,
                        mouse: 'press',
                        onChange: function (page) {
                            getuser(page, pagesize);
                        }
                    });
                } else {
                    $('.userpage').html('<span style="display: block;font-family: 华文新魏 ;font-size: 25px">暂无数据</span>');
                    $('#users').html('');
                }
              
            }
        })
    }


    $(function () {
        $('#user-show').addClass('clickmenu');
        getuser(pagenum,pagesize);

        $('.all').change(function () {
            if ($(this).context.checked == true) {
                $('.user').prop('checked', 'checked');

            } else {
                $('.user').prop('checked', '');
            }
        });
        $('#dao-delete').click(function () {
            var ins = $('.user');
            var inids = '';
            for (var i = 0; i < ins.length; i++) {
                if ($(ins[i]).context.checked == true) {
                    if (i < ins.length - 1) {
                        inids += $(ins[i]).parents('tr').attr('id') + '-';
                    }
                    else {
                        inids += $(ins[i]).parents('tr').attr('id');
                    }
                }
            }
            if(inids!=''){
            $.post(lhyhurl, {
                ids: inids
            }, function (data, stadius) {
                if (stadius == 'success') {
                    getuser(1,10);
                }
            }) }else{

                window.wxc.xcConfirm('请选择要拉黑的用户！!', window.wxc.xcConfirm.typeEnum.info, {
                    title: "温馨提示"
                });
            }

        });
        $('.dao-qxlh').click(function () {
            $.post(qxlhurl,{
                username:this.id
            },function(data, stadius) {
                if (stadius == 'success') {
                    getuser(1,10);
                }
            })

        });
    })
</script>


<div class="btn-bar col-md-10 col-md-offset-1">
    <dao id="dao-delete">拉黑用户</dao>
</div>
<div class="col-md-10 col-md-offset-1">
    <table class="users table table-hover table-striped">
        <caption>用户管理</caption>
        <thead>
        <tr>
            <th width="5%"><input type="checkbox" class="all"></th>
            <th width="20%">用户名</th>
            <th width="20%">真实姓名</th>
            <th width="15%">性别</th>
            <th width="20%">注册时间</th>
            <th width="20%">用户类别</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
    <div class="userpage"></div>
</div>