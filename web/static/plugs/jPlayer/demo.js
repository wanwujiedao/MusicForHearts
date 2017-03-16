$(document).ready(function(){

	
	 var myvideo={};
	  if (typeof(myvideojson) == "undefined"){
		  console.info("myvideojson为空");
		  myvideo=  {
				title: "",
		        m4v: "/sources/video/qwdf.mp4",
		        poster: "/sources/image/qwdf.png"
		      };
	  }else{
		  myvideo=eval(myvideojson);
		  if(myvideo.poster=="undefined"||myvideo.poster==""){
			  myvideo.poster="/sources/image/m41.jpg";
		  }
	  }


$("#jplayer_1").click(function(){
	var jp=$(this);
	var jpData = jp.data('jPlayer');
	console.info(jpData.status);
	if(jpData.status.paused){
		console.info("我被暂停了");
		jp.jPlayer("play");
	}else{
		console.info("我被播放了");
		jp.jPlayer("pause");
	}
	
});



  // video



$("#jplayer_1").jPlayer({
    ready: function () {
      $(this).jPlayer("setMedia", myvideo);
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