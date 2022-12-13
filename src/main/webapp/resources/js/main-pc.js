var QUICKMENU_POINT = 1000; //quickmenu trigger point


/* jQuery Ready */
$(function () {
  initGlobalHeader();
  UI.CustomSelect(".custom-select");

  //Multiple Modal Backdrop
  $(document).on('show.bs.modal', '.modal', function (event) {
    var zIndex = 1040 + (10 * $('.modal:visible').length);
    $(this).css('z-index', zIndex);
    setTimeout(function() {
      $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
    }, 0);
  });
  //Multiple Modal Scoll Issue
  $(document).on('hidden.bs.modal', '.modal', function () {
    $('.modal:visible').length && $(document.body).addClass('modal-open');
  });
});//jquery ready

/**
 * Attach File Single
 */
 (function() {
  $(".form-attach-file-single").each(function() {
    initAttachFile($(this));
  });

  function initAttachFile(attachFile) {
    var inputFile = attachFile.find("input:file");
    inputFile.on("change", function() {
			updateAttachItem(attachFile);
    });
  }

  function updateAttachItem(attachFile) {
    var inputFile = attachFile.find("input:file");
    var attachList = attachFile.find('.attach-item .file-name');
    var fileName = inputFile.val().split('/').pop().split('\\').pop();

    attachList.html(fileName);
  }
})();//Attach File Single

/* Header */
function initGlobalHeader() {
  var $target = $("#stickyHeader");
  if(!$target.length) return;

  new Waypoint({
    element: $target,
    handler: function (dir) {
      if (dir == "down") {
        this.element.addClass("sticky");
        $("#stickyQuickMenu").addClass("show-utils");
      } else if (dir == "up") {
        this.element.removeClass("sticky");
        $("#stickyQuickMenu").removeClass("show-utils");
      }
    },
  });
}

// info 구독 선택 클릭
$(function () {
  $('.info-select').click(function(){
    $(this).addClass('active');
    $(this).siblings().removeClass('active');
  })
});//jquery ready

// info 구독 팝업 선택 클릭
$(function () {
  $('.periodUse a').click(function(){
	$("#periodUse").val( $(this).data("id"));
    $(this).addClass('active');
    $(this).siblings().removeClass('active');
	cal();
  })
});//jquery ready

$(function () {
  $('.priceCode a').click(function(){
	$("#priceCode").val( $(this).data("id"));
    $(this).addClass('active');
    $(this).siblings().removeClass('active');
	cal();
  })
});//jquery ready

function cal(){
	var price;


    if($("#priceCode").val() == "001") price = 100000 * $("#periodUse").val();
   	if($("#priceCode").val() == "002") price = 300000 * $("#periodUse").val();
   	if($("#priceCode").val() == "003") price = 1500000 * $("#periodUse").val();

   	$("#servicePrice").val(price);
   	$(".servicePrice").text(price);
}



// help 버튼 클릭
$(function () {
  $('.wn-icon.help').hover(function(){
    $(this).next('.help-cont').css('display','flex');
  },function(){
    $(this).next('.help-cont').css('display','none');
  })
});//jquery ready

// exclamation 버튼 클릭
$(function () {
  $('.wn-icon.exclamation').hover(function(){
    $(this).next('.help-cont').css('display','flex');
  },function(){
    $(this).next('.help-cont').css('display','none');
  })
});//jquery ready

/* 스크롤 상단 메뉴 옵션 변경 */
$(function () {
  $(window).scroll(function(){
  	if($(this).scrollTop() > 320){
      $('.global-nav-bar.no-line').addClass('scrolling');
  	}else{
  		$('.global-nav-bar.no-line').removeClass('scrolling');
  	}
  });
});//jquery ready

/* 팝업 스크립트 */
$(function () {
  var queryString = window.location.search;
  var urlParams = new URLSearchParams(queryString);
  if (urlParams.has('modalID')) {
    var modalSelector = "#" + urlParams.get('modalID');
    $(modalSelector).modal('show');
  }
}); //jQuery Ready

/* 팝업 product - detail info 슬라이드 */
$(function () {
  $('.detail-info-bt').click(function(){
    $(this).parents().parents().parents().parents('.modal-slide').toggleClass('pop-right')
    $(this).parents().parents().next('.wn-modal-body').toggle();
  })
}); //jQuery Ready

/* 팝업 product - detail info 슬라이드 */
$(function () {
  $('.select-type a').click(function(){
    $(this).addClass('active');
    $(this).siblings().removeClass('active');
  })
}); //jQuery Ready

/* buyer scroll */
$(function () {
  $('.buyer-scroll').click(function(){
    $(this).parents().next('.buyer-form-wrap').toggleClass('active');
  })
}); //jQuery Ready

/* buyer - Category Groups */
$(function () {
  $('.buyer-group-bt').click(function(){
    $(this).parents('.group-title').next('.group-content').slideToggle();
  })
}); //jQuery Ready
