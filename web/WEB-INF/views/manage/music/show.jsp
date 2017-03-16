<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script src="${ctx}/static/js/music/music.js"></script>
<link rel="stylesheet" href="${ctx}/static/css/music/music.css"/>

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

    table {
        margin-top: -40px;
    }

    .look {
        cursor: pointer;
    }
</style>
<script>
    var getmusic = $_ctx + '/music/findMusicInfo';
    var deletemusicurl = $_ctx + '/music/deletemusic'
    var pagenum = 1;
    var pagesize = 10;

    var getmusicdata = function (pagenum, pagesize) {
        $.post(getmusic, {

            pagesize: pagesize,
            pagenum: pagenum,

        }, function (data, stadius) {
            if (stadius == 'success') {
                var count = Math.ceil(data.data.total / 10);
                var start = data.data.pagenum;
                $('.musicpage').css({
                    'margin-left': '450px'
                });
                if (count >= 1) {
                    makemusic(data.data.rows);
                    $(".musicpage").paginate({
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
                            getmusicdata(page, pagesize);
                        }
                    });
                } else {
                    $('.musicpage').html('<span style="display: block;font-family: 华文新魏 ;font-size: 25px">暂无数据</span>');
                    $('.musics').html('');
                }
            }

        })

    }


    $(function () {
        $('#music-show').addClass('clickmenu');
        $('.music-shadow').css({
            'position': 'fixed',
            'width': '100%',
            'height': ($(document).height()) + 'px',
            'background-color': '#A5A5A5',
            'opacity': '0.3',
            'top': '0px',

        });
        getmusicdata(pagenum, pagesize);

        $('.all').change(function () {
            if ($(this).context.checked == true) {
                $('.music').prop('checked', 'checked');

            } else {
                $('.music').prop('checked', '');
            }
        });
        $('#dao-delete').click(function () {
            var ins = $('.music');
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
                $.post(deletemusicurl, {
                    ids: inids
                }, function (data, stadius) {
                    if (stadius == 'success') {
                        getmusicdata(1, 10);
                    }
                }) }else{

                window.wxc.xcConfirm('请选择要删除的通知信息！!', window.wxc.xcConfirm.typeEnum.info, {
                    title: "温馨提示"
                });
            }

        });

        $('#dao-add').click(function () {
            location.href=$_ctx+'/manage/music-add';
        });
    })

</script>


<div class="btn-bar col-md-10 col-md-offset-1">
    <dao id="dao-add">新增</dao>
    <dao id="dao-delete">删除</dao>
</div>
<div class="music-list col-md-10 col-md-offset-1">
    <table class="table table-striped table-hover musics">
        <caption>音乐管理</caption>
        <thead>
        <tr>
            <th><input type="checkbox" class="all"></th>
            <th width="40%">音乐名称</th>
            <th>歌手</th>
            <th>音乐类型</th>
            <th>修改</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
    <div class="musicpage"></div>
</div>