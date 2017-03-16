<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<link href="${ctx}/static/css/artist/artist-list.css" rel="stylesheet">


<div id="artist_content">
    <div class="artist_search">

        <div class="input-group">

            <input id="artist_keyword" type="text" class="form-control" name="keyword"
                   placeholder="请输入搜索内容" value=""> <span class="input-group-btn">

						<button type="button" class="btn btn-link" id="searchartist">
                            <span class="glyphicon glyphicon-search"></span>
                        </button>
					</span>
        </div>

    </div>

    <div class="artist_list">
    </div>
    <div class="page"></div>
</div>

<div id="artist_country">
    <a>全部</a>
    <a>中国</a>
    <a>欧美</a>
    <a>日韩</a>
    <a>其它</a>
</div>

<script type="text/javascript">
    var artisturl = '${ctx}/artist/';
    var artistpage = '${ctx}/page/artist';
    var pagenum = 1;
    var pagesize = 5;
    var country = '';
    var search = '';
    var getartist = function (pagesize, pagenum, country, tourl, search) {

        $.post(artisturl + tourl, {
            pagesize: pagesize,
            pagenum: pagenum,
            country: country,
            search: search
        }, function (data, stadius) {
            if (stadius == 'success') {
                var count = Math.ceil(data.data.total / 5);
                var start = data.data.pagenum;
                console.info(data)

                $('.page').css({
                    'margin-left': '400px'
                });
                if (count >= 1) {
                    artistlist(data, artistpage);
                    $(".page").paginate({
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
                            getartist(pagesize, page, country, tourl, search);
                        }
                    });
                }
            }else{
                $('.page').html('<span style="display: block;font-family: 华文新魏 ;font-size: 25px">暂无数据</span>');
                $('.artist_list').html('')
            }
        });
    }


    var artistlist = function (data, artistpage) {
        var artists = data.data.rows;
        var str = '';
        $.each(artists, function (index, iteam) {
            str += '<div class="artist" id="' + iteam.id + '">' +
                    '<div class="artist_img" >' +
                    '<img src="' + iteam.imgurl + '" />' +
                    '</div>' +
                    '<div class="artist_name">' + iteam.name + '</div>' +
                    '</div>';
        });
        $('.artist_list').html(str);
        $('.artist').css({
            'float': 'left',
            'margin-left': '20px'
        })
        $(' .artist_img>img').css({
            'width': '150px',
            'height': '150px',
            'border-radius': '50%',
            'border': '1px solid #0D3349'
        })
        $(' .artist_name').css({
            'width': '150px',
            'margin-top': '30px',
            'text-align': 'center'
        })

//        事件
        $('.artist').click(function () {
            location.href = artistpage + '?id=' + this.id;
        });
    }


    $(function () {
        getartist(pagesize, pagenum, country, 'findArtist', search);

        $('#searchartist').click(function () {
            search = $('#artist_keyword').val();
            $('#artist_country>a').removeClass('artist_country-a-click');
            console.info(search);
            if (search != '') {
                getartist(pagesize, pagenum, country, 'search', search);
            } else {
                window.wxc.xcConfirm('请输入搜索内容！！', window.wxc.xcConfirm.typeEnum.error, {
                    title: "温馨提示"
                });
            }
        });


        $('#artist_country>a').eq(0).addClass('artist_country-a-click');
        $('#artist_country>a').click(function () {
            $('#artist_country>a').removeClass('artist_country-a-click');
            $(this).addClass('artist_country-a-click');
            if ($(this).text() == '全部') {
                country = '';
            } else {
                country = $(this).text();
            }

            getartist(pagesize, pagenum, country, 'findArtist', search);
        });
    })
</script>
