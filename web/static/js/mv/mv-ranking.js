
	var mvranking = function(mvdata,myurl) {

		var ctx=myurl.split('/')[1];
		var artistpage='/'+ctx+'/page/artist';

					var divprefix = '<div ';
					var divsuffix = '</div>';
					var spanprefix = '<span>';
					var spansuffix = '</span>';
					var imgprefix = '<img ';
					var str = $('#mv-ranking').html();
					if (mvdata.flag) {
						var data = mvdata.data.rows;
						$.each(data, function(index, iteam) {
							str += divprefix;
							str += 'class="mv">';
								str += divprefix;
								str += 'class="mv-cover" id="'+iteam.id+'">';
									str += imgprefix;
									str += 'src="' + iteam.posterurl + '"/>';
									
									str += divprefix;
									str += 'class="mv-name">';
									str += iteam.name;
									str += divsuffix;
									str += divprefix;
									str += 'class="mv-time">';
									str += iteam.time;
									str += divsuffix;
								str += divsuffix;
								str+=divprefix;
								str+='class="mv-info ">';
								str+=iteam.info;
								str += divsuffix;
								str+=divprefix;
								str+='class="mv-artist" id="'+iteam.artistid+'">';
									str+=spanprefix;
									str+='歌手：'+iteam.artistname;
									str+=spansuffix;
									str+=spanprefix;
									str+='性别：'+iteam.sexval;
									str+=spansuffix;
									str+=spanprefix;
									str+='介绍：'+iteam.artistinfo;
									str+=spansuffix;
								str += divsuffix;
								str+=divprefix;
								str+='class="counts">';
									str+=spanprefix;
									str+='综合：'+iteam.rank;
									str+=spansuffix;
									str+=spanprefix;
									str+='播放量：'+iteam.playcount;
									str+=spansuffix;
									str+=spanprefix;
									str+='收藏量：'+iteam.collectcount;
									str+=spansuffix;
									str+=spanprefix;
									str+='下载量：'+iteam.downloadcount;
									str+=spansuffix;
									str+=divprefix;
									str+='class="ranking">'
										str+=iteam.rownum;
									str += divsuffix;
								str += divsuffix;
							str += divsuffix;
							
						});
						$('#mv-ranking').html(str);
						
						
//						样式
						$('.mv').css({
//							'border':'1px solid black',
							'height':'180px',
							'width':'1220px',
							'margin':'auto'
						});
						$('.mv>div').css({
							'margin': '10px',
							'float':'left',
							'width': '280px',
							'height': '150px',
							'border-radius':' 8px'
						});
						
						$('.mv-info').css({
							'background':'#E6E6FA',
							'line-height':'30px'
						});
						$('.mv-artist').css({
							'background':'#FFFFF0',
							'line-height':'30px',
							'overflow': 'hidden',  /*溢出隐藏*/
							'text-overflow':'ellipsis;'/*以省略号...显示*/
						});
						$('.counts').css({
							'background':'#F0FFF0',
							
						});
						$('.mv-cover img').css({
							'width':'280px',
							'height':'150px',
							'border-radius':' 8px'
						});
						
						$('.mv span').css({
							'display': 'block'
						});
						
						$('.counts>span').css({
							'margin-left': '30px',
							'font-size': '20px',
							'margin-top': '10px'
						});
						$('.mv-name').css({
							'float': 'left',
							'position': 'relative',
							'top': '-25px',
							'background-color': '#003333',
							'color': '#7FFFD4',
							'border-radius': '10px',
							'text-align':'center'
						});
						$('.mv-time').css({
							'float': 'right',
							'position': 'relative',
							'top': '-25px',
							'background-color': '#CCCCCC',
							'color': '#FF0000',
							'border-radius': '10px',
							'width': '40px',
							'text-align': 'center'
						});
						
						$('.ranking').css({
							'width':'60px',
							'background-color':'#FF82AB',
							'border-radius':'50%',
							'position':'relative',
							'font-size':'40px',
							'top':'-100px',
							'left':'200px',
							'text-align':'center'
						});
						
						
//						点击事件
						$('.mv-cover').click(function(){
							location.href=myurl+'?id='+this.id;//请求到播放页面
						});

						$('.mv-cover').hover(function(){
							$(this).css({
								'cursor':'hand'
							});
						},function(){
							$(this).css({'cursor':'pointer'});
						})

						$('.mv-artist').hover(function(){
							$(this).css({
								'cursor':'hand'
							});
						},function(){
							$(this).css({'cursor':'pointer'});
						})
						
						$('.mv-artist').click(function(){
							location.href=artistpage+'?id='+this.id//请求到歌手页面
						});
						
					} else {
						console.info(mvdata.msg);//显示错误信息
					}
				}


