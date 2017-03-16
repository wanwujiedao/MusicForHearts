/**
 * Created by dzx on 2016/2/11 0011.
 */



var musiclist = function (data,type,playurl) {
//MV
    if(type==0){
        $('#player-slide').show();
    }

    var ctx=playurl.split('/')[1];

    var artistpage='/'+ctx+'/page/artist';
    var albumpage='/'+ctx+'/page/album';
    var downurl=  '/'+ctx+'/music/download';
    if (type == 1) {
        var divprefix = '<div ';
        var divsuffix = '</div>';
        var spanprefix = '<span>';
        var spansuffix = '</span>';
        var imgprefix = '<img ';
        var labelprefix = '<label>';
        var labelsuffix = '</label>';
        var fontprefix = '<font>';
        var fontsuffix = '</font>';
        var str = '';
        var count = 0;
        $.each(data, function (index, iteam) {
            count++;
            str += divprefix;
            str += 'class="mv">';
            str += divprefix;
            str += 'class="mv-cover" id="' + iteam.id + '">';
            str += imgprefix;
            str += 'src="' + iteam.posterurl + '"/>';
            str += divsuffix;
            str += divprefix;
            str += 'class="mv-name"><marquee  behavior="scroll" loop="-1" scrollamount=5>';
            str += iteam.name;
            if (iteam.artist) {
                str += '--' + iteam.artist;
            } else {
                str += '--未知';
            }
            str += '(时长:' + iteam.time + ')';
            str += '</marquee>';
            str += divsuffix;
            str += divprefix;
            str += 'class="counts">';
            str += spanprefix;
            str += fontprefix;
            str += '播放量'
            str += fontsuffix;
            str += labelprefix;
            str += iteam.playcount;
            str += labelsuffix;
            str += spansuffix;

            str += spanprefix;
            str += fontprefix;
            str += '收藏量'
            str += fontsuffix;
            str += labelprefix;
            str += iteam.collectcount;
            str += labelsuffix;
            str += spansuffix;

            str += spanprefix;
            str += fontprefix;
            str += '下载量'
            str += fontsuffix;
            str += labelprefix;
            str += iteam.downloadcount;
            str += labelsuffix;
            str += spansuffix;
            str += divsuffix;
            str += divprefix;
            str += 'class="mv-info">';
            str += iteam.info;
            str += divsuffix;
            str += divsuffix;
        });
        $('#mvlist').html(str);

//							样式设置
        var musiclistheight=(Math.ceil(count/4)*200);
        $('#mvlist').css({
            'height':musiclistheight+'px'
        });
        $('.mv-cover img').css({
            'height':'150px',
            'border-radius':'8px',
            'width':'250px'
        });
        $('.mv').css({
            'width':'250px',
            'margin': '15px 10px',
            'float': 'left',
            'height':'150px'
        });
        $('.mv-name').css({
            'position': 'relative',
            'top': '-150px',
            'width': '200px',
            'border-radius': '15px',
            'margin': 'auto',
            'text-align': 'center',
            'background-color': '#CCCCCC',
            'opacity':'0.6'
        });
        $('.counts').css({
            'position': 'relative',
            'top': '-20px',
            'width': '240px',
            'margin': ' auto',

        });
        $('.counts label').css({
            'display': 'none'
        });
        $('.counts>span').css({
            'display': ' block',
            'float': ' left',
            'text-align': ' center',
            'width': ' 80px'
        });
        $('.mv-info').css({
            'background-color': ' #CD96CD',
            'position': 'relative',
            'top': '-42px',
            'float':'left',
            'border-radius': '8px ',
            'z-index':999,
            'display': 'none'
        });


//			事件
        $('.counts>span').hover(function(){
            $(this).find('font').hide();
            //$(this).show();
            $(this).find('label').fadeIn(1000);
        },function(){
            $(this).find('label').hide();
            $(this).find('font').fadeIn(1000);
        });

        $('.mv-cover').hover(function(){
            $(this).parents('.mv').find('.mv-info').slideDown();
            $(this).css({
                'cursor':'hand',
                'transform': 'scale(1.1)',
            });
            $('.mv-info').css({
                'transform': 'scale(1.1)',
            });
        },function(){
            $(this).parents('.mv').find('.mv-info').slideUp();
            $(this).css({'cursor':'pointer'});

            $('.mv-info').css({
                'transform': 'scale(1)',
            });
            $(this).css({
                'transform': 'scale(1)',
                'z-index':'0'
            });

        }).stop(true,true);

//							播放
        $('.mv-cover').click(function(){
            location.href=playurl+'?id='+this.id;
        });

    }

//歌曲
    else {
    var songstr='<tr><th>播放状态</th><th>歌曲名称</th><th>歌手名称</th><th>专辑名称</th><th>时长</th><th>下载</th></tr>';
        $.each(data, function (index, iteam) {
            songstr+='<tr><td class="isplay" id="'+iteam.name+'" url="'+iteam.url+'"><span class="glyphicon glyphicon-play"></span></td><td id="'+iteam.id+'" class="song">'+iteam.name+'</td><td  id="'+iteam.artistid+'" class="artist">'+iteam.artistname+'</td><td class="album" id="'+iteam.albumid+'">'+iteam.albumname+'</td><td class="song-time">'+iteam.time+'</td><td><a class="download-music"><span class="glyphicon glyphicon-download-alt"></span></a></td></tr>';
        });
        $('#songlist').html(songstr);


        $('td').css({
            'text-align':'center',
            'cursor': 'hand'
        });
        $('.song-time').css({
            'cursor': 'pointer !important'
        });
        $('th').css({
            'text-align':'center'
        });
        $('.download-music').css({
            'color':'#FFF000'
        });
        //事件

        //下载
        $('.download-music').click(function(){
            var music_id=$(this).parents('tr').find('.song')[0].id;
            window.open(downurl+'?id='+music_id);
        });
        //本页面播放
        $('.isplay').click(function(){
            if( $(this).find('span').attr('class')=='glyphicon glyphicon-play'){
                $('.isplay').find('span').prop('class','glyphicon glyphicon-play');
                $(this).find('span').prop('class','glyphicon glyphicon-pause');

                var song_id=$(this).parents('tr').find('.song').attr('id');

                var song_name=this.id;
                var song_artist=$(this).parents('tr').find('.artist').text();
                var song_url=$(this).attr('url');
               var song = {
                    'song_id':song_id ,
                    'title': song_name,
                    'artist': song_artist,
                    'mp3':song_url
                }
                addToPlayList(song);
                $('#player-slide').prop('class','player-hide');
                $('#player-slide').find('span').prop('class','glyphicon glyphicon-chevron-down');
                $(".player-wrap").animate({
                    'bottom': '0px'
                });

            }else{
                $(this).find('span').prop('class','glyphicon glyphicon-play');
                $("#jplayer_N").jPlayer('pause');
                $('#player-slide').prop('class','player-show');
                $('#player-slide').find('span').prop('class','glyphicon glyphicon-chevron-up');
                $(".player-wrap").animate({
                    'bottom': '-60px'
                });

            }
        });
        //跳到单独播放页面
        $('.song').click(function(){
            location.href=playurl+'?id='+this.id;
        });

        //跳到专辑界面
        $('.album').click(function(){
            location.href=albumpage+'?albumid='+this.id;
        });


        //跳到歌手界面
        $('.artist').click(function(){
            location.href=artistpage+'?id='+this.id;
        });


    }


}
