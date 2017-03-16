<if test="addtime!=null and addtime!=''">
  addtime,
</if>
<if test="addtime!=null and addtime!=''">
  #{addtime},
</if>


if (options.type == 1) {
$.post(musicurl, {
userid: options.userid,
type: options.type,
pagesize: options.pagesize,
pagenum: options.pagenum
}, function (data, stadius) {
if (stadius == 'success') {

var count = Math.ceil(data.data.total / 12);
var start = data.data.pagenum;
console.info(data);
musiclist(data.data.rows, 1, playurl);
$('.page').css({
'margin-left': '450px'
});
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
dealUserMusic(musicurl, playurl, {
userid: options.userid,
type: options.type,
pagesize: options.pagesize,
pagenum: page
});
}
});


}
})
}

else {
$.post(musicurl, {
userid: options.userid,
type: options.type,
pagesize: options.pagesize,
pagenum: options.pagenum
}, function (data, stadius) {
var count = Math.ceil(data.data.total / 10);
var start = data.data.pagenum;
console.info(data);
musiclist(data.data.rows, 0, playurl);
$('.songpage').css({
'margin-left': '400px'
});
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
dealUserMusic(musicurl, playurl, {
userid: options.userid,
type: options.type,
pagesize: options.pagesize,
pagenum: page
});
}
});
});
}

