
 var myPlaylist;
 //歌曲详细中点击播放
  //播放音乐
  function play_inplayinfo(){
	  var songinfo=eval(songinfo_json);
	  //播放列表,并播放
	//  myPlaylist.add(songinfo,[true]);
	  
	  
	  //播放单首音乐
      $("#jplayer_N").jPlayer("setMedia",songinfo);
      $("#jplayer_N").jPlayer("play");
	  
  }


$(document).ready(function() {
    var pllist = [];
    if (typeof(mystrplaylist) == "undefined") {

        //pllist = [{
        //    song_id: 1,
        //    title: "Otherworld",
        //    artist: "ADG3 Studios",
        //    mp3: "/sources/music/Otherworld-WVLF.mp3",
        //    poster: "/sources/image/a0.png"
        //},
        //    {
        //        song_id: 2,
        //        title: "Sunburst",
        //        artist: "Studios",
        //        mp3: "/sources/music/Tobu-Itro-Sunburst.mp3",
        //        poster: "/sources/image/a1.png"
        //    }];


    } else {
        pllist = eval(mystrplaylist);
    }
    myPlaylist = new jPlayerPlaylist({
        jPlayer: "#jplayer_N",
        cssSelectorAncestor: "#jp_container_N"
    }, pllist, {
        playlistOptions: {
            enableRemoveControls: true,
            autoPlay: false,
            shuffleOnLoop: true
        },
        swfPath: "js/jPlayer",
        supplied: "webmv, ogv, m4v, oga, mp3",
        smoothPlayBar: true,
        keyEnabled: true,
        audioFullScreen: false
    });





    $(document).delegate($.jPlayer.event.pause, myPlaylist.cssSelector.jPlayer, function () {
        $('.musicbar').removeClass('animate');
        $('.jp-play-me').removeClass('active');
        $('.jp-play-me').parent('li').removeClass('active');
    });

    $(document).delegate($.jPlayer.event.play, myPlaylist.cssSelector.jPlayer, function () {
        $('.musicbar').addClass('animate');
    });

    $(document).delegate('click', '.jp-play-me', function (e) {
        e && e.preventDefault();
        var $this = $(e.target);
        if (!$this.is('a')) $this = $this.closest('a');

        $('.jp-play-me').not($this).removeClass('active');
        $('.jp-play-me').parent('li').not($this.parent('li')).removeClass('active');

        $this.toggleClass('active');
        $this.parent('li').toggleClass('active');
        if (!$this.hasClass('active')) {
            myPlaylist.pause();
        } else {
            //var i = Math.floor(Math.random() * (1 + 7 - 1));
            //myPlaylist.play(i);

            //添加到播放列表
            //myPlaylist.add({
            //   title: "Your Face",
            //   artist: "The Stark Palace",
            //   mp3: "http://www.jplayer.org/audio/mp3/TSP-05-Your_face.mp3",
            //   oga: "http://www.jplayer.org/audio/ogg/TSP-05-Your_face.ogg",
            //   poster: "http://www.jplayer.org/audio/poster/The_Stark_Palace_640x360.png"
            //
            // },[true]);


            //设置播放列表
            //var str=[{
            //  title:"Bright - 逢うたび好きになって",
            //  artist:"ADG3 Studios",
            //  mp3:"mp3/Bright - 逢うたび好きになって.mp3",
            //  poster: "images/m0.jpg"
            //},
            //  {
            //    title:"Prayer In C",
            //    artist:"Studios",
            //    mp3:"mp3/Lilly Wood & The Prick,Robin Schulz - Prayer In C.mp3",
            //    poster: "images/m0.jpg"
            //  }];
            //myPlaylist.setPlaylist(eval(str));


            ////播放列表的长度
            ////alert(myPlaylist.playlist.length);
            //
            //
            var music_url = $this.data("music_url");
            //播放单首音乐
            $("#jplayer_N").jPlayer("setMedia", {
                mp3: music_url
            });
            $("#jplayer_N").jPlayer("play");


        }

    });


//测试，可以这样获取当前播放时间
    $("#jplayer_N").bind($.jPlayer.event.timeupdate, function (event) {
        //console.log("Play began at time = " + event.jPlayer.status.currentTime);
    });

//播放事件，可以在这里向服务器，发起请求，更新歌曲的播放量


    //根据歌曲url查找，可能会有相同url的,会查找错误
    $("#jplayer_N").bind($.jPlayer.event.play, function (event) {
        //可以拿到播放音乐的url
        console.log("我被播放了:" + event.jPlayer.status.src);

        var play_song_id=event.jPlayer.status.media.song_id;
        console.info(event.jPlayer.status);
        $.each(myPlaylist.playlist, function (i, n) {
            if (n.song_id == play_song_id) {
                console.info("播放歌曲id:" + play_song_id);



                //sort
                //如果当前播放的歌曲不是被激活的music sort,sort取消激活
                if($('.jp-music-sort').length>0){
                    var actSort=$('.jp-music-sort.active');
                    if(actSort.data("song_id")!= n.song_id){
                        //取消激活
                        actSort.removeClass("active");
                        actSort.parent('div').parent('div').removeClass('active');
                    }
                }


               

            }
        });

        //去播放列表中查找，找到对应的song_id
        //ajax请求，更新播放数量，更新用户的播放数量
//    $.post(baseurl+"/music/updateSongPlayCount",{
//        song_url:event.jPlayer.status.src
//      },function(data,status){
//    	  console.log("Data: " + data + "\nStatus: " + status);
//
//      });

    });


    //这是我自定义的事件，index是要移除的播放列表myPlaylist中的下标，可以获取到要移除歌曲的url，然后向服务器发请求，移除播放列表中的歌曲
    $("#jplayer_N").bind("myevent", function (event, index) {
        //playlist是歌曲的Json对象
        var playlistitem = myPlaylist.playlist[index];
        console.log("被移除播放列表的歌曲的songid为:" + playlistitem.song_id);

    });






    //$(document).delegate('.jp-play-discover', 'click', function (e) {
    //    e && e.preventDefault();
    //    var $this = $(e.target);
    //    if (!$this.is('a')) $this = $this.closest('a');
    //
    //    //判断以前是否处于激活状态
    //
    //    //alert($this.hasClass("active"));
    //    var state = $this.hasClass("active");
    //
    //    if (state) {
    //        //true，播放音乐.
    //        var song_id = $this.data("song_id");
    //
    //        //通过url和discoverlist进行匹配，找到歌的详细信息
    //        var discovers = eval(discoverlist);
    //        $.each(discovers, function (n, value) {
    //            if (value.song_id == song_id) {
    //                console.log("下标：" + n);
    //                var discover_item = discovers[n];
    //                addToPlayList(discover_item);
    //            }
    //        });
    //
    //
    //    } else {
    //        //false，暂停音乐
    //        $("#jplayer_N").jPlayer("pause");
    //    }
    //
    //    //其它item的播放按钮都要取消激活
    //    //其它的父级的父级取消激活
    //    $('.jp-play-discover').not($this).removeClass('active');
    //    $('.jp-play-discover').parent('div').parent('div').not($this.parent('div').parent('div')).removeClass("active");
    //
    //
    //    //把自己的父级的父级激活
    //    $this.parent('div').parent('div').toggleClass('active');
    //
    //});


    //New Songs
    //$(document).delegate('.jp-play-newsongs', 'click', function (e) {
    //    e && e.preventDefault();
    //    var $this = $(e.target);
    //    if (!$this.is('a')) $this = $this.closest('a');
    //
    //
    //    //取消所有discover中所有激活状态
    //    $('.jp-play-discover').removeClass('active');
    //    $('.jp-play-discover').parent('div').parent('div').removeClass('active');
    //
    //
    //    var song_id = $this.data("song_id");
    //
    //
    //    var newsongs = eval(newsonglist);
    //
    //
    //        $.each(newsongs, function (n, value) {
    //            if (value.song_id == song_id) {
    //                console.log("下标：" + n);
    //                var newsong_item = newsongs[n];
    //
    //                addToPlayList(newsong_item);
    //            }
    //        });
    //
    //
    //
    //});


//music sort
    $(document).delegate('.jp-music-sort', 'click', function (e) {
        console.info("我被点击了");
        e && e.preventDefault();
        var $this = $(e.target);
        if (!$this.is('a')) $this = $this.closest('a');

        var state = $this.hasClass("active");

        //

        $('.jp-music-sort').removeClass('active');
        $('.jp-music-sort').parent('div').parent('div').removeClass('active');

        var song_id = $this.data("song_id");


        var music_sorts = eval(music_sortlist);
        if(state) {
            $(this).addClass('active');
            $(this).parent('div').parent('div').addClass("active");
            $.each(music_sorts, function (n, value) {
                if (value.song_id == song_id) {
                    console.log("下标：" + n);
                    var music_sort_item = music_sorts[n];

                    //添加到播放列表
                     addToPlayList(music_sort_item);


                }
            });
        }else {

            //false，暂停音乐
            $("#jplayer_N").jPlayer("pause");
        }
    });


    //allsong和album
    $(document).delegate('.song_item', 'click', function (e) {
        console.info("播放。我被点击了");
        //e && e.preventDefault();
        var $this = $(e.target);
        if (!$this.is('a')) $this = $this.closest('a');

        //var state = $this.hasClass("active");

        var song_id = $this.data("song_id");

        console.info("data_song"+data_song);
        var data_songx = eval(data_song);
        console.info(data_songx);
        //if(state) {
        //    $(this).addClass('active');
        //    $(this).parent('div').parent('div').addClass("active");
            $.each(data_songx, function (n, value) {
                if (value.song_id == song_id) {
                    console.info("下标：" + n);
                    var music_sort_item = data_songx[n];

                    //添加到播放列表
                    addToPlayList(music_sort_item);


                }
            });
        //}else {
        //
        //    //false，暂停音乐
        //    $("#jplayer_N").jPlayer("pause");
        //}

    });


    //Top songs
    $(document).on('.jp-play-topsongs', 'click', function (e) {
        e && e.preventDefault();
        var $this = $(e.target);
        if (!$this.is('a')) $this = $this.closest('a');


        var song_id = $this.data("song_id");
        //取消所有discover中所有激活状态
        $('.jp-play-discover').removeClass('active');
        $('.jp-play-discover').parent('div').parent('div').removeClass('active');

        //与toplist中匹配
        var topsongs = eval(topsonglist);
        $.each(topsongs, function (n, value) {
            console.log("当前：" + n);
            if (value.song_id == song_id) {
                console.log("下标：" + n);
                var topsong_item = value;
                addToPlayList(value);
                return;
            }
        });


    });






    $("#refresh").click(function () {

        //发送ajax请求
        console.log("我要刷新");
        $.ajax({
            url: baseurl + "/music/discover",
            type: 'post',
            //data:'data_id='+del_data_id,
            async: true, //默认为true 异步
            error: function () {
                alert('error');

            },
            success: function (data) {
                //返回json数据
                var data = eval(data);
                //  alert(JSON.stringify(data));

                $("#mydiscover").setTemplateURL(CONTEXTPATH + "/static/template/template_sort.html?date=" + (+new Date()), null, {filter_data: true});
                $("#mydiscover").processTemplate(data);





            }
        });


    });


    // video

    $("#jplayer_1").jPlayer({
        ready: function () {
            $(this).jPlayer("setMedia", {
                title: "Big Buck Bunny",
                m4v: "/sources/video/lua.flv.bapi.1_remux.mp4",
                //ogv: "http://127.0.0.1:8080/sources/video/lua.flv.bapi.1_remux.mp4",
                //webmv: "http://127.0.0.1:8080/sources/video/lua.flv.bapi.1_remux.mp4",

                poster: "/sources/image/m41.jpg"
            });
        },
        swfPath: "js",
        supplied: "webmv, ogv, m4v",
        size: {
            width: "100%",
            height: "auto",
            cssClass: "jp-video-360p"
        },
        globalVolume: true,
        smoothPlayBar: true,
        keyEnabled: true
    });
});




 //刷新音乐分类结果
 /**
  *
  * @param data PageMusicSort jsonarray数据
  */
 function refreshMusicSortResult(data){
     $("#mysort").setTemplateURL(CONTEXTPATH + "/static/template/template_sort.html?date=" + (+new Date()), null, {filter_data: true});
     $("#mysort").processTemplate(data);


 }



 //添加到播放列表
 function addToPlayList(song) {
     var song_id = song.song_id;
     //重复标志
     var state = false;
     $.each(myPlaylist.playlist, function (n, value) {
         if (value.song_id == song_id) {
             console.log("找到相同的了：" + n);
             myPlaylist.play(n);
             state = true;
         }
     });
     //先要判断是否重复,
     //重复，不添加，返回
     // 不重复，添加，还要更新远程的播放列表


     if (!state) {
         myPlaylist.add(song, [true]);

         //发送ajax请求

     }

 }


 function justaddToPlayList(song){
     var song_id = song.song_id;
     //重复标志
     var state = false;
     $.each(myPlaylist.playlist, function (n, value) {
         if (value.song_id == song_id) {
             console.log("找到相同的了：" + n);
             state = true;
         }
     });
     //先要判断是否重复,
     //重复，不添加，返回
     // 不重复，添加，还要更新远程的播放列表


     if (!state) {
         myPlaylist.add(song);
         //

     }
 }


 //播放单首歌曲
 function playSong(song) {
     $("#jplayer_N").jPlayer("setMedia", song);
     $("#jplayer_N").jPlayer("play");
 }


 //设置默认播放列表
 function setPlaylist(playlist) {
     myPlaylist.setPlaylis
 }