<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/views/inc/meta.jsp" %>

<style>
    #myParCont {
        font-size: 20px;
    }

    .artistlist, .albumlist {

        position: absolute;
        z-index: 20;
        background-color: #00AA88;
        color: #ffffff;
        /*width:670px;*/
        width: 96%;
        display: none;

    }

    .artistlist li, .albumlist li {
        cursor: pointer;
        list-style-type: none;
        margin-left: -40px;
    }

    .uh {
        background-color: #79564a;
        color: #FFFF00;
    }

    .cfile {
        text-align: center;
        border: 1px solid #b9ff1b;
        width: 100%;
        line-height: 35px;
        cursor: pointer;
    }

    .cfile:hover {
        background-color: #30131a;
        color: #FFFFFF;
    }

</style>
<script>
    var pagesize = 5;
    var pagenum = 1;
    var pagesize1 = 5;
    var pagenum1 = 1;
    var music =${music};


    var getALbumList = function (pagenum1, pagesize1, arid) {
        $.post($_ctx + '/album/findAlbum', {
            pagenum: pagenum1,
            pagesize: pagesize1,
            artistid: arid
        }, function (data, stadius) {
            if (stadius == 'success') {
                console.info(data)
                var str = '';
                str += '<li class="tag" id="">未知</li>';
                $.each(data.data.rows, function (index, item) {
                    str += '<li class="tag" id="' + item.albumid + '">' + item.albumname + '</li>';
                });
                var pagetotal = Math.ceil(data.data.total / 5);
                $('.albums .changepage span').html('共' + pagetotal + '页，当前为第' + data.data.pagenum + '页');

                if (data.data.pagenum == 1) {
                    $('.albums a.pre').prop('id', '');
                    $('.albums a.pre').html('');
                    $('.albums a.next').prop('id', data.data.pagenum + 1);
                    $('.albums a.next').html('下一页');
                } else if (data.data.pagenum == pagetotal) {
                    $('.albums a.pre').prop('id', data.data.pagenum - 1);
                    $('.albums a.pre').html('上一页');
                    $('.albums a.next').prop('id', '');
                    $('.albums a.next').html('');

                } else {
                    $('.albums a.pre').prop('id', data.data.pagenum - 1);
                    $('.albums a.pre').html('上一页');
                    $('.albums a.next').prop('id', data.data.pagenum + 1);
                    $('.albums a.next').html('下一页');

                }
                $('.albums .albumlist>ul').html(str);
                $('.albums a.pre').css({'text-decoration': 'none', 'cursor': 'pointer'});
                $('.albums a.next').css({'text-decoration': 'none', 'cursor': 'pointer'});
            }
            $('.albums .albumlist li').hover(function () {
                $(this).addClass('uh');
            }, function () {
                $(this).removeClass('uh');
            });
            $('.albums .albumlist li').click(function () {
                var txt = $(this).text();
                var txtid = this.id;
                $('.albums #albumname').val(txt);
                $('.albums #albumid').val(txtid);
                $('.albums .albumlist').fadeToggle(1000);

            });

            $('.albums .albumlist a').click(function () {
                getAlbumList(this.id, pagesize1, arid);

            });

        });
    }

    var getArtistList = function (pagenum, pagesize) {
        $.post($_ctx + '/artist/findArtist', {
            pagenum: pagenum,
            pagesize: pagesize
        }, function (data, stadius) {
            if (stadius == 'success') {
                var str = '';
                str += '<li class="tag" id="">未知</li>';
                $.each(data.data.rows, function (index, item) {
                    str += '<li class="tag" id="' + item.id + '">' + item.name + '</li>';
                });
                var pagetotal = Math.ceil(data.data.total / 5);
                $('.artists .changepage span').html('共' + pagetotal + '页，当前为第' + data.data.pagenum + '页');

                if (data.data.pagenum == 1) {
                    $('.artists  a.pre').prop('id', '');
                    $('.artists  a.pre').html('');
                    $('.artists  a.next').prop('id', data.data.pagenum + 1);
                    $('.artists  a.next').html('下一页');
                } else if (data.data.pagenum == pagetotal) {
                    $('.artists  a.pre').prop('id', data.data.pagenum - 1);
                    $('.artists  a.pre').html('上一页');
                    $('.artists  a.next').prop('id', '');
                    $('.artists  a.next').html('');

                } else {
                    $('.artists  a.pre').prop('id', data.data.pagenum - 1);
                    $('.artists  a.pre').html('上一页');
                    $('.artists  a.next').prop('id', data.data.pagenum + 1);
                    $('.artists  a.next').html('下一页');

                }
                $('.artistlist>ul').html(str);
                $('.artists  a.pre').css({'text-decoration': 'none', 'cursor': 'pointer'});
                $('.artists  a.next').css({'text-decoration': 'none', 'cursor': 'pointer'});
            }
            $('.artistlist li').hover(function () {
                $(this).addClass('uh');
            }, function () {
                $(this).removeClass('uh');
            });
            $('.artistlist li').click(function () {
                var txt = $(this).text();
                var txtid = this.id;
                if (txt == '未知') {
                    $('.albums').hide();
                } else {
                    $('.albums').show();
                }
                $('.artistlist').fadeToggle(1000);
                if ($('#artistname').val() != txt) {
                    $('#albumname').val('无');
                    $('#albumid').val('');
                }
                $('#artistname').val(txt);
                $('#artistid').val(txtid);

                getALbumList(pagenum1, pagesize1, this.id);

            });

            $('.artistlist a').click(function () {
                getArtistList(this.id, pagesize);

            });

        });
    }

    $(function () {
        $('#music-show').addClass('clickmenu');

        if (music.artistid != null) {
            getALbumList(pagenum1, pagesize1, music.artistid);
        } else {
            $('.albums').hide();
        }

        $('[name="artistname"]').click(function () {
            $('.artistlist').fadeToggle(1000);
            getArtistList(pagenum, pagesize);
        });
        $('[name="albumname"]').click(function () {
            $('.albumlist').fadeToggle(1000);
        });
        $('.dao-return').click(function () {
            history.go(-1);
        });

       // $.post($_ctx+'/music/findType');

    })

</script>


<div id="myParCont">
    <div class="row" id="content">
        <div class="vbox">
            <div class="row">

                <div class="col-md-8 col-md-offset-2" id="music_content">
                    <!--头像信息-->
                    <div class="clearfix text-center m-t">
                        <div class="inline">
                            <div class="easypiechart" data-percent="75" data-line-width="5" data-bar-color="#4cc0c1"
                                 data-track-Color="#f5f5f5" data-scale-Color="false" data-size="134"
                                 data-line-cap='butt' data-animate="1000">
                                <div class="thumb-lg">
                                    <img src="${music.posterurl}" class="img-circle" id="imgpre"
                                         width="150" height="150" alt="...">
                                </div>
                            </div>
                        </div>
                    </div>
                    <br/>
                    <!-- 基本信息填写 -->
                    <small class="text-muted m-b">
                        <form action="${ctx}/music/updateMusic" class="bs-example form-horizontal" id="music_form"
                              method="post"
                              enctype="multipart/form-data" onsubmit="return check(this)">

                            <div class="form-group">

                                <label class="col-lg-2 col-md-2 control-label">更换资源：</label>

                                <div class="col-lg-9 col-md-9">
                                    <label class="cfile" for="music">点击更换封面</label>
                                    <input type="file" class="filestyle" name="music" id="music"
                                           data-classButton="btn btn-default"
                                           data-classInput="form-control inline v-middle input-s" style="display: none">
                                </div>
                            </div>

                            <div class="form-group">

                                <label class="col-lg-2 col-md-2 control-label">更换封面：</label>

                                <div class="col-lg-9 col-md-9">
                                    <label class="cfile" for="photos">点击更换封面</label>
                                    <input type="file" class="filestyle" name="photos" id="photos"
                                           data-classButton="btn btn-default"
                                           data-classInput="form-control inline v-middle input-s" style="display: none">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-lg-2 col-md-2 control-label" for="name">音乐名称：</label>

                                <div class="col-lg-9 col-md-9">
                                    <input type="text" name="name" id="name" class="form-control" title="音乐名称"
                                           placeholder="请填写音乐名称" required="required" value="${music.name}">
                                </div>
                                <div class="col-lg-1 col-md-1 flag-img-box" id="name_flag">

                                </div>
                            </div>

                            <div class="form-group artists">
                                <label id="name_label" class="col-lg-2 col-md-2 control-label"
                                       for="artistname">歌手名称：</label>

                                <div class="col-lg-9 col-md-9  myselect">
                                    <input type="text" name="artistname" id="artistname" class="form-control"
                                           title="歌手名称" value="${music.artistname}" placeholder="请输入歌手名称" readonly>
                                    <input type="hidden" name="artistid" id="artistid" value="${music.artistid}"/>

                                    <div class="artistlist">
                                        <ul>

                                        </ul>
                                        <div style="border-top:1px solid #000;" class="changepage"><a
                                                class="dao-btn pre"></a><span class="page"></span><a
                                                class="dao-btn next"></a></div>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group albums">
                                <label id="albumname_label" class="col-lg-2 col-md-2 control-label" for="albumname">所属专辑：</label>

                                <div class="col-lg-9 col-md-9">
                                    <input type="text" name="albumname" id="albumname" class="form-control"
                                           title="所属专辑"
                                           placeholder="请选择所属专辑" value="${music.albumname}" readonly>

                                    <input type="hidden" name="albumid" value="" id="albumid" value="${music.albumid}"/>


                                    <div class="albumlist">
                                        <ul>

                                        </ul>
                                        <div style="border-top:1px solid #000;" class="changepage"><a
                                                class="dao-btn pre"></a><span class="page"></span><a
                                                class="dao-btn next"></a></div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label id="type_label" class="col-lg-2 col-md-2 control-label"
                                       for="typeid">音乐类型：</label>

                                <div class="col-lg-3 col-md-3">
                                    <select id="typeid" name="typeid" class="form-control">
                                        <option value="7">
                                            其他国家
                                        </option>
                                        <option value="4">
                                            中国
                                        </option>
                                        <option value="5">
                                            欧美
                                        </option>
                                        <option value="6">
                                            日韩
                                        </option>

                                    </select>
                                </div>
                                <div class="col-lg-3 col-md-3">
                                    <select name="typeid" class="form-control">
                                        <option value="13">
                                            其他流派
                                        </option>
                                        <option value="8">
                                            流行
                                        </option>
                                        <option value="9">
                                            古典
                                        </option>
                                        <option value="10">
                                            摇滚
                                        </option>
                                        <option value="11">
                                            舒情
                                        </option>
                                        <option value="12">
                                            怀旧
                                        </option>

                                    </select>

                                </div>
                                <div class="col-lg-3 col-md-3">
                                    <select name="typeid" class="form-control">
                                        <option value="18">
                                            其他年代
                                        </option>
                                        <option value="14">
                                            70年代
                                        </option>
                                        <option value="15">
                                            80年代
                                        </option>
                                        <option value="16">
                                            90年代
                                        </option>
                                        <option value="17">
                                            00年代
                                        </option>

                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label id="info_label" class="col-lg-2 col-md-2 control-label" for="info">音乐简介：</label>

                                <div class="col-lg-9 col-md-9">
                                    <textarea type="text" name="info" id="info" class="form-control" title="音乐简介"
                                              placeholder="请输入音乐简介">${music.info}</textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-9 col-md-offset-2 col-md-9">
                                    <button type="submit" id="register_sumbit" class="btn btn-primary text-right">修改音乐
                                    </button>
                                    <button type="button" class="btn btn-primary text-right dao-return">返回</button>
                                </div>
                            </div>
                        </form>
                    </small>
                </div>
                <div class="col-md-2">
                </div>
            </div>
        </div>
        <script src="${ctx}/static/js/apps/server/register.js" type="text/javascript" charset="utf-8"></script>
    </div>
</div>

