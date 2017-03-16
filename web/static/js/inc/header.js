$(document).ready(function() {
				$('#mainmenu').find('ul>li').hover(function() {
					$(this).addClass('active');
					$(this).find('span').addClass('glyhover');
					$(this).find('img').addClass('glyhover');
					$(this).children('ul').stop(true, true).show('slow');
				}, function() {
					$(this).removeClass('active');
					$(this).find('span').removeClass('glyhover');
					$(this).find('img').removeClass('glyhover');
					$(this).children('ul').stop(true, true).hide('slow');
				});
				$('#search').click(function(){
					var keyword=$('#keyword').val();

					if(keyword!=''){
						location.href=$_ctx+'/page/search?search='+keyword;
					}else{
						window.wxc.xcConfirm('请输入搜索内容！！', window.wxc.xcConfirm.typeEnum.error,{
							title: "温馨提示"
						});
					}
				});

			});