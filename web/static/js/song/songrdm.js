/**
 * Created by admin on 2016/5/3.
 */
var songrdm = function (mydata) {
    console.info(mydata)
    var songstr = '';
    $.each(mydata, function (index, item) {
        songstr += '<div class="song" id="' + item.id + '"><div class="song_poster"><img src="' + item.posterurl + '" /></div> <div class="song_name">' + item.name + '</div>  </div>';
    });
    $('.song_list').html(songstr);
    $(' .song').css({
        'width': '100%',
        'margin': '20px auto',

    });
    $(' .song_poster ').css({
        'width': '150px',
        'height': '150px',
        'margin': 'auto',
        'border-radius': '8px'


    });
    $(' .song_poster >img').css({
        'width': '150px',
        'height': '150px',
        'margin': 'auto',
        'border-radius': '8px'


    });
    $(' .song_name').css({
        'width': '100%',
        'text-align': 'center'
    });
    $('.song').click(function () {
        location.href = $_ctx + '/page/song-player' + '?id=' + this.id;
    })

}