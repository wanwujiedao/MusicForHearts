/**
 * Created by dzx on 2016/3/15.
 */

var albumlist = function (data,albumurl) {

        var str='';
    var count=0;
        $.each(data, function (index, iteam) {
            count++;
            str+='<div class="album" id="'+iteam.albumid+'">'+
                '<img src="'+iteam.albumposter+'"/>'+
                '<span id="albumname">'+iteam.albumname+'</span>'+
                '</div>';
        });

        $('#albumlist').html(str);
    var musiclistheight=(Math.ceil(count/3)*200);
    $('#albumlist').css({
        'height':musiclistheight+'px'
    });

       $('.album>img').css({
            'width': '250px',
            'height': '150px',
            'border-radius':'8px'
        })
        $('.album>span').css({
            'display': 'block',
            'width': '250px',
            'text-align': 'center',
            'margin-top': '10px'
        })

        $('.album').click(function(){
            location.href=albumurl+'?albumid='+this.id;
        });


}