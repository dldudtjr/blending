$(function() {
  initDetailSide();
});

function initDetailSide() {
  if(!$(".detail-side-container").length) return;

  if($(".detail-side-container").outerHeight() < $(window).height() - 85) {
    initDetailSideTop();
  } else {
    $(".detail-side").addClass("sidebar-scroll");
    UI.SidebarScroll(".detail-side-container", ".buyer-wrap-left");
    initDetailSideBottom();
  }
}

/**
 * Sidebar Scroll
 */
 (function (window) {
  'use strict';
  var UI = window.UI || {};

  var STICKY_POINT = 135;
  var $target;
  var $contentWrapper;
  var lastScrollTop;
  var sideTop;
  var scrolled, targetH, targetTop, maxTop, minTop, overflowH, ty, bottomLimit;

  function SidebarScroll(sidebarSelector, contentWrapperSelector) {
    $target = $(sidebarSelector);
    $contentWrapper = $(contentWrapperSelector);
    lastScrollTop = $(window).scrollTop();
    sideTop = $target.offset().top;

    init();
  }

  function init() {
    $(window).on("scroll", scrollHandler);
    scrollHandler();
  }

  function scrollHandler() {
    targetH = $target.outerHeight();
    targetTop = $target.offset().top;
    overflowH = targetH - $(window).height();
    maxTop = targetTop + overflowH;
    minTop = targetTop - STICKY_POINT;
    bottomLimit = $contentWrapper.offset().top + $contentWrapper.outerHeight() - $(window).height() - sideTop - overflowH;
    scrolled = $(window).scrollTop();
    if (scrolled >= lastScrollTop) {
      if(scrolled >= maxTop) {
        ty = Math.floor(scrolled - sideTop - overflowH);
        ty = Math.min(ty, bottomLimit);
      }
    } else {
      if(scrolled <= minTop) {
        ty = Math.floor(scrolled - sideTop + STICKY_POINT);
        ty = Math.max(ty, 0);
      }
    }
    $target.css("top", ty);
    lastScrollTop = scrolled;
  }

  UI.SidebarScroll = SidebarScroll;
  window.UI = UI;
})(window);//SidebarScroll

function initDetailSideTop() {
  //sticky
  var $target = $(".detail-side-container");
  new Waypoint.Sticky({
    element: $target,
    offset: 135,
    stuckClass: 'sticky-top',
    wrapper: false,
  });
  //detect bottom
  var $cartReco = $("#cartReco");
  if($cartReco.length) {
    bottomToCartReco($target);
  } else {
    bottomToFooter($target);
  }
}

function initDetailSideBottom() {
  var $target = $(".detail-side-container");
  new Waypoint.Inview({
    element: $target,
    entered: function(dir) {
      if(dir == 'down') {
        $target.addClass("sticky-bottom");
      }
    },
    exit: function(dir) {
      if(dir == 'up') {
        $target.removeClass("sticky-bottom");
      }
    },
  });
}
