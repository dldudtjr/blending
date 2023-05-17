$(document).ready(function () {
  $(".toggle_btn").click(function () {
    $(this).toggleClass("on");
    $(".gnb-menu ").toggleClass("on");
  });
  $(".pop_close").click(function () {
    $(".overlay ").removeClass("on");
    $(".pop_box ").removeClass("on");
  });
  $(".login-btn a").click(function () {
    $(".overlay ").addClass("on");
    $(".login_wrap").addClass("on");
  });

  $(".register-btn a").click(function () {
    $(".overlay ").addClass("on");
    $(".register_wrap ").addClass("on");
  });

  $(".register_check label a").click(function () {
    $(".overlay ").addClass("on");
    $(".terms_wrap ").addClass("on");
  });

  $(".terms_btn").click(function () {
    $(".overlay ").addClass("on");
    $(".terms_wrap ").addClass("on");
  });
  let header = document.querySelector("header");
  let mainVisual = document.querySelector(".main_visual");
  let mainHeight = mainVisual.offsetHeight;

  window.onscroll = function () {
    let windowTop = window.scrollY;

    if (windowTop >= mainHeight) {
      header.classList.add("scroll");
    } else {
      header.classList.remove("scroll");
    }
  };
  const inputFields = document.querySelectorAll(
    ".default_form .input-box input"
  );
  inputFields.forEach((input) => {
    input.addEventListener("focus", function () {
      this.nextElementSibling.style.color = "# #ff8066;";
      this.nextElementSibling.style.fontSize = "10px";
      this.nextElementSibling.style.bottom = "30px";
    });
    input.addEventListener("blur", function () {
      if (this.value !== "") {
        this.nextElementSibling.style.color = "#000";
        this.nextElementSibling.style.fontSize = "1px";
        this.nextElementSibling.style.bottom = "30px";
      } else {
        this.nextElementSibling.style.color = "";
        this.nextElementSibling.style.fontSize = "14px";
        this.nextElementSibling.style.bottom = "4px";
      }
    });
  });
  var swiper01 = new Swiper(".news_list .mySwiper", {
    slidesPerView: "auto",
    spaceBetween: 20,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    breakpoints: {
      1100: {
        slidesPerView: 4,
        spaceBetween: 30,
      },
    },
  });
  var swiper = new Swiper(".blending_selider .mySwiper", {
    slidesPerView: 1,
    spaceBetween: 30,
    loop: true,
    loopAdditionalSlides: 1,
    navigation: {
      nextEl: ".blending_selide_pre",
      prevEl: ".blending_selide_next",
    },
    breakpoints: {
      700: {
        slidesPerView: 2,
        spaceBetween: 30,
      },
      1400: {
        slidesPerView: 3,
        spaceBetween: 30,
      },
    },
  });
  $(".partner_slider").slick({
    variableWidth: true,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 0,
    speed: 8000,
    pauseOnHover: false,
    arrows: false,
    cssEase: "linear",
  });

  $(".main_tab_menu li").click(function () {
    let t = $(this).index();
    $(".main_tab_menu li").removeClass("on");
    $(this).addClass("on");
    $(".main_tab_cont .main_tab_subcont ").hide().eq(t).fadeIn();
  });
});
