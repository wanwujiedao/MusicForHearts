/**
 * Created by admin on 2016/5/27.
 */

var makemusic = function (mydata) {
    var str = '';


    $.each(mydata, function (index, item) {
        str += '<tr id="' + item.id + '" >';

            str += ' <td><input type="checkbox" class="music"></td>   <td class="look">' + item.name+ '</td><td class="look">' + item.artistname + '</td><td class="look">';
        if(item.type==1){
            str+='MV';

        }else{
            str+='歌曲';
        }

            str += '</td><td class="music-edit"><img src="/sources/otherimg/1187318.png" style="width: 18px"/></td>      </tr>';

    });
    $('.music-list tbody').html(str);
    $('.music-edit').css({
        'cursor': 'pointer'
    })
    $('.can-not').css({
        'cursor': 'not-allowed'
    })


    $('.music').parents('table').find('th').css({
        'text-align': 'center'
    })
    $('td').css({
        'text-align': 'center'
    })

    $('.look').click(function () {
        $('.music-wrap').show();
        $('.music-wrap').animate({'left': '0px'});
        $('tr').removeClass('addClick');
        $(this).parents('tr').addClass('addClick');
        $.post($_ctx + '/music/toPlay', {
            id: $(this).parents('tr').attr('id')
        }, function (data, stadius) {
            if (stadius == 'success') {

                dealMusicMsg(data);
            }

        });

    });
    $('.music-dao .btn-dao').click(function () {
        $('.music-wrap').animate({'left': '100%'});
        $('tr').removeClass('addClick');
        $('.music-wrap').hide(500);
    });
    $('.music-edit').click(function () {
        location.href = $_ctx + '/manage/music-edit?id=' + $(this).parents('tr').attr('id');
    });
}
var dealMusicMsg=function (music_data){
    //歌曲名称
    if(music_data.name!=null&&music_data.name!=''){
        $('.music-detail h2').text(music_data.name);
    }else{
        $('.music-detail h2').text('未知');
    }

    //歌曲类型
    if(music_data.type==1){
        $('#music-type span').text('音乐类型：MV');
    }else{
        $('#music-type span').text('音乐类型：歌曲');

    }

    //歌手
    if(music_data.artistname!=''&&music_data.artistname!=''){
        $('#music-artist span').text('歌手：'+music_data.artistname);
    }else{
        $('#music-artist span').text('歌手：不详');
    }
    //专辑
    if(music_data.albumname!=''&&music_data.albumname!=''){
        $('#music-album span').text('专辑：'+music_data.albumname);
    }else{
        $('#music-album span').text('专辑：不详');
    }
    //播放量
    if(music_data.playcount!=''&&music_data.playcount!=''){
        $('#music-playcount span').text('播放量：'+music_data.playcount);
    }else{
        $('#music-playcount span').text('播放量：0');
    }

    //收藏量
    if(music_data.collectcount!=''&&music_data.collectcount!=''){
        $('#music-collectcount span').text('收藏量：'+music_data.collectcount);
    }else{
        $('#music-collectcount span').text('收藏量：0');
    }
    //下载量
    if(music_data.downloadcount!=''&&music_data.downloadcount!=''){
        $('#music-downloadcount span').text('下载量：'+music_data.downloadcount);
    }else{
        $('#music-downloadcount span').text('下载量：0');
    }
    //时长
    if(music_data.time!=''&&music_data.time!=''){
        $('#music-time span').text('时长：'+music_data.time);
    }else{
        $('#music-time span').text('时长：——：——');
    }
    //音乐简介
    if(music_data.info!=''&&music_data.info!=''){
        $('#music-info span').html('&nbsp;&nbsp;&nbsp;&nbsp;'+music_data.info);
    }else{
        $('#music-info span').html('');
    }

    //封面
    if (music_data.posterurl != null && music_data.posterurl  != '') {
        $('#music-avatar img').prop('src', music_data.posterurl );
    } else {
        $('#music-avatar img').prop('src', '/sources/useravatar/default_avatar');
    }

    //创建时间
    if(music_data.releasetime!=''&&music_data.releasetime!=null){
        $('.releasetime').text('发布时间：'+music_data.releasetime);
    }
}