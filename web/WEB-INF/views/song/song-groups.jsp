<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<script src="${ctx}/static/js/music/music-list.js"></script>

<style type="text/css">

    .type-wrap {
        background-color: #f2f6fb;
        font-family: 华文新魏 ;
        font-size: 20px;
        margin-top: -20px;
    }

    .type {
        margin: 20px 100px;
        height: 30px;
        width: 100%;
    }

    .type > a {
        display: block;
        text-decoration: none;
        height: 30px;
        float: left;
        margin-left: 20px;

        -webkit-transition: all 1.5s ease;
        -moz-transition: all 1.5s ease;
        -o-transition: all 1.5s ease;
        transition: all 1.5s ease;
    }

    .type > a:hover {
        background-color: #000000;
        color: #FFF000;
        cursor: hand;
        border-radius: 6px;
    }

    .type > span {
        float: left;

    }

    .typeactive {
        background-color: #EC971F;
        color: white;
        border-radius: 6px;
    }
</style>

<script type="text/javascript">
    var musicurl = '${ctx}/music/groups';
    var playurl = '${ctx}/page/song-player';
    var pagenum = 1;
    var pagesize = 10;
    var country = '';
    var genre = '';
    var years = '';

    $(function () {
        $('[id=""]').addClass('typeactive');

        var getdata = function (pagesize, pagenum) {
            $.post(musicurl, {
                pagesize: pagesize,
                pagenum: pagenum,
                type: 0,
                country: country,
                genre: genre,
                years: years
            }, function (data, stadius) {
                console.info(data);
                if (stadius == 'success') {
                    var count = Math.ceil(data.data.total / 10);
                    var start = data.data.pagenum;
                    console.info(data);

                    $('.songpage').css({
                        'margin-left': '400px'
                    });
                    if (count >= 1) {
                        musiclist(data.data.rows, 0, playurl);
                        $(".songpage").paginate({
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
                                getdata(pagesize, page);
                            }
                        });
                    }else{
                        $(".songpage").html('<span style="display: block;font-family: 华文新魏 ;font-size: 25px">暂无数据</span>');
                        $('#songlist').html('');
                    }
                }
            });
        };

        getdata(pagesize, pagenum);

        $('.children-type').click(function () {
            $(this).parents('.type').find('a').removeClass('typeactive');
            $(this).addClass('typeactive');
            if ($(this).parents('.type').attr('id') == 'country') {
                country = this.id;
            } else if ($(this).parents('.type').attr('id') == 'genre') {
                genre = this.id;
            } else if ($(this).parents('.type').attr('id') == 'years') {
                years = this.id;
            }

            getdata(pagesize, pagenum);

        });
    })
</script>


<div class="type-wrap">
    <div class="type" id="country">
        <span>国家</span>
        <a class="children-type typeactive" id="">全部</a>
        <a class="children-type" id="中国">中国</a>
        <a class="children-type" id="欧美">欧美</a>
        <a class="children-type" id="日韩">日韩</a>
        <a class="children-type" id="其他国家">其它</a>
    </div>


    <div class="type" id="genre">
        <span>流派</span>
        <a class="children-type" id="">全部</a>
        <a class="children-type" id="流行">流行</a>
        <a class="children-type" id="古典">古典</a>
        <a class="children-type" id="摇滚">摇滚</a>
        <a class="children-type" id="舒情">舒情</a>
        <a class="children-type" id="怀旧">怀旧</a>
        <a class="children-type" id="其他流派">其它</a>
    </div>


    <div class="type" id="years">
        <span>年代</span>
        <a class="children-type" id="">全部</a>
        <a class="children-type" id="70年代">70</a>
        <a class="children-type" id="80年代">80</a>
        <a class="children-type" id="90年代">90</a>
        <a class="children-type" id="00年代">00</a>
        <a class="children-type" id="其他年代">其它</a>
    </div>

</div>

<div class="col-md-offset-1 col-md-10">
    <table class="table table-striped" id="songlist">
    </table>
    <div class="songpage"></div>
</div>