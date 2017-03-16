<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<script type="text/javascript">
    var artisturl = '${ctx}/artist/';
    var artistpage = '${ctx}/page/artist';
    var getartist = function (tourl) {

        $.post(artisturl + tourl, {
            num: 5
        }, function (data, stadius) {
            if (stadius == 'success') {
            artistlist(data, artistpage)
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
            'margin-left': '45px'
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


        $('#getartrd').click(function () {
            getartist('/findArtistByRadom');
        });

    });


</script>

<style>
    #getartrd {
        cursor: hand;
    }
    .artist_list{
        margin-left: 150px;
    }
</style>

<div class="row" style="margin-top: 30px">
    <div class="home-bar home-artist"><span id="getartrd">歌手推荐</span></div>
<div class="artist-wrap">

        <div class="artist_list">
        </div>

</div>
</div>