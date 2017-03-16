<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<script src="${ctx}/static/js/noticy/noticylist.js"></script>
<link rel="stylesheet" href="${ctx}/static/css/noticy/noticy.css"/>

<script>
    var getnoticy = $_ctx + '/noticy/find';
    var pagenum = 1;
    var pagesize = 10;

    var getnoticydata = function (pagenum, pagesize) {
        $.post(getnoticy, {
            userid: 0,
            pagesize: pagesize,
            pagenum: pagenum,

        }, function (data, stadius) {
            if (stadius == 'success') {
                var count = Math.ceil(data.data.total / 10);
                var start = data.data.pagenum;

                $('.noticypage').css({
                    'margin-left': '450px'
                });
                if (count >= 1) {
                    noticylist(data.data.rows,0);
                    $(".noticypage").paginate({
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
                            getnoticydata( page,pagesize);
                        }
                    });
                } else {
                    $('.noticypage').html('<span style="display: block;font-family: 华文新魏 ;font-size: 25px">暂无数据</span>');
                    $('#noticy-list').html('');
                }
            }

        })

    }


    $(function () {
        $('.noticy-shadow').css({
            'position': 'fixed',
            'width': '100%',
            'height': ($(document).height()) + 'px',
            'background-color': '#A5A5A5',
            'opacity': '0.3',
            'top': '0px',

        });
        getnoticydata(pagenum, pagesize);


    })

</script>

<div class="noticy-wrap">
    <div class="noticy-shadow">
    </div>
    <div class="noticy-detail">
        <h2 style="text-align: center;color: #FF0000"></h2>
        <hr>
        <div class="noticy-cont" style="color: #FFFFFF"></div>
        <hr>
        <div class="noticy-dao"><span class="releasetime col-xs-5 "></span><span class="noticy-creator col-xs-3 "></span><span class="col-xs-3 col-xs-offset-1 btn-dao">确定</span></div>
    </div>
</div>
<div class="noticy-list col-md-10 col-md-offset-1">
    <table class="table table-striped table-hover" id="noticy-list">

    </table>
    <div class="noticypage"></div>
</div>