<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script src="${ctx}/static/js/complain/complain.js"></script>
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
    var complainurl = $_ctx + '/say/getComplain';
    var deletecomplainurl = $_ctx + '/say/deleteComplain';
    var pagenum = 1;
    var pagesize = 10;
    var getcomplain = function (pagenum,pagesize) {
        $.post(complainurl, function (data, stadius) {
            if (stadius == 'success') {
                       var count = Math.ceil(data.data.total / 10);
                        var start = data.data.pagenum;

                        $('.complainpage').css({
                            'margin-left': '450px'
                        });
                        if (count >= 1) {
                            makecomplainlist(data.data.rows);
                            $(".complainpage").paginate({
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
                                    getcomplain(page, pagesize);
                                }
                            });
                        } else {
                            $('.complainpage').html('<span style="display: block;font-family: 华文新魏 ;font-size: 25px">暂无数据</span>');
                            $('.complains').html('');
                        }

                    }
                })
               

    }


    $(function () {
        $('#complain-show').addClass('clickmenu');
        getcomplain(pagenum,pagesize);

        $('.all').change(function () {
            if ($(this).context.checked == true) {
                $('.complain').prop('checked', 'checked');

            } else {
                $('.complain').prop('checked', '');
            }
        });
        $('#dao-delete').click(function () {
            var ins = $('.complain');
            var inids = '';
            for (var i = 0; i < ins.length; i++) {
                if ($(ins[i]).context.checked == true) {
                    if (i < ins.length - 1) {
                        inids += $(ins[i]).parents('tr').attr('id') + '-';
                    }
                    else {
                        inids +=$(ins[i]).parents('tr').attr('id');
                    }
                }
            }
            if(inids!='') {
                $.post(deletecomplainurl, {
                    ids: inids
                }, function (data, stadius) {
                    if (stadius == 'success') {
                        getcomplain(1, 10);
                    }
                })
            } else{

            window.wxc.xcConfirm('请选择要删除的举报信息！!', window.wxc.xcConfirm.typeEnum.info, {
                title: "温馨提示"
            });
        }
        });

    })
</script>


<div class="btn-bar col-md-10 col-md-offset-1">
    <dao id="dao-delete">删除</dao>
</div>
<div class="col-md-10 col-md-offset-1">
    <table class="complains table table-hover table-striped">
        <caption>举报管理</caption>
        <thead>
        <tr>
            <th width="5%"><input type="checkbox" class="all"></th>
            <th width="15%">举报类别</th>
            <th width="15%">举报对象</th>
            <th width="55%">举报内容</th>
            <th width="10%">举报时间</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
    <div class="complainpage"></div>
</div>