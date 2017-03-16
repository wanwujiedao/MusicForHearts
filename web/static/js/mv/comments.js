/**
 * Created by Administrator on 2016/1/19.
 */


var showcomment=function(mycomment){
    var divprefix = '<div ';
    var divsuffix = '</div>';
    var spanprefix = '<span>';
    var spansuffix = '</span>';
    var imgprefix = '<img ';
    var labelprefix='<label>';
    var labelsuffix='</label>';


    var str=  $('#comments').html();


    $.each(mycomment, function(index, iteam) {
        str+=divprefix;
        str+='class="comment">';
             str+=divprefix;
             str+='class="user" id="'+iteam.userid+'">';
                str+=imgprefix;
                str+='class="userposter" src="'+iteam.userposter+'"/>';
                str+='<label ';
                str+='class="username">';
                    str+=iteam.username;
                str+=labelsuffix;
            str+=divsuffix;
            str+=divprefix;
            str+='class="comment-content">';
                str+='<span class=user-name>';
                    str+=iteam.username+':';
                str+=spansuffix;
                str+=spanprefix;
                    str+=iteam.content;
                str+=spansuffix;
            str+=divsuffix;

            str+=divprefix;
            str+='class="adddate">';
                str+=iteam.adddate;
            str+=divsuffix;
        str+=divsuffix;

    });


    $('#comments').html(str);


    $('.comment').css( {
        'height': '130px',
        'background': '#FFFAFF',
        'margin-top': '20px'
    })

    $('.userposter').css( {
        'width': '100px',
        'height': '100px',
       ' border-radius': '50%'
    })

    $('.user>label').css( {
        'display': 'block',
        'width': '100px',
        'line-height': '30px',
        'text-align': 'center'
    })

   $('.user').css( {
        'float': 'left'
    })

    $('.comment-content').css( {
        'color': '#00CC00',
        'font-family': '"微软雅黑"',
        'font-size': '20px',
        'line-height':'50px',
        'margin-left': '130px'
    })

    $('.adddate').css( {
        'color': '#ccaaac',
        'margin-bottom': '10px',
        'margin-left': '130px'
    })






}