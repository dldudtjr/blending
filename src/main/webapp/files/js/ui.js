/**
 * Top Category Dropdown
 */
(function (window) {
  'use strict';
  var UI = window.UI || {};
  var menuList = $("#top-cat-menu");

  function TopCategryDropdown(selector) {
    init();
  }

  function init() {
    setOpen();
    setClose();
  }

  function setClose() {
    menuList.on("click", function (e) {
      e.stopPropagation();
    });
    $(document).on("click", function () {
      closeDropdown();
    });
  }

  function toggleDropdown() {
    if (menuList.hasClass("hide")) {
      //show menu
      showBodyDim();
      menuList.removeClass("hide");
    } else {
      //hide menu
      closeDropdown();
    }
  }

  function showBodyDim() {
    if (!$(".body-dim").length) {
      var bodyDim = $("<div class='body-dim'></div>");
      $("body").append(bodyDim);
      bodyDim.fadeOut(0);
      bodyDim.fadeIn(300, 'easeOutQuint');
    } else {
      $(".body-dim").fadeIn(300, 'easeOutQuint');
    }
  }
  function hideBodyDim() {
    if ($(".body-dim").length) {
      $(".body-dim").fadeOut(0);
    }
  }

  function closeDropdown() {
    hideBodyDim();
    menuList.addClass("hide");
    btnToggle.removeClass("active");
  }

  UI.TopCategryDropdown = TopCategryDropdown;
  window.UI = UI;
})(window);

/**
 * Selectbox
 */
(function (window) {
  'use strict';
  var UI = window.UI || {};

  var root,
      label,
      options,
      optionItems;

  function Selectbox(selector) {
    root = $(selector);
    label = root.find(".select-label");
    options = root.find(".select-options");
    optionItems = root.find(".option-item");
    init();
  }

  function init() {
    // optionItems.each(function() {
    //   if($(this).hasClass('selected'))
    // });
    setOpen();
    setClose();
    optionEvent();
  }

  function setOpen() {
    label.on("click", function (e) {
      toggleSelectbox($(this));
    });
  }

  function setClose() {
    //document Close
    label.on("click", function (e) {
      e.stopPropagation();
    });
    options.on("click", function (e) {
      e.stopPropagation();
    });
    $(document).on("click", function () {
      closeSelectbox();
    });
  }

  function optionEvent() {
    optionItems.on("click", function(e) {
      var text = $(this).text();
      $(this).closest(".selectbox").find(".select-label").text(text);
      closeSelectbox();
    })
  }

  function toggleSelectbox(target) {
    var options = target.parent().find(".select-options");
    if (options.hasClass("open")) {
      //hide menu
      target.removeClass("active");
      options.removeClass("open");
    } else {
      //show menu
      target.addClass("active");
      options.addClass("open");
    }
  }

  function closeSelectbox() {
    label.removeClass("active");
    options.removeClass("open");
  }

  UI.Selectbox = Selectbox;
  window.UI = UI;
})(window);//selectbox

/**
 * Product List View //사용안함
 */
(function (window) {
  "use strict";
  var UI = window.UI || {};

  var PRD_LIST_VIEW = ["tile", "large", "list"];
  var PRD_ITEM_TYPES = ["v", "large", "h"];
  var btnView = $(".btn-view");
  var prdList = $("#prd-list");
  var prdItems = prdList.find(".prd-item");

  function ProductListView() {
    init();
  }

  function init() {
    btnView.on("click", function () {
      var view = $(this).attr("data-view");
      changeListView(view);
    });
  }

  function changeListView(view) {
    var nextView = getNextView(view);
    changeViewButton(nextView);
    changePrdListView(view);
    changePrdListImage(view);
  }
  function changePrdListImage(view) {
    var item,
        img,
        imgV,
        imgH;
    prdItems.each(function() {
      item = $(this);
      img = item.find(".prd-item-img img");
      imgH = img.attr("data-src").h;
      imgV = img.attr("data-src").v;
      if(view == "large") {
        img.attr("src", imgH);
      } else {
        img.attr("src", imgV);
      }
    });
  }
  function changeViewButton(view) {
    btnView.attr("data-view", view);
    btnView.find(".wn-icon").attr("class", "wn-icon plp-" + view);
  }
  function getNextView(view) {
    var value = "";
    var total = PRD_LIST_VIEW.length;
    PRD_LIST_VIEW.forEach(function (item, index) {
      if (item == view) {
        var nextIndex = index == total - 1 ? 0 : index + 1;
        value = PRD_LIST_VIEW[nextIndex];
      }
    });
    return value;
  }
  function changePrdListView(view) {
    var listClassPre = "prd-list-";
    var itemClassPre = "prd-item-";
    var listClass,
        itemClass;

    PRD_LIST_VIEW.forEach(function (item, index) {
      listClass = listClassPre + item;
      itemClass = itemClassPre + PRD_ITEM_TYPES[index];
      if (item == view) {
        prdList.addClass(listClass);
        prdItems.addClass(itemClass);
      } else {
        prdList.removeClass(listClass);
        prdItems.removeClass(itemClass);
      }
    });
  }

  UI.ProductListView = ProductListView;
  window.UI = UI;
})(window);//ProductListView

/**
 * Accordion
 */
(function() {
  $(".wn-accordion").each(function() {
    initAccordion($(this));
  });

  function initAccordion(accordion) {
    var titles = accordion.find(".wn-accordion-tit");
    titles.each(function(index) {
      $(this).on("click", function() {
        on(accordion, index);
      });
    });

    var isAni = accordion.hasClass("ani");
    if(isAni) {
      var itemList = accordion.find(".wn-accordion-item");
      var content;
      itemList.each(function() {
        content = $(this).find(".wn-accordion-content").eq(0);
        if($(this).hasClass("active")) {
          content.css("max-height", "initial");
        }
        content.addClass("initialized");
      });
    }
  }

  function on(accordion, index) {
    var items = accordion.find(".wn-accordion-item");
    var transition = accordion.hasClass("ani");
    items.each(function(i) {
      if(i == index) {
        if($(this).hasClass("active")) {
          closeItem($(this), transition);
        } else {
          openItem($(this), transition);
        }
      } else {
        //close another items
        closeItem($(this), transition);
      }
    });
  }

  function openItem($item, transition) {
    if (transition) {
      setMaxHeight($item.find(".wn-accordion-content"));
    }
    $item.addClass("active");
  }
  function closeItem($item, transition) {
    if (transition) {
      removeMaxHeight($item.find(".wn-accordion-content"));
    }
    $item.removeClass("active");
  }
  function setMaxHeight($target) {
    $target.css("max-height", $target.prop('scrollHeight') + "px");
  }
  function removeMaxHeight($target) {
    $target.css("max-height", 0);
  }
})();//Accordion

/**
 * InputNumber
 */
(function() {
  $(".input-number").each(function() {
    initInputNumber($(this));
  });

  function initInputNumber(inputNumber) {
    var btnDec, btnInc;
    btnDec = inputNumber.find(".dec");
    btnInc = inputNumber.find(".inc");
    btnDec.on("click", function() {
      decrement(inputNumber);
    });
    btnInc.on("click", function() {
      increment(inputNumber);
    });
    detectDisabled(inputNumber);
  }

  function increment(inputNumber) {
    var inputNum = inputNumber.find(".num");
    var val = inputNum.val();
    val = Number(val) + 1;
    inputNum.val(val);

    detectDisabled(inputNumber);
  }
  function decrement(inputNumber) {
    var inputNum = inputNumber.find(".num");
    var val = inputNum.val();
    val = Math.max(1, val-1);
    inputNum.val(val);

    detectDisabled(inputNumber);
  }

  function detectDisabled(inputNumber) {
    var val = inputNumber.find(".num").val();
    if(val <= 1) {
      inputNumber.find(".dec").addClass("disabled");
    } else {
      inputNumber.find(".dec").removeClass("disabled");
    }
  }
})();//InputNumber

/**
 * Attach Image
 */
(function() {
  $(".form-attach-image").each(function() {
    initAttachImage($(this));
  });

  function initAttachImage(attachImage) {
    var inputFile = attachImage.find("input:file");
    inputFile.on("change", function() {
			updateImage(attachImage);
		});
  }

  function updateImage(attachImage) {
    var inputFile = attachImage.find("input:file");
    var imgThumb = attachImage.find('[data-attach-role="bgImg"]');
    if (inputFile.prop('files')) {
      var reader = new FileReader();
      reader.onload = function(e) {
        var src = e.target.result;
        imgThumb.css({
          "background-image": "url(" + src + ")",
          "background-color": "#fff",
        });
      }
      reader.readAsDataURL(inputFile.prop('files')[0]); // convert to base64 string
    }
  }
})();//AttachImage

/**
 * Attach File
 */
(function() {
  $(".form-attach-file").each(function() {
    initAttachFile($(this));
  });

  function initAttachFile(attachFile) {
    var inputFile = attachFile.find("input:file");
    inputFile.on("change", function() {
			updateAttachList(attachFile);
    });
  }

  function updateAttachList(attachFile) {
    var inputFile = attachFile.find("input:file");
    var attachList = attachFile.find('[data-attach-role="attach-list"]');
    var fileName = inputFile.val().split('/').pop().split('\\').pop();
    var itemHtml = '<div class="attach-item"><i class="wn-icon clip-16"></i><span class="file-name" title="' + fileName + '">' + fileName + '</span><button class="btn-remove" onclick="attachItemRemoveClick(this)"><i class="wn-icon x-16"></i></button></div>';

    attachList.html(attachList.html() + itemHtml);
  }
})();//Attach File

/**
 * CustomSelect
 */
(function (window) {
  'use strict';
  var UI = window.UI || {};

  function CustomSelect(selector) {
    $(selector).each(function() {
      init($(this));
    })
  }

  function init(customSelect) {
    buildAltElements(customSelect);

    var select = customSelect.find("select");
    addSelectChangeHandler(select);
    select.trigger("change");
  }

  function addSelectChangeHandler(select) {
    select.on("change", function() {
      var customSelect = $(this).parent();
      var selectedIndex = $(this).prop("selectedIndex");
      if(customSelect.data("select-role") == "select-main") {
        var subItems = select.find("option").eq(selectedIndex).attr("data-select-items");
        subItems = subItems ? subItems : "";
        var selectSubSelector = customSelect.attr("data-select-sub");
        updateSelectSub(selectSubSelector, subItems.split(","));
      }
    });
  }

  function buildAltElements(customSelect) {
    buildAltSelected(customSelect);
    buildAltItems(customSelect);
  }

  function buildAltSelected(customSelect) {
    var className = "select-selected";
    var selector = "." + className;
    var selElmnt = customSelect.find("select")[0];
    var disabled = selElmnt.disabled;

    customSelect.find(selector).remove();

    // var selected = $("<div><span></span></div>");
    var selected = $("<div></div>");
    selected.addClass(className);
    // selected.find("span").html(selElmnt.options[selElmnt.selectedIndex].innerHTML);
    selected.html(selElmnt.options[selElmnt.selectedIndex].innerHTML);
    customSelect.append(selected);
    if(disabled) {
      selected.addClass("disabled");
      customSelect.addClass("disabled");
    } else {
      // addSelectedClickHandler(selected);
    }
  }

  function buildAltItems(customSelect) {
    var className = "select-items select-hide";
    var selElmnt = customSelect.find("select");

    customSelect.find(".select-items").remove();

    var selectItems = $("<div></div>");
    selectItems.addClass(className);

    selElmnt.find("option").each(function(i) {
      var item = $("<div></div>");
      item.html($(this).html());
      addItemClickHandler(item, i);
      selectItems.append(item);
    });

    customSelect.append(selectItems);
  }

  function addSelectedClickHandler(selected) {
    selected.on("click", function(e) {
      e.stopPropagation();
      $(this).next().toggleClass("select-hide");
      $(this).toggleClass("select-arrow-active");
    });
  }

  function addItemClickHandler(item, index) {
    item.on("click", function() {
      var customSelect = item.parent().prev().parent();
      var selElmnt = item.parent().prev().prev();
      var selectSelected = item.parent().prev();
      var selectedItemClass = "same-as-selected";

      var selectedIndex = selElmnt.prop("selectedIndex");
      if(selectedIndex != index) {
        selectSelected.html($(this).html());
        $(this).parent().find("." + selectedItemClass).removeClass(selectedItemClass);
        $(this).addClass(selectedItemClass);
        selElmnt.prop("selectedIndex", index);
        selElmnt.trigger("change");
        selectSelected.click();

        //if has sub items

      }
    });
  }

  function updateSelectSub(selectSubSelector, subItemsArr) {
    var subSelElmnt = $(selectSubSelector).find("select");
    var option;
    subSelElmnt.find("option").each(function(i) {
      if(i > 0) {
        $(this).remove();
      }
    });
    subItemsArr.forEach(function(val) {
      option = $("<option>" + val + "</option>");
      subSelElmnt.append(option);
    });
    if(subItemsArr.length > 1) {
      subSelElmnt.prop("disabled", false);
    } else {
      subSelElmnt.prop("disabled", true);
    }
    UI.CustomSelect(selectSubSelector);
  }

  UI.CustomSelect = CustomSelect;
  window.UI = UI;
})(window);//CustomSelect

/* If the user clicks anywhere outside the select box,
then close all select boxes: */
function closeAllCustomSelect() {
  $(".select-selected").removeClass("select-arrow-active");
  $(".select-items").addClass("select-hide");
}
// document.addEventListener("click", closeAllCustomSelect);

document.addEventListener("click", toggleCustomSelect);
function toggleCustomSelect(e) {
  var $cs = $(".custom-select");
  if(e.target.classList.contains("select-selected")) {
    var myCs = e.target.parentNode;
    // $cs.classList.toggle("open");
    $cs.each(function() {
      if($(this).is($(myCs))) {
        $(this).toggleClass("open");
      } else {
        $(this).removeClass("open");
      }
    });
  } else {
    $cs.removeClass("open");
  }
}
$(".dropdown .btn-toggle").on("click", function() {
  var $cs = $(".custom-select");
  $cs.removeClass("open");
});
//end custom select

/**
 * Switch Button
 */
(function() {
  var CONTAINER_SELECTOR = ".switch-box";

  $(".bt-switch").each(function() {
    initSwitchButton($(this));
  });
  $(".checkbox-switch input").each(function() {
    addCheckChangeHandler($(this));
  });

  function initSwitchButton(button) {
    addButtonClickHandler(button);
  }

  function addButtonClickHandler(button) {
    button.on("click", function() {
      $(this).toggleClass("on");
      if($(this).hasClass("on")) {
        $(this).closest(CONTAINER_SELECTOR).addClass("on");
      } else {
        $(this).closest(CONTAINER_SELECTOR).removeClass("on");
      }
    });
  }

  function addCheckChangeHandler(checkbox) {
    checkbox.on("change", function() {
      if(checkbox.prop("checked")) {
        checkbox.closest(CONTAINER_SELECTOR).addClass("on");
      } else {
        checkbox.closest(CONTAINER_SELECTOR).removeClass("on");
      }
    });
  }
})();

/**
 * Progress Bar
 */
(function() {
  $(".progress-bar").each(function() {
    initProgressBar($(this));
  });

  function initProgressBar(progressBar) {
    var per = progressBar.attr("data-percent");
    var $pointer = progressBar.find(".pointer");
    var $bar;
    if(progressBar.find(".bar").length) {
      $bar = progressBar.find(".bar");
    } else {
      $bar = $("<div class='bar'></div>");
      progressBar.append($bar);
    }
    $bar.css("width", per + "%");
    if($pointer.length) {
      $pointer.css("left", per + "%");
    }
  }
})();

/**
 * Timer Bar
 */
(function() {
  $(".timer-bar").each(function() {
    initTimerBar($(this));
  });

  function initTimerBar($timerBar) {
    var per = $timerBar.attr("data-percent");
    var $container = $timerBar.closest(".timer-bar");

    var $bar = buildBar($timerBar);
    var $marker = buildMaker($timerBar);

    //set size and position
    var markerWidth = parseInt($marker.width());
    var containerWidth = parseInt($container.width()) - markerWidth;
    var barWidth = containerWidth * ( per / 100 ) + markerWidth;
    var markerRight = barWidth - markerWidth;
    $bar.css("width", barWidth + "px");
    $marker.css("right", markerRight + "px");
  }

  function buildBar($timerBar) {
    var $bar;
    if($timerBar.find(".bar").length) {
      $bar = $timerBar.find(".bar");
    } else {
      $bar = $("<div class='bar'></div>");
      $timerBar.append($bar);
    }
    return $bar;
  }
  function buildMaker($timerBar) {
    var $marker;
    if($timerBar.find(".marker").length) {
      $marker = $timerBar.find(".marker");
    } else {
      $marker = $("<div class='marker'></div>");
      $timerBar.append($marker);
    }
    return $marker;
  }
})();

/**
 * Timer Header
 */
(function() {
  if($(".timer-header-container").length) {
    new Waypoint.Inview({
      element: $(".main-container")[0],
      exit: function(dir) {
        if(dir == 'down') {
          $(".timer-header-container").addClass("min");
        }
      },
      entered: function(dir) {
        if(dir == 'up') {
          $(".timer-header-container").removeClass("min");
        }
      },
    });
  }
})();

/**
 * Select Group
 */
(function() {
  var SELECT_ITEM_SELECTOR = ".select-item";

  $(".select-group").each(function() {
    initSelectGroup($(this));
  });

  function initSelectGroup(selectGroup) {
    var items = selectGroup.find(SELECT_ITEM_SELECTOR);
    items.each(function(index) {
      $(this).on("click", function() {
        groupOn(selectGroup, index);
      });
    });
  }

  function groupOn(selectGroup, index) {
    var items = selectGroup.find(SELECT_ITEM_SELECTOR);
    items.each(function(i) {
      if(i == index) {
        $(this).addClass("active");
      } else {
        $(this).removeClass("active");
      }
    })
  }
})();

/**
 * Datepicker
 */
(function() {
  $('[data-dp-role="trigger"]').each(function() {
    initDatepicker($(this));
  });

  function initDatepicker(trigger) {
    var dpSelector = trigger.attr("href");
    var dp = $(dpSelector).datepicker({
      dateFormat: 'yy-mm-dd',
      prevText: '이전 달',
      nextText: '다음 달',
      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
      dayNames: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
      showMonthAfterYear: true,
      yearSuffix: '년',
    });

    var dpModal = dp.closest('[data-dp-role="modal"]');
    var dpSubmit = dpModal.find('[data-dp-role="modal-submit"]');

    addSubmitClickHandler(dpSubmit, dp, trigger);
    addTriggerClickHandler(trigger, dp);
  }

  function addTriggerClickHandler(trigger, dp) {
    trigger.on("click", function(e) {
      e.preventDefault();
      //set datepicker date
      var dpFormat = dp.datepicker("option", "dateFormat");
      var dpSettings = dp.datepicker("option", "settings");
      var inputDateVal = $(this).find("input").val();
      var dateTo = (inputDateVal)?  $.datepicker.parseDate(dpFormat, inputDateVal, dpSettings) : new Date();
      dp.datepicker("setDate", dateTo);
      //show datepicker popup
      var dpModal = dp.closest('[data-dp-role="modal"]');
      dpModal.modal('show');
    });
  }

  function addSubmitClickHandler(dpSubmit, dp, trigger) {
    var input = trigger.find("input:text");
    var dpModal = dp.closest('[data-dp-role="modal"]');
    dpSubmit.on("click", function(e) {
      var dateTo = dp.val();
      input.val(dateTo);
      dpModal.modal('hide');
    });
  }

  function btnDpClickHandler(btnDp) {
    //set date
    var inputDateVal = btnDp.find("input").val();
    var date = $.datepicker.parseDate("yy-mm-dd", inputDateVal);
    var dpCalSelector = btnDp.attr("href");
    var dpCal = $(dpCalSelector);
    dpCal.datepicker("setDate", date);
    //show datepicker popup
    var modalSelector = btnDp.attr("data-dp-modal");
    $(modalSelector).modal('show');
  }


  //init modal submit
  // $('[data-dp-role="modal"]').each(function() {
  //   var modal = $(this);
  //   var calendar = $(this).find('[data-dp-role="calendar"]');
  //   var inputSelector = calendar.attr("data-dp-input");
  //   var btnSubmit = $(this).find('[data-dp-role="modal-submit"]');
  //   btnSubmit.on("click", function() {
  //     var dateText = $.datepicker.formatDate("yy-mm-dd", calendar.datepicker("getDate"));
  //     $(inputSelector).val(dateText);
  //     modal.modal('hide');
  //   });
  // });
})();

/**
 * Check Product Box
 */
(function() {
  $(".check-prd-box").each(function() {
    initCheckPrdBox($(this));
  });

  function initCheckPrdBox(checkPrdBox) {
    //checkbox action
    var checkbox = checkPrdBox.find("input:checkbox");
    checkbox.on("change", function() {
      activate(checkPrdBox);
    });
    //update active
    activate(checkPrdBox)
  }

  function activate(checkPrdBox) {
    var checkbox = checkPrdBox.find("input:checkbox");
    if(checkbox.prop("checked") == true) {
      checkPrdBox.addClass("checked");
    } else {
      checkPrdBox.removeClass("checked");
    }
  }
})();

/**
 * Checkable Group / Item
 */
(function() {
  $(".checkable-item").each(function() {
    checkableItemInit($(this));
  });

  function checkableItemInit(item) {
    addInputChangeHandler(item.find("input"));
  }

  function addInputChangeHandler(input) {
    input.on("change", function() {
      var isGroup = ($(this).closest(".checkable-group").length)? true : false;
      if(isGroup) {
        groupOn($(this).closest(".checkable-group"));
      } else {
        itemOn($(this).closest(".checkable-item"));
      }
    });
  }

  function itemOn(item) {
    var checked = item.find("input").prop("checked");
    if(checked) {
      item.addClass("checked");
    } else {
      item.removeClass("checked");
    }
  }

  function groupOn(group) {
    group.find(".checkable-item").each(function() {
      itemOn($(this));
    });
  }
})();

/**
 * Search Box
 */
(function() {
  $(".search-box").each(function() {
    initSearchBox($(this));
  });

  function initSearchBox($searchBox) {
    var $inputSearch = $searchBox.find(".input-search");
    var $btnClear = $searchBox.find(".btn-search-clear");

    addInputClickHandler($inputSearch);

    if($btnClear.length) {
      addClearClickHandler($btnClear);
      addInputSearchChangeHandler($inputSearch);
    }

    if($inputSearch.val()) {
      $inputSearch.trigger("input");
    }

    $searchBox.on("click", function(e) {
      e.stopPropagation();
    });
    $(document).on("click", function(e){
      // if(e.target.className =="autocomplete"){return false}
      $('.search-autocomplete').removeClass('on');
    });
  }

  function addInputClickHandler($input) {
    $input.on("click", function(){
      $('.search-autocomplete').toggleClass('on');
    });
  }

  function addInputSearchChangeHandler($inputSearch) {
    $inputSearch.on("input", function() {
      if($(this).val()) {
        $(this).parent().addClass("has-value");
      } else {
        $(this).parent().removeClass("has-value");
      }
    });
  }

  function addClearClickHandler($btnClear) {
    $btnClear.on("click", function() {
      var inputSearch = $(this).prev();
      inputSearch.val("").trigger("input").focus();
    });
  }
})();

/**
 * Fold Section
 */
(function() {
  $(".fold-section").each(function() {
    if($(this).hasClass("ani")) {
      initFoldSection($(this));
    }
  });
  $(".fold-button").each(function() {
    addBtnClickHandler($(this));
  });

  function initFoldSection($foldSection) {
    if($foldSection.hasClass("open")) {
      var $foldShows = $foldSection.find(".fold-open-show");
      var foldShowLoop = $.each($foldShows, function() {
        setMaxHeight($(this));
      });

      $.when(foldShowLoop).then(function() {
        $foldSection.addClass("initialized");
      });
    } else {
      $foldSection.addClass("initialized");
    }
  }

  function setMaxHeight($foldShow) {
    $foldShow.css("max-height", $foldShow.prop('scrollHeight') + "px");
  }

  function addBtnClickHandler(btn) {
    btn.on("click", function() {
      var $foldSection = $(this).closest(".fold-section");
      $foldSection.toggleClass("open");

      if(!$foldSection.hasClass("ani")) return;

      var $foldShows = $foldSection.find(".fold-open-show");
      if($foldSection.hasClass("open")) {
        $foldShows.each(function() {
          setMaxHeight($(this));
        });
      } else {
        $foldShows.css("max-height", 0);
      }
    })
  }
})();

/**
 * Toggle Point
 */
(function() {
	$(".toggle-point").each(function() {
		addPointHandler($(this));
	});

	function addPointHandler(target) {
		new Waypoint({
      element: target,
      handler: function(dir) {
        if(dir == 'down') { //exit
          $(".toggle-point-hide").hide();
          $(".toggle-point-show").show().fadeOut(0).fadeIn(400);
        } else if(dir == 'up') { //enter
          $(".toggle-point-hide").show().fadeOut(0).fadeIn(400);
          $(".toggle-point-show").hide();
        }
      },
      offset: 50,
    });
  }
})();

/**
 * Time Picker
 */
(function() {
  $(".input-time").each(function() {
    $(this).ptTimeSelect();
	});
})();

/**
 * Today Price Circle
 */
(function() {
  var CIRCLE_MAX = 100;
  var CIRCLE_BAR_MAX = 75;
  var START_ANGLE = 225;

  $(".today-price-progress").each(function() {
    var myPercent = $(this).attr("data-percent");
    if(myPercent == undefined) myPercent = 0;
    initTodayPriceCircle($(this), myPercent);
  });

  function initTodayPriceCircle($circleContainer, percent) {
    initCircleBg($circleContainer);
    initCircleBar($circleContainer, percent);
  }

  function initCircleBg($circleContainer) {
    var $circleBg = $circleContainer.find(".today-price-circle-bg");
    $circleBg.circleProgress({
      max: CIRCLE_MAX,
      value: CIRCLE_BAR_MAX,
      startAngle: START_ANGLE,
      textFormat: 'none',
      animation: 'none',
    });
  }

  function initCircleBar($circleContainer, percent) {
    var calcPercent = CIRCLE_BAR_MAX * ( percent / CIRCLE_MAX );
    var $circleBar = $circleContainer.find(".today-price-circle-bar");
    $circleBar.circleProgress({
      max: CIRCLE_MAX,
      value: calcPercent,
      startAngle: START_ANGLE,
      textFormat: 'none',
      animation: 'none',
    });

    var $svg = $circleBar.find("svg");
    addMarker($svg);
  }

  function addMarker($svg) {
    var ns = 'http://www.w3.org/2000/svg';
    var defs = document.createElementNS(ns, 'defs');
    var marker = document.createElementNS(ns, 'marker');
    var dot = document.createElementNS(ns, 'circle');
    var markerId = "dot";

    marker.setAttribute("id", markerId);
    marker.setAttribute("viewBox", "0 0 10 10");
    marker.setAttribute("markerWidth", "10");
    marker.setAttribute("markerHeight", "10");
    marker.setAttribute("markerUnits", "strokeWidth");
    marker.setAttribute("orient", "auto");
    marker.setAttribute("refX", "5");
    marker.setAttribute("refY", "5");

    dot.setAttribute("cx", "5");
    dot.setAttribute("cy", "5");
    dot.setAttribute("r", "1");
    dot.setAttribute("fill", "#fa5252");
    dot.setAttribute("stroke", "none");

    marker.appendChild(dot);
    defs.appendChild(marker);
    $svg.prepend(defs);

    var path = $svg.find(".circle-progress-value");
    path.attr("marker-end", "url(#" + markerId + ")");
  }
})();
