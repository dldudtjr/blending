function alertUi(title, message) {
	$.alert({
		title: title,
		content: message,
	});
}

/*
 * function confirmUi(title,message){ $.confirm({ boxWidth: '30%', useBootstrap: false, title: "Confirm", content: message, buttons: { formSubmit: { fn_realSubmit(); }, cancel:function () { } } }); }
 */
function ajaxSubmit(url, sendData) {
	$.ajax({
		url: url,
		data: sendData,
		type: 'POST',
		success: function(data) {

		},
		error: function(e) {
			console.log(JSON.stringify(e));
		}
	});
}


function fn_submitModal(url, sendData, _targetDiv) {
	$.ajax({
		url: url,
		data: sendData,
		type: 'POST',
		success: function(data) {
			$("#"+_targetDiv).html(data);
			$("#"+_targetDiv).modal('show')
//			rtnFunction(typ, data);
		},
		error: function(e) {
			console.log(JSON.stringify(e));
		}
	});
}


function fn_submitRtnAjax(url, sendData, typ) {
	$.ajax({
		url: url,
		data: sendData,
		type: 'POST',
		success: function(data) {
			rtnFunction(typ, data);
		},
		error: function(e) {
			console.log(JSON.stringify(e));
		}
	});
}

function fn_submitFileRtnAjax(urls, sendData, typ) {
	$(".modal_bg_sub").show();
	$.ajax({
		url: urls,
		processData: false,
		contentType: false,
		data: sendData,
		type: 'POST',
		success: function(data) {
			rtnFunction(typ, data);
		},
		error: function(e) {
			console.log(JSON.stringify(e));
		}
	});
}




function fn_submitReloadAjax(urls, sendData, types) {
	$(".modal_bg_sub").show();
	$.ajax({
		type: "POST",
		url: urls,
		data: sendData,
		success: function(data) {
			if (data.msg != "undefined" && data.msg != undefined && data.msg != null) {
				alert(data.msg);
				location.reload();
			} else {
				location.reload();
			}
		},
		error: function(response) {
			if (response.responseText.indexOf("sessionfail") > -1) {
				location.reload();
			} else {
				alert("Error");
			}
			return "";
		}
	});
}

function fn_submitDivAjax(urls, sendData, div) {
	$(".modal_bg_sub").show();
	$.ajax({
		type: "POST",
		url: urls,
		data: sendData,
		success: function(data) {
			$("#" + div).html(data);
		},
		error: function(response) {
			if (response.responseText.indexOf("sessionfail") > -1) {
				location.reload();
			} else {
				alert("Error");
			}
			return "";
		}
	});
}

function fn_submitAppendAjax(urls, sendData, div) {
	$(".modal_bg_sub").show();
	$.ajax({
		type: "POST",
		url: urls,
		data: sendData,
		success: function(data) {
			$("#" + div).append(data);
			$(".modal_bg_sub").hide();
		},
		error: function(response) {
			if (response.responseText.indexOf("sessionfail") > -1) {
				location.reload();
			} else {
				alert("Error");
			}
			return "";
		}
	});
}




function fn_submitAjax(urls, sendData, types) {
	$.ajax({
		type: "POST",
		url: "/cms/lgn/loginSession.ax",
		success: function(data) {
			if (data) {
				$(".modal_bg_sub").show();
				$.ajax({
					type: "POST",
					url: urls,
					data: sendData,
					success: function(data) {
						if (types == "modal") {
							$(".modal_bg_sub").hide();
							fn_modal(data);
						} else {
							if (data.msg != "undefined" && data.msg != undefined && data.msg != null) {
								alert(data.msg);
							} else {
								location.reload();
							}

							$(".btn_search").click();
							fn_modal("");
							fn_modal_sub("");
							$(".modal_bg").hide();
							$(".modal_sub").hide();
							$(".modal_bg_sub").hide();
							$(".modal_wrap_sub").hide();

						}

					},
					error: function(response) {
						if (response.responseText.indexOf("sessionfail") > -1) {
							location.reload();
						} else {
							alert("Error");
						}
						return "";
					}
				});
			}
			else {
				window.location.reload();
			}
		},
		error: function(e) {
			console.log(JSON.stringify(e));
		}
	});
}




function fn_submitFileAjax(urls, sendData, types) {
	$(".modal_bg_sub").show();
	$.ajax({
		url: urls,
		processData: false,
		contentType: false,
		data: sendData,
		type: 'POST',
		success: function(data) {
			if (data.msg != "undefined" && data.msg != undefined && data.msg != null) {
				alert(data.msg);
			} else {
				location.reload();
			}
			$(".btn_search").click();
			$(".modal_bg_sub").hide();
			$(".modal_cl").click();
		},
		error: function(e) {
			console.log(JSON.stringify(e));
		}
	});
}

function noimage(obj) {
	obj.src = '/files/cmsm/images/noimage.png';
}
function noimg(obj) {
	obj.src = '/files/lpsm/images/noimg.JPG';
}

// 비밀번호변경
function fnPassChg() {
	$.ajax({
		type: "POST",
		url: contextPath + "/cms/lgn/passChg.ax",
		success: function(data) {
			fn_modal(data);
		},
		error: function(e) {
			alert("error");
		}
	});
}

function fn_modalLoc() {
	var modalWidth = $(".modal_wrap").width();
	var modalHeight = $(".modal_wrap").height();
	var modalLeft = -(modalWidth / 2)
	var modalTop = -(modalHeight / 2)
	$(".modal_wrap").css({
		"margin-left": modalLeft,
		"margin-top": modalTop
	});
	$(".modal_wrap").draggable({
		'handle': '.dragTitle'
	});
}

function fn_modalLocSub() {
	var modalWidth = $(".modal_wrap_sub:last").width();
	var modalHeight = $(".modal_wrap_sub:last").height();
	var modalLeft = -(modalWidth / 2);
	var modalTop = -(modalHeight / 2);
	$(".modal_wrap_sub:last").css({
		"margin-left": modalLeft,
		"margin-top": modalTop
	});
	$(".modal_wrap_sub:last").draggable({
		'handle': '.dragTitle'
	});
}
function fn_modal(data) {

	popUpYn = true;
	$(".modal_wrap").html(data);
	$(".modal_bg").toggle();
	$(".modal_wrap").toggle();
	setTimeout(function() {
		fn_modalLoc();
	}, 50);
}

function fn_modal_sub(data) {
	popUpYn = true;
	$(".modal_wrap_sub:last").html(data);
	$(".modal_bg_sub:last").toggle();
	$(".modal_wrap_sub:last").toggle();
	$(".modal_wrap_sub:last").draggable();
}

function _setAlertMsg() {
	/*	if ($.cookie('_alertMsg') != null && $.cookie('_alertMsg') != 'null' && $.cookie('_alertMsg') != '') {
			alert($.cookie('_alertMsg').replace(/\+/g, ' '));
			$.cookie('_alertMsg', '', {
				path : '/'
			});
		}
		if ($.cookie('_errorMsg') != null && $.cookie('_errorMsg') != 'null' && $.cookie('_errorMsg') != '') {
			alert($.cookie('_errorMsg').replace(/\+/g, ' '));
			$.cookie('_errorMsg', '', {
				path : '/'
			});
		}*/
}

function fn_Lst(page) {
	$('#currentPageNo').val(page);
	$('#srchFm').submit();
}

function random_color() {
	var colorR = Math.floor((Math.random() * 256));
	var colorG = Math.floor((Math.random() * 256));
	var colorB = Math.floor((Math.random() * 256));
	return "rgb(" + colorR + "," + colorG + "," + colorB + ")";
	// return colorR + "," + colorG + "," + colorB
}

function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if (start != -1) {
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if (end == -1) end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}


function setCookie(cookieName, value, expiredays) {
	var todayDate = new Date();
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = cookieName + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function deleteCookie(cookieName) {
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1); //어제날짜를 쿠키 소멸날짜로 설정
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}


function formMake(url) {
	var rtnData = getCookie(url);  // 쿠키에 데이터 저
	rtnData = rtnData.split("\&");
	var tmp = "";
	$.each(rtnData,function(item){
		//alert(rtnData[tem].split("\=")[0]);
		//alert(rtnData[item].split("\=")[1]);
		if(rtnData[item].split("\=")[1]){
			tmp += "<input type='hidden' name='"+rtnData[item].split("\=")[0]+"' value='"+rtnData[item].split("\=")[1]+"' >";
		}
	});
	$("#rtnForm").append(tmp);
	$("#rtnForm").attr("action",url);
	$("#rtnForm").submit();
}


$(function() {



	$(document).on("click", "input[type=button],a", function() {
		this.blur();
	});



	$(window).ajaxStart(function() {
		$(".mask").show();
	}).ajaxStop(function() {
		$(".mask").hide();
	}).ajaxError(function() {
		$(".mask").hide();
	});
});
