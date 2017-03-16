<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script src="${ctx}/static/js/advice/advice.js"></script>
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
    var adviceurl = $_ctx + '/say/getUserAdvice';
    var deleteadviceurl = $_ctx + '/say/deleteAdvice';
    var pagenum = 1;
    var pagesize = 10;
    var getadvice = function (pagenum,pagesize) {
        $.post(adviceurl, function (data, stadius) {
            if (stadius == 'success') {
                var count = Math.ceil(data.data.total / 10);
                var start = data.data.pagenum;

                $('.advicepage').css({
                    'margin-left': '450px'
                });
                if (count >= 1) {
                    makeadvicelist(data.data.rows);
                    $(".advicepage").paginate({
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
                            getadvice(page, pagesize);
                        }
                    });
                } else {
                    $('.advicepage').html('<span style="display: block;font-family: 华文新魏 ;font-size: 25px">暂无数据</span>');
                    $('.advices').html('');
                }



            }
        })
    }


    $(function () {
        $('#advice-show').addClass('clickmenu');
        getadvice(pagenum,pagesize);

        $('.all').change(function () {
            if ($(this).context.checked == true) {
                $('.advice').prop('checked', 'checked');

            } else {
                $('.advice').prop('checked', '');
            }
        });
        $('#dao-delete').click(function () {
            var ins = $('.advice');
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
                $.post(deleteadviceurl, {
                    ids: inids
                }, function (data, stadius) {
                    if (stadius == 'success') {

                        getadvice(1, 10);
                    }
                })
            }else{

                window.wxc.xcConfirm('请选择要删除的留言！!', window.wxc.xcConfirm.typeEnum.info, {
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
    <table class="advices table table-hover table-striped">
        <caption>留言管理</caption>
        <thead>
        <tr>
            <th width="5%"><input type="checkbox" class="all"></th>
            <th width="10%">发布者</th>
            <th>发布内容</th>
            <th width="10%">发布时间</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
    <div class="advicepage"></div>
</div>