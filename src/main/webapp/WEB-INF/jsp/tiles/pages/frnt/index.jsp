<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<%-- <head>
<meta charset="UTF-8">
<title>BLENDING TREND</title>
<link rel="stylesheet" href="<c:url value='/resources/lib/jquery/css/jquery-ui.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/lib/swiper/swiper-bundle.min.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/lib.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">


<script src="<c:url value='/resources/lib/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/lib/jquery/jquery-ui.min.js'/>"></script>
<script src="<c:url value='/resources/lib/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<script src="<c:url value='/resources/lib/swiper/swiper-bundle.min.js'/>"></script>
<script src="<c:url value='/resources/lib/waypoints/jquery.waypoints.min.js'/>"></script>
<script src="<c:url value='/resources/lib/waypoints/shortcuts/sticky.min.js'/>"></script>
<script src="<c:url value='/resources/lib/waypoints/shortcuts/inview.min.js'/>"></script>
<script src="<c:url value='/resources/js/ui.js'/>"></script>
<script src="<c:url value='/resources/js/main-pc.js'/>"></script>
<script src="<c:url value='/resources/js/detail.js'/>"></script>
<script src="<c:url value='/resources/js/common.js'/>"></script>
<script src="<c:url value='/resources/lib/jquery/messagebox.js'/>"></script>
<script src="<c:url value='/resources/lib/crypto-js/aes.js'/>"></script>
<script src="<c:url value='/resources/lib/crypto-js/sha256.js'/>"></script>
<script src="<c:url value='/resources/lib/jquery/messagebox.js'/>"></script>
<script src="<c:url value='/resources/lib/jquery/jquery.validate.min.js'/>"></script>
</head>
 --%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BlendingTrend</title>
	<link rel="stylesheet" href="<c:url value='/resources/new/css/reset.css'/>">
    <link href="https://webfontworld.github.io/gmarket/GmarketSans.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <link rel="stylesheet" href="<c:url value='/resources/new/css/style.css'/>">


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <script src="<c:url value='/resources/js/common.js'/>"></script>
	<script src="<c:url value='/resources/new/js/script.js'/>"></script>
	<script src="<c:url value='/resources/lib/crypto-js/aes.js'/>"></script>
	<script src="<c:url value='/resources/lib/crypto-js/sha256.js'/>"></script>
	<script src="<c:url value='/resources/lib/jquery/jquery.validate.min.js'/>"></script>


    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<style>
.aggre_btn {
  font-size: 16px;
  line-height: 50px;
  text-align: center;
  display: block;
  background: var(--primary-color-1);
  color: #fff;
  width: 100%;
  border: none;
  border-radius: 50px;
}

.repop_close {
  display: block;
  background: none;
  border: none;
  width: 14px;
  height: 14px;
  position: absolute;
  right: 20px;
  top: 20px;
}
.repop_close img {
  width: 100%;
  display: block;
}

</style>


<body>
    <header>
        <div class="wrap">
            <div class="logo">
                <h1>
                    <a href="javascript:;"> BlendingTrend</a>
                </h1>
            </div>
            <div class="toggle_btn ">
                <button type="button">
                    <span></span>
                </button>
            </div>
            <nav class="gnb-menu ">
                <ul>
	                <c:if test="${not empty _sessionKey}">
                    <li class="sub-item"><a href="<c:url value='/web/mypage/userInfo.bt'/>">Setting</a></li	>
                    <li class="sub-item"><a href="<c:url value='/web/lgn/logOut.bt'/>">LogOut</a></li>
                    </c:if>
                    <c:if test="${empty _sessionKey}">
                    <li class="login-btn">
                        <a href="javascript:;">Login
                            <span class="icon_box">
                                <img src="/resources/new/img/arrow_next.svg" alt="">
                            </span>
                        </a>
                    </li>
                    <li class="register-btn">
                        <a href="javascript:;">Register <span class="icon_box">
                                <img src="/resources/new/img/arrow_next.svg" alt="">
                            </span>
                        </a>
                    </li>
                    </c:if>
                </ul>
            </nav>
        </div>

    </header>

    <div class="main_visual">

        <div class="wrap">
            <div class="txt">
                <h2>
                    Connecting Brands with <br>
                    Global Retail Buyers
                </h2>
                <p>
                    Brand 와 Buyer 를 연결하는 신개념 <br class="pc_none"> B2B 마켓플레이스
                </p>
            </div>
        </div>
    </div>
    <section class="blending_selider_sect">
        <div class="wrap">
            <div class="left_sect">
                <h3>
                    BlendingTrend
                </h3>
                <p>
                    글로벌 바이어에게 당신의 제품을 소개하고 <br>
                    제안하여 해외시장 진출 기회를 만들어보세요
                </p>
                <div class="blending_selide_btn">
                    <ul>
                        <li>
                            <button type="button" class="blending_selide_next">
                                <img src="/resources/new/img/arrow_pre.svg" alt="">
                            </button>
                        </li>
                        <li>
                            <button type="button" class="blending_selide_pre">
                                <img src="/resources/new/img/arrow_next.svg" alt="">
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="blending_selider">
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="item">
                                <div class="img_box">
                                    <img src="/resources/new/img/sec01_01.jpg" alt="슬라이드 이미지">
                                </div>
                                <div class="txt">
                                    <p>
                                        해외 수출시장 진입
                                    </p>
                                    <span>
                                        제품을 수출할 수 있는 다양한 국가 확인 <br>
                                        국가별 판매채널 확인 및 바이어에게 직접 제안<br>
                                        수출에 필요한 인증/포워딩/통관 등 정보 확인
                                    </span>
                                </div>
                            </div>

                        </div>
                        <div class="swiper-slide">
                            <div class="item">
                                <div class="img_box">
                                    <img src="/resources/new/img/sec01_03.jpg" alt="슬라이드 이미지">
                                </div>
                                <div class="txt">
                                    <p>
                                        신제품 소싱
                                    </p>
                                    <span>
                                        바이어 맞춤형 제품정보 및 조건으로 신제품 소싱 <br>
                                        조건 필터링이 가능한 바이어 맞춤형 데시보드 제공
                                    </span>
                                </div>
                            </div>

                        </div>
                        <div class="swiper-slide">
                            <div class="item">
                                <div class="img_box">
                                    <img src="/resources/new/img/sec01_02.jpg" alt="슬라이드 이미지">
                                </div>
                                <div class="txt">
                                    <p>
                                        해외 마케팅
                                    </p>
                                    <span>
                                        해외 인플루언서 및 셀럽 콜라보 <br>
                                        해외 구독박스 브랜드 콜라보
                                    </span>
                                </div>
                            </div>

                        </div>
                        <div class="swiper-slide">
                            <div class="item">
                                <div class="img_box">
                                    <img src="/resources/new/img/sec01_01.jpg" alt="슬라이드 이미지">
                                </div>
                                <div class="txt">
                                    <p>
                                        해외 수출시장 진입
                                    </p>
                                    <span>
                                        제품을 수출할 수 있는 다양한 국가 확인 <br>
                                        국가별 판매채널 확인 및 바이어에게 직접 제안<br>
                                        수출에 필요한 인증/포워딩/통관 등 정보 확인
                                    </span>
                                </div>
                            </div>

                        </div>
                        <div class="swiper-slide">
                            <div class="item">
                                <div class="img_box">
                                    <img src="/resources/new/img/sec01_03.jpg" alt="슬라이드 이미지">
                                </div>
                                <div class="txt">
                                    <p>
                                        신제품 소싱
                                    </p>
                                    <span>
                                        바이어 맞춤형 제품정보 및 조건으로 신제품 소싱 <br>
                                        조건 필터링이 가능한 바이어 맞춤형 데시보드 제공
                                    </span>
                                </div>
                            </div>

                        </div>
                        <div class="swiper-slide">
                            <div class="item">
                                <div class="img_box">
                                    <img src="/resources/new/img/sec01_02.jpg" alt="슬라이드 이미지">
                                </div>
                                <div class="txt">
                                    <p>
                                        해외 마케팅
                                    </p>
                                    <span>
                                        해외 인플루언서 및 셀럽 콜라보 <br>
                                        해외 구독박스 브랜드 콜라보
                                    </span>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="main_tab_sect">
        <div class="wrap">
            <div class="main_tab_menu">
                <ul>
                    <li class="on">
                        <a href="javascript:void(0);">
                            Brand
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);">
                            Buyers
                        </a>
                    </li>
                </ul>
            </div>
            <div class="main_tab_cont">
                <div class="main_tab_subcont">
                    <div class="txt">
                        <p>
                            해외 시장 진출을 준비하는 브랜드를 위한 <br>
                            블렌딩트렌드의 준비된 서비스
                        </p>
                    </div>
                    <div class="main_tab_cont_list">
                        <ul>
                            <li>
                                <img src="/resources/new/img/sec02_01.jpg" alt="">
                                <div class="txt_box">
                                    <p>
                                        브랜드 랜딩 페이지
                                    </p>
                                    <span>
                                        브랜드 전용 홍보용 페이지 <br>
                                        브랜드가 보유한 전제품 및 <br> 브랜드 아이덴티티 확인 <br>
                                        검증된 브랜드/기업 상세정보 노출
                                    </span>
                                </div>
                            </li>
                            <li>
                                <img src="/resources/new/img/sec02_02.jpg" alt="">
                                <div class="txt_box">
                                    <p>
                                        카드식 제품제안서
                                    </p>
                                    <span>
                                        바이어에게 필요한 필수 제품 정보 강조<br>
                                        제품의 유통현황 및 인증 상태 확인
                                    </span>
                                </div>
                            </li>
                            <li>
                                <img src="/resources/new/img/sec02_03.jpg" alt="">
                                <div class="txt_box">
                                    <p>
                                        기타 수출 서비스
                                    </p>
                                    <span>
                                        글로벌 유통 시장 확인<br>
                                        국가별 판매채널 및 바이어 검색<br>
                                        해외 인증, 포워딩 및 통관 정보
                                    </span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="main_tab_subcont">
                    <div class="txt">
                        <p>
                            해외 시장 진출을 준비하는 브랜드를 위한 <br>
                            블렌딩트렌드의 준비된 서비스
                        </p>
                    </div>
                    <div class="main_tab_cont_list">
                        <ul>
                            <li>
                                <img src="/resources/new/img/sec02_04.jpg" alt="">
                                <div class="txt_box">
                                    <p>
                                        신제품 소싱
                                    </p>
                                    <span>
                                        바이어 전용 데시보드로 소싱 시간 단축 <br>
                                        인기 신제품 및 트렌딩 제품을 실시간 확인
                                    </span>
                                </div>
                            </li>
                            <li>
                                <img src="/resources/new/img/sec02_05.jpg" alt="">
                                <div class="txt_box">
                                    <p>
                                        바이어 맞춤 큐레이션 리스트
                                    </p>
                                    <span>
                                        상세 조건 필터로 필요한 제품 검색 <br>
                                        관심 제품을 저장하여 미래 소싱에 사용
                                    </span>
                                </div>
                            </li>
                            <li>
                                <img src="/resources/new/img/sec02_06.jpg" alt="">
                                <div class="txt_box">
                                    <p>
                                        커스텀 서비스
                                    </p>
                                    <span>
                                        신제품 모집 일정 관리 <br>
                                        PB 상풍 제조자 소싱 <br>
                                        해외 브랜드사 확인/검증
                                    </span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="new_wrap" style="display:none">
        <div class="wrap " >
            <div class="news_list">
                <div class=" swiper mySwiper">
                    <ul class="swiper-wrapper">
                        <li class="swiper-slide">
                            <a href="javascript:;">
                                <div>
                                    <span class="tag">
                                        News
                                    </span>
                                    <p class="tit">
                                        보이는 스며들어 있을 황금시대를 싶이 인간이 것이다 보이는 스며들어 있을 황금시대를 싶이 인간이 것이다
                                    </p>
                                </div>
                                <span class="news_date">
                                    2023.03.10
                                </span>
                            </a>
                        </li>
                        <li class="swiper-slide">
                            <a href="javascript:;">
                                <div>
                                    <span class="tag">
                                        News
                                    </span>
                                    <p class="tit">
                                        보이는 스며들어 있을 황금시대를 싶이 인간이 것이다.
                                    </p>
                                </div>
                                <span class="news_date">
                                    2023.03.10
                                </span>
                            </a>
                        </li>
                        <li class="swiper-slide">
                            <a href="javascript:;">
                                <div>
                                    <span class="tag">
                                        News
                                    </span>
                                    <p class="tit">
                                        보이는 스며들어 있을 황금시대를 싶이 인간이 것이다 보이는 스며들어 있을 황금시대를 싶이 인간이 것이다
                                    </p>
                                </div>
                                <span class="news_date">
                                    2023.03.10
                                </span>
                            </a>
                        </li>
                        <li class="swiper-slide">
                            <a href="javascript:;">
                                <div>
                                    <span class="tag">
                                        News
                                    </span>
                                    <p class="tit">
                                        보이는 스며들어 있을 황금시대를 싶이 인간이 것이다.
                                    </p>
                                </div>
                                <span class="news_date">
                                    2023.03.10
                                </span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section class="partner_wrap">
        <div class="partner_slider">
            <div class="partner_logo">
                <img src="/resources/new/img/partner01.png" alt="">
            </div>
            <div class="partner_logo">
                <img src="/resources/new/img/partner02.png" alt="">
            </div>
            <div class="partner_logo">
                <img src="/resources/new/img/partner03.png" alt="">
            </div>
            <div class="partner_logo">
                <img src="/resources/new/img/partner04.png" alt="">
            </div>
            <div class="partner_logo">
                <img src="/resources/new/img/partner05.png" alt="">
            </div>
            <div class="partner_logo">
                <img src="/resources/new/img/partner01.png" alt="">
            </div>
            <div class="partner_logo">
                <img src="/resources/new/img/partner02.png" alt="">
            </div>
            <div class="partner_logo">
                <img src="/resources/new/img/partner03.png" alt="">
            </div>
            <div class="partner_logo">
                <img src="/resources/new/img/partner04.png" alt="">
            </div>
            <div class="partner_logo">
                <img src="/resources/new/img/partner05.png" alt="">
            </div>
        </div>
        </div>
    </section>
    <div class="registration_btn">
        <a href="https://forms.gle/fFpZn9qAV7cs2RLJ9" target="_blank">무료 <br>
            등록신청</a>
    </div>
    <footer>
        <div class="wrap">
            <div class="ft_top">
                <div class="ft_logo">
                    <a href="javascript:;">
                        <img src="/resources/new/img/ft_logo.svg" alt="">
                    </a>
                </div>
                <div class="ft_menu">
                    <ul>
                        <li><a href="javascript:;" class="terms_btn">개인정보 처리방침</a></li>
                        <li><a href="javascript:;" class="terms_btn">이용약관</a></li>
                        <li><a href="javascript:;">사업자정보확인</a></li>
                    </ul>
                </div>
            </div>
            <div class="ft_info">
                <p class="txt">
                    (주)블렌딩트렌드 <span class="ft_none">| </span> <br class="ft_block">서울특별시 강남구 테헤란로79길 6, JS타워 4층 브이444
                    <span class="ft_none">|

                    </span>Tel: 070-8064-8424 <br class="ft_block"><span class="ft_none">|
                    </span> Fax: 0504-236-5214 <br>
                    대표이사: 신성훈 <br class="ft_block"> <span class="ft_none">|
                    </span> 사업자등록번호: 191-81-02360 <br class="ft_block"><span class="ft_none">|
                    </span> 개인정보관리자: 신성훈 <br class="ft_block"> <span class="ft_none">|
                    </span> 통신판매신고번호: 2023-서울강남-00802 <br>
                    email: connect@blendingtrend.com <span class="ft_none">|
                    </span> <br class="ft_block"> Copyright (C) BlendingTrend Co., Ltd. All Rights Reserved
                </p>
                <div class="ft_customer">
                    <p>
                        CUSTOMER SERVICE

                    </p>
                    <span>
                        070-8064-8424 <br>
                        MON-FRI 10AM-5PM
                    </span>
                </div>
            </div>
        </div>
    </footer>
    <div class="overlay "></div>
    <div class="overlay2 "></div>


    <div class="login_wrap pop_box ">
        <div class="pop_cont">
            <div class="logo">
                BlendingTrend
            </div>
            <button class="pop_close" type="button">
                <img src="/resources/new/img/close.svg" alt="닫기">
            </button>
            <sf:form commandName="loginFm" action="loginDo.lp" >
	            <input type="hidden" id="sessKey" 		name="sessKey" 		/>
                <ul class="default_form">
                    <li>
                        <div class="input-box">
	                        <input type="text" class="input-text" id="loginId" name="loginId" placeholder="아이디를 입력해주세요.">
                            <label>아이디</label>
                        </div>
                    </li>
                    <li>
                        <div class="input-box">
   							<input type="hidden" id="userPassword" 	name="userPassword" 	/>
							<input type="password" class="input-text" id="userPasswordTmp" name="" placeholder="비밀번호를 입력해주세요.">
                            <!-- <input type="password" placeholder="비밀번호를 입력해주세요."> -->
                            <label>비밀번호</label>
                        </div>
                    </li>
                </ul>
                <div class="login_check">
                    <ul>
                        <li>
	                        <input type="checkbox" id="idSaveCheck" name="idSaveCheck" value="true" checked class="checkBtn">
                            <label for="id_save">아이디 저장</label>
                        </li>
                        <li>
	                        <input type="checkbox" id="auto_login" name="auto_login" value="true" class ="checkBtn">
                            <label for="auto_login">자동 로그인</label>
                        </li>
                    </ul>
                </div>
                <button type="button" class="main_btn" onclick="javascript:loginDo();return false;" >로그인</button>
            </sf:form>
        </div>
    </div>
    <div class="register_wrap pop_box ">
        <div class="pop_cont">
            <div class="tit">
                회원가입
            </div>
            <div class="txt">
                <p>
                    다양한 글로벌 바이어를 만나보세요.
                </p>
                <span>무료 브랜드 프로파일 등록</span>
            </div>
            <button class="pop_close" type="button">
                <img src="/resources/new/img/close.svg" alt="닫기">
            </button>

            <sf:form commandName="saveFm" action="joinDo.lp">
            <input type="hidden" id="userType"  name="userType" />
                <div class="register_type">
                    <ul class="">
                        <li>
                            <input type="radio" name="register_type" id="register_brand" class="userType" checked hidden>
                            <label for="register_brand">Brand</label>
                        </li>
                        <li>
                            <input type="radio" name="register_type" id="register_buyers" class="userType" hidden>
                            <label for="register_buyers">Buyers</label>
                        </li>
                    </ul>
                </div>
                <div class="register_box">
                    <ul class="default_form">
                        <li>
                            <div class="input-box">
                                <input type="text" name="lastNm" id="lastNm"  placeholder="이름을 입력해주세요.">
                                <label>이름</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-box">
                                <input type="text" name="firstNm" id="firstNm" placeholder="성을 입력해주세요.">
                                <label>성</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-box">
                                <input type="email" name="email" placeholder="Email" value="" id="email" placeholder="이메일을 입력해주세요.">
                                <label>이메일</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-box">
                                <input type="password" name="password" id="password" placeholder="password 영문대소+숫자+특수문자 8~20">
                                <label>Password</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-box">
                                <input type="text" name="phone" id="phone"placeholder="번호를 입력해주세요.">
                                <label>Phone</label>
                            </div>
                        </li>
                        <li>
                            <div class="input-box">
                                <input type="text" name="cmpyNm" id="cmpyNm"placeholder="회사명을 입력해주세요.">
                                <label>회사명</label>
                            </div>
                        </li>
                    </ul>
                    <div class="register_check">
                        <ul>
                            <li>
                                <input type="checkbox" name="checkAgree" id="agree_check" class="checkBtn">
                                <label for="agree_check"><a href="javascript:;">서비스 약관</a> 및 <a href="javascript:;">개인
                                        정보 보호</a> 정책을 읽었으며 이에
                                    동의합니다.</label>
                            </li>

                        </ul>
                    </div>
                    <button type="button" class="main_btn saveBtn">계속</button>
                </div>
            </sf:form>
        </div>
    </div>

    <div class="terms_wrap pop_box ">
        <div class="pop_cont">
            <div class="tit">
                이용약관
            </div>
            <div class="txt">
                <p>
                    약관에 동의해주세요.
                </p>
                <span>서비스 이용에 필요한 약관을 확인하여 동의해주세요.</span>
            </div>
            <button class="repop_close" type="button">
                <img src="/resources/new/img/close.svg" alt="닫기">
            </button>
            <form>
                <div class="fullagree_wrap agree_wrap">
                    <input type="checkbox" id="fullagree" class="agree_checkBtn checkBtn">
                    <label for="fullagree">약관 전체 동의</label>
                </div>
                <div class="agree_box">
                    <ul class="agree_list">
                        <li class="">
                            <div class="flex-sb">
                                <div class="agree_wrap">
                                    <input type="checkbox" id="agree01" class="agree_checkBtn checkBtn" name="terms">
                                    <label for="agree01">이용약관에 동의합니다. <span>(필수)</span>
                                    </label>
                                </div>
                                <div class="down_btn">
                                    <button type="button">
                                        <img src="/resources/new/img/down.svg" alt="">
                                    </button>
                                </div>
                            </div>
                            <div class="agree_txt">
                                <p>
                                    이용약관 <br>
                                    제 1조 [목적]<br>
                                    이 약관은 ㈜블렌딩트렌드가 운영하는 블렌딩트렌드 플랫폼 (이하“플랫폼”이라 함)에서 제공하는 인터넷 관련 서비스 (이하 “서비스”라 한다)를 이용함에
                                    있어 플랫폼과 이용자의 권리, 의무 및 책임 사항을 규정함을 목적으로 합니다.<br>
                                    제 2조 [정의]<br>
                                    플랫폼이란 블렌딩트렌드가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신 설비를 이용하여 재화를 거래할 수
                                    있도록 설정한 가상의 영업장을 말하며, 아울러 플랫폼을 운영하는 사업자의 의미로도 사용합니다.<br>
                                    "이용자"란 플랫폼에 접속하여 이 약관에 따라 플랫폼이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
                                    '회원'이라 함은 플랫폼에 개인정보를 제공하여 회원 등록을 한 자로서, 플랫폼의 정보를 지속적으로 제공받으며, 플랫폼이 제공하는 서비스를 계속적으로
                                    이용할 수 있는 자를 말합니다.<br>
                                    제 3조 [약관등의 명시와 설명 및 개정]<br>
                                    플랫폼은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 팩스 번호, 전자
                                    우편 주소, 사업자 등록 번호, 통신 판매업 신고 번호, 개인 정보관리 책임자 등을 이용자가 쉽게 알 수 있도록 몰의 초기 서비스화면(전면)에
                                    게시합니다.<br>
                                    다만, 약관의 내용은 이용자가 연결 화면을 통하여 볼 수 있도록 할 수 있습니다.<br>
                                    플랫폼은 전자 상거래 등에서의 소비자 보호에 관한 법률, 약관의 규제에 관한 법률, 전자 거래 기본법, 전자 서명법, 정보 통신망 이용 촉진 등에 관한
                                    법률, 방문 판매 등에 관한 법률, 소비자 보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>
                                    플랫폼이 약관을 개정할 경우에는 적용 일자 및 개정 사유를 명시하여 현행 약관과 함께 플랫폼의 초기 화면에 그 적용 일자 7일 이전부터 적용 일자
                                    전일까지 공지합니다.<br>
                                    플랫폼이 약관을 개정할 경우에는 그 개정 약관은 그 적용 일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관
                                    조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정 약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정 약관의 공지 기간 내에
                                    ‘몰“에 송신하여 플랫폼의 동의를 받은 경우에는 개정 약관 조항이 적용됩니다.<br>
                                    이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률, 공정거래위원회가 정하는
                                    전자상거래등에서의소비자보호지침 및 관계법령 또는 상관례에 따릅니다.<br>
                                    제 4조 [서비스의 제공 및 변경]<br>
                                    플랫폼은 다음과 같은 업무를 수행합니다.<br>
                                    재화 또는 용역에 대한 정보 제공 및 구매 계약의 체결
                                    구매 계약이 체결된 재화 또는 용역의 배송
                                    기타 플랫폼이 정하는 업무
                                    <br>
                                    플랫폼은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다.
                                    이 경우에는 변경된 재화 또는 용역의 내용 및 제공 일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 그 제공 일자 이전 7일부터 공지합니다
                                    플랫폼이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 이로 인하여 이용자가
                                    입은 손해를 배상합니다. 단, “플랫폼”에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.<br>
                                    <br>
                                    제 5조 [서비스의 중단]<br>
                                    플랫폼은 컴퓨터 등 정보 통신 설비의 보수 점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수
                                    있습니다.제 1항에 의한 서비스 중단의 경우에는 플랫폼은 제8조에 정한 방법으로 이용자에게 통지합니다.<br>
                                    플랫폼은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, 플랫폼이 고의 또는
                                    과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br>
                                    사업 종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 플랫폼은 제8조에 정한 방법으로 이용자에게 통지하고
                                    당초 플랫폼에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, 플랫폼이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을
                                    플랫폼에서 통용되는 통화 가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.<br>
                                    제 6조 [회원가입]<br>
                                    이용자는 플랫폼이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.<br>
                                    플랫폼은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.1. 가입신청자가 이 약관
                                    제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 31일이 경과한 자로서 플랫폼의 회원재가입
                                    승낙을 얻은 경우에는 예외로 한다.2. 등록 내용에 허위, 기재누락, 오기가 있는 경우3. 기타 회원으로 등록하는 것이 플랫폼의 기술상 현저히 지장이
                                    있다고 판단되는 경우4. 만 14세 미만인 경우<br>
                                    회원가입계약의 성립시기는 플랫폼의 승낙이 회원에게 도달한 시점으로 합니다.<br>
                                    회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 플랫폼에 대하여 그 변경사항을 알려야 합니다.<br>
                                    제 7조 [회원 탈퇴 및 자격 상실 등]<br>
                                    회원은 플랫폼에 언제든지 탈퇴를 요청할 수 있으며 플랫폼은 즉시 회원탈퇴를 처리합니다. 탈퇴시 포인트 및 쿠폰, 등급 혜택은 모두 소멸되며 탈퇴 후 재
                                    가입은 탈퇴일자로 부터 1개월 후 가능합니다.<br>
                                    회원이 다음 각호의 사유에 해당하는 경우, 플랫폼은 회원자격을 제한 및 정지시킬 수 있습니다.1. 가입 신청시에 허위 내용을 등록한 경우2. 플랫폼을
                                    이용하여 구입한 재화등의 대금, 기타 플랫폼이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우3. 다른 사람의 플랫폼 이용을 방해하거나
                                    그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우4. 플랫폼을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
                                    플랫폼이 회원 자격을 제한, 정지 시킨후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지 아니하는 경우 플랫폼은 회원자격을 상실시킬
                                    수 있습니다.<br>
                                    플랫폼이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소전에 소명할 기회를 부여합니다.<br>
                                    제 8조 [회원에 대한 통지]<br>
                                    플랫폼이 회원에 대한 통지를 하는 경우, 회원이 플랫폼과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.<br>
                                    플랫폼은 불특정다수 회원에 대한 통지의 경우 1주일이상 플랫폼 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다.<br>
                                    제 9조 [구매신청]<br>
                                    플랫폼 이용자는 플랫폼 상에서 다음 또는 이와 유사한 방법에 의하여 구매를 합니다. 다만, 플랫폼의 사이버 캐시 적립과 관련한 원천 징수 세금의 기본
                                    자료로써 첫 구매 거래 시점에서 주민등록번호를 입력하여야 합니다. (소득세법 제 127조, 129조 5항에 의거)1. 재화등의 검색 및 선택2. 성명,
                                    주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력3. 약관내용, 청약철회권이 제한되는 서비스, 배송료, 설치비 등의 비용부담과 관련한 내용에
                                    대한 확인4. 이 약관에 동의하고 위 3호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)5. 재화 등의 구매신청 및 이에 관한 확인 또는<br>
                                    플랫폼의 확인에 대한 동의6. 결제방법의 선택7. 주민등록번호 (첫 구매거래시점/본인인증)<br>
                                    제 10조 [계약의 성립]<br>
                                    플랫폼은 제9조와 같은 구매 신청에 대하여 다음 각호에 해당하지 않는 한 승낙합니다.1. 신청 내용에 허위, 기재누락, 오기가 있는 경우2. 미성년자가
                                    담배, 주류등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우3. 기타 구매신청에 승낙하는 것이 플랫폼 기술상 현저히 지장이 있다고 판단하는
                                    경우<br>
                                    플랫폼의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.<br>
                                    제 11조 [지급방법]<br>
                                    플랫폼에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각호의 방법 중 가용한 방법으로 할 수 있습니다.1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의
                                    각종 계좌이체2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제3. 온라인무통장입금4. 전자화폐에 의한 결제5. 마일리지 등 플랫폼이 지급한
                                    포인트에 의한 결제6. 플랫폼과 계약을 맺었거나 플랫폼이 인정한 상품권에 의한 결제7. 기타 전자적 지급 방법에 의한 대금 지급 등<br>
                                    제 12조 [수신확인통지, 구매신청 변경 및 취소]<br>
                                    플랫폼은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.<br>
                                    신확인통지를 받은 이용자는 의사표시의 불일치등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 플랫폼은 배송전에
                                    이용자의 요청이 있는 경우에는 지체없이 그 요청에 따라 처리하여야 합니다.<br>
                                    제 13조 [배송]<br>
                                    플랫폼은 이용자가 구매한 재화에 대해 배송 수단, 수단별 배송 비용 부담자, 수단별 배송 기간 등을 명시합니다.만약 플랫폼의 고의, 과실로 약정 배송
                                    기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다.다만 플랫폼이 고의, 과실이 없음을 입증한 경우에는 그러하지 아니합니다.<br>
                                    제 14조 [환급]<br>
                                    플랫폼은 이용자가 구매 신청한 재화 또는 용역이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에
                                    재화 등의 대금을 받은 경우에는 대금을 받은 날부터 ‘플랫폼’ 영업일 기준 3일 이내에, 그렇지 않은 경우에는 그 사유 발생일로부터 ‘플랫폼’ 영업일
                                    기준 3일 이내에 계약 해제 및 환급 절차를 취합니다.<br>
                                    제 15조 [청약철회 등]<br>
                                    플랫폼과 재화등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다.<br>
                                    이용자는 재화등을 배송받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.1. 이용자에게 책임 있는 사유로 재화 등이 멸실
                                    또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)2. 이용자의 사용 또는 일부 소비에
                                    의하여 재화 등의 가치가 현저히 감소한 경우3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우4. 같은 성능을 지닌
                                    재화등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우<br>
                                    제2항제2호 내지 제4호의 경우에 플랫폼이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의
                                    조치를 하지 않았다면 이용자의 청약철회등이 제한되지 않습니다.<br>
                                    이용자는 제1항 및 제2항의 규정에 불구하고 재화등의 내용이 표시광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화등을 공급받은 날부터
                                    3월이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.<br>
                                    제 16조 [청약철회 등의 효과]<br>
                                    플랫폼은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화등의 대금을 환급합니다. 이 경우 플랫폼이 이용자에게 재화등의 환급을
                                    지연한 때에는 그 지연기간에 대하여 공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.<br>
                                    플랫폼은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화등의 대금을 지급한 때에는 지체없이 당해 결제수단을 제공한
                                    사업자로 하여금 재화등의 대금의 청구를 정지 또는 취소하도록 요청합니다.<br>
                                    청약철회등의 경우 공급받은 재화등의 반환에 필요한 비용은 이용자가 부담합니다. 플랫폼은 이용자에게 청약철회등을 이유로 위약금 또는 손해배상을 청구하지
                                    않습니다. 다만 재화등의 내용이 표시?광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회등을 하는 경우 재화등의 반환에 필요한 비용은 플랫폼이
                                    부담합니다.<br>
                                    이용자가 재화등을 제공받을때 발송비를 부담한 경우에 플랫폼은 청약철회시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.<br>
                                    제 17조 [개인정보보호]<br>
                                    플랫폼은 이용자의 정보수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다.1.
                                    성명2. 생년월일3. 주소4. 전화번호 및 이동 전화번호5. 희망ID(회원의 경우)6. 비밀 번호(회원의 경우)7. 전자 우편 주소(또는 이동
                                    전화번호)8. 비밀 번호 힌트용 질문과 답변 (회원의 경우)9. E-mail (회원의 경우)10. 메일 수신 여부 (회원의 경우)
                                    플랫폼이 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.<br>
                                    제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 플랫폼이 집니다. 다만, 다음의
                                    경우에는 예외로 합니다.1. 배송 업무상 배송 업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우2. 통계 작성,
                                    학술 연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우3. 여행 상품 이용 시 여행 상품 제공을 목적으로
                                    해당 기관(항공사, 숙박 업소 등)에 알려주는 경우4. 고객의 제세 공과금(원천 징수 세금 포함) 관련 해당 기관(세무서 등)에 통보하는
                                    경우5.<br>
                                    당사가 제공하는 서비스의 질을 향상시키기 위한 당사의 비즈니스 파트너와의 제휴 서비스, 당사가 운영하는 콜 센터의 텔레마케팅 서비스 (보험, 신용 카드
                                    등)를 위하여 최소한의 정보(성명, 주소, 전화번호)를 이용하는 경우6. 당사의 사후 불만 처리 업무 및 고객 서비스 업무를 수행하는 제3자에게
                                    최소한의 정보(성명, 주소, 전화번호)를 제공하는 경우<br>
                                    플랫폼이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의
                                    수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 정보통신망이용촉진등에관한법률 제22조제2항이
                                    규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.개인정보 관리책임자 : 신성훈
                                    (connect@blendingtrend.com )<br>
                                    이용자는 언제든지 플랫폼이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 플랫폼은 이에 대해 지체 없이 필요한 조치를 취할
                                    의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 플랫폼은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br>
                                    플랫폼은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조
                                    등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.<br>
                                    플랫폼 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다. 단,
                                    사이버 캐시의 이용과 관련한 개인 정보는 관련 회계 처리가 모두 종료되는 시점에 파기 합니다.<br>
                                    제 18조 [플랫폼의 의무]<br>
                                    플랫폼은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화 용역을 제공하는데
                                    최선을 다하여야 합니다.<br>
                                    플랫폼은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.<br>
                                    플랫폼이 상품이나 용역에 대하여 「표시광고의공정화에관한법률」 제3조 소정의 부당한 표시, 광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할
                                    책임을 집니다.<br>
                                    플랫폼은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.<br>
                                    제 19조 [회원의 ID 및 비밀번호에 대한 의무]<br>
                                    제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.<br>
                                    회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.<br>
                                    회원이 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “플랫폼”에 통보하고 “플랫폼”의 안내가 있는 경우에는
                                    그에 따라야 합니다.<br>
                                    제 20조 [이용자의 의무]<br>
                                    이용자는 다음 행위를 하여서는 안됩니다.1. 신청 또는 변경시 허위 내용의 등록2. 타인의 정보 도용3. 플랫폼에 게시된 정보의 변경4. 플랫폼이 정한
                                    정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시5. 플랫폼 기타 제3자의 저작권 등 지적재산권에 대한 침해6. 플랫폼의 명예를 손상시키거나
                                    업무를 방해하는 행위, 게시판을 통해 이를 악의적으로 등록할 경우에는 플랫폼은 해당 내용물을 비공개로 전환한 후 이용자에게 공지할 수 있음7. 외설
                                    또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위8. 불특정 다수의 자를 대상으로 플랫폼의 서비스를
                                    이용하여 영리 목적으로 활동하는 행위<br>
                                    제 21조 [연결 플랫폼과 피연결 플랫폼 간의 관계]<br>
                                    상위 플랫폼과 하위 플랫폼이 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결
                                    플랫폼(웹 사이트)이라고 하고 후자를 피연결 플랫폼(웹사이트)이라고 합니다.<br>
                                    연결 플랫폼은 피연결 플랫폼이 독자적으로 제공하는 재화등에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 연결 플랫폼의 초기화면
                                    또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.<br>
                                    제 22조 [저작권의 귀속 및 이용제한]<br>
                                    플랫폼이 작성한 저작물에 대한 저작권 기타 지적재산권은 플랫폼에 귀속합니다.<br>
                                    이용자는 플랫폼을 이용함으로써 얻은 정보를 플랫폼의 사전 승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나
                                    제3자에게 이용하게 하여서는 안됩니다.<br>
                                    회원이 창작하여 "플랫폼"에 게재 또는 등록한 게시물에 대한 저작권은 회원 본인에게 있으며 해당 게시물이 타인의 지적 재산권을 침해하여 발생되는 모든
                                    책임은 회원 본인에게 해당됩니다.<br>
                                    회원은 자신이 창작, 등록한 게시물을 플랫폼의 서비스를 운영, 전송 배포 또는 홍보를 위해 사용료 없는 사용권을 플랫폼에 부여합니다. 사용권은 플랫폼이
                                    서비스를 운영하는 동안 유효하며 회원의 탈퇴 후에도 유효합니다.1. 플랫폼이 제공하는 관련 서비스 내에서 회원들의 게시물에 대한 복제, 전시, 배포,
                                    편집 저작물 작성2. 플랫폼 제휴 파트너에게 회원의 게시물 내용을 제공. 단 회원의 아이디 외의 개인정보는 제공하지 않는다3. 상기 사용권 외에 회원의
                                    게시물을 상업적으로 이용하고자 할 경우 회원의 사전 동의를 얻어야 한다. 플랫폼이 회원의 게시물을 상업적으로 이용할 경우 별도의 보상 제도를 운영할 수
                                    있다.<br>
                                    회원의 게시물에 대해 제 3자로부터 저작권 및 기타 권리의 침해로 이의가 제기된 경우 플랫폼은 해당 게시물을 임의로 삭제할 수 있으며 해당 게시물에
                                    대한 법적 문제가 종결된 후 이를 근거로 플랫폼에 신청이 있는 경우에만 상기 임시 삭제된 게시물을 다시 게재할 수 있습니다.<br>
                                    제 23조 [분쟁해결]<br>
                                    플랫폼은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치 운영합니다.<br>
                                    플랫폼은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와
                                    처리일정을 즉시 통보해 드립니다.<br>
                                    플랫폼과 이용자간에 발생한 분쟁은 전자 거래 기본법 제28조 및 동 시행령 제 15조에 의하여 설치된 전자 거래 분쟁 조정 위원회의 조정에 따를 수
                                    있습니다.<br>
                                    제 24조 [재판권 및 준거법]<br>
                                    플랫폼과 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 민사소송법상의 관할법원에 제기합니다.<br>
                                    플랫폼과 이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다.<br>(부칙) 본 약관은 2022년 3월 1일부터 시행됩니다.

                                </p>
                            </div>
                        </li>

                        <li>
                            <div class="flex-sb">
                                <div class="agree_wrap">
                                    <input type="checkbox" name="terms" id="agree03" class="agree_checkBtn checkBtn">
                                    <label for="agree03">개인정보처리방침에 동의합니다. <span>(필수)</span></label>
                                </div>
                                <div class="down_btn">
                                    <button type="button">
                                        <img src="/resources/new/img/down.svg" alt="">
                                    </button>
                                </div>
                            </div>
                            <div class="agree_txt">
                                <p>
                                    개인정보처리방침<br>
                                    ㈜블렌딩트렌드는 (이하 "회사"는) 고객님의 개인정보를 중요시하며, "개인정보 보호법" 등 관련 법령을 준수하고 있습니다.<br>회사는
                                    개인정보처리방침을
                                    통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지
                                    알려드립니다.<br> ■ 수집하는 개인정보 항목 및 수집방법가. 수집하는 개인정보의 항목o 회사는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은
                                    개인정보를 수집하고 있습니다.<br>- 회원가입시 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택
                                    전화번호 , 휴대전화번호 , 이메일 ,
                                    14세미만 가입자의 경우 법정대리인의 정보- 서비스 신청시 : 주소, 결제 정보 o 서비스 이용 과정이나 사업 처리 과정에서
                                    서비스이용기록, 접속로그, 쿠키, 접속 IP, 결제 기록, 불량이용 기록이 생성되어 수집될 수
                                    있습니다.<br> 나. 수집방법- 홈페이지, 서면양식, 게시판, 이메일, 이벤트 응모, 배송요청, 전화, 팩스, 생성 정보 수집 툴을 통한
                                    수집<br> ■ 개인정보의
                                    수집 및 이용목적회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br>o 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산콘텐츠
                                    제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스o 회원 관리회원제 서비스 이용에 따른
                                    본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정
                                    대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달o 마케팅 및 광고에 활용이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의
                                    서비스 이용에 대한 통계 ■ 개인정보의 보유 및 이용기간원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이
                                    파기합니다.<br> 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다. <br>가. 회사 내부방침에 의한 정보보유 사유 회원이
                                    탈퇴한 경우에도
                                    불량회원의 부정한 이용의 재발을 방지, 분쟁해결 및 수사기관의 요청에 따른 협조를 위하여, 이용계약 해지일로부터 oo년간 회원의 정보를 보유할 수
                                    있습니다.<br> 나. 관련 법령에 의한 정보 보유 사유전자상거래등에서의소비자보호에관한법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는
                                    아래와<br>
                                    같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.o 계약 또는 청약철회 등에 관한<br>
                                    기록-보존이유 : 전자상거래등에서의소비자보호에관한법률-보존기간 : 5년o 대금 결제 및 재화 등의 공급에 관한<br>
                                    기록-보존이유: 전자상거래등에서의소비자보호에관한법률-보존기간 : 5년o 소비자 불만 또는 분쟁처리에 관한<br>
                                    기록-보존이유 : 전자상거래등에서의소비자보호에관한법률-보존기간 : 3년o 로그 기록-보존이유: 통신비밀보호법-보존기간 : 3개월 ■ 개인정보의 파기절차
                                    및 방법회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다.<br> 파기절차 및 방법은 다음과
                                    같습니다.o<br> 파기절차회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침
                                    및 기타
                                    관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다.<br>별도 DB로 옮겨진 개인정보는 법률에 의한
                                    경우가
                                    아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.<br>o 파기방법전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적
                                    방법을
                                    사용하여 삭제합니다. ■ 개인정보 제공회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다.<br> 다만, 아래의 경우에는 예외로
                                    합니다.<br>o 이용자들이 사전에 동의한 경우o 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는
                                    경우 ■ 수집한 개인정보의 위탁회사는 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다.<br>o 위탁 대상자 : [택배사
                                    이름]<br>o 위탁업무 내용 : [택배사 위탁 내용] <br>o 위탁 대상자 : [PG사 이름]<br>o 위탁업무 내용 : [PG사 위탁
                                    내용]<br> o 위탁
                                    대상자 : 공급업체 목록보기<br>o 위탁업무 내용 : [위탁업무 내용]  ■ 이용자 및 법정대리인의 권리와 그 행사방법o 이용자는 언제든지 등록되어
                                    있는
                                    자신의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.o 이용자들의 개인정보 조회,수정을
                                    위해서는 "개인정보변경"(또는 "회원정보수정" 등)을 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭하여 본인 확인 절차를 거치신 후 직접
                                    열람, 정정 또는 탈퇴가 가능합니다.<br>o 혹은 개인정보보호책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.<br>o 귀하가
                                    개인정보의
                                    오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다.<br> 또한 잘못된 개인정보를 제3자에게
                                    이미
                                    제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.<br>o 회사는 이용자의 요청에 의해 해지 또는 삭제된
                                    개인정보는 "회사가 수집하는 개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고
                                    있습니다.<br> ■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항회사는 귀하의 정보를 수시로 저장하고
                                    찾아내는 "쿠키(cookie)" 등을
                                    운용합니다. <br>쿠키란 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에
                                    저장됩니다.<br>회사은(는) 다음과 같은 목적을 위해 쿠키를 사용합니다.<br>o 쿠키 등 사용 목적1. 회원과 비회원의 접속 빈도나 방문 시간 등을
                                    분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스
                                    제공2. 귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다.<br> 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가
                                    저장될
                                    때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.o 쿠키 설정 거부 방법1. 쿠키 설정을 거부하는 방법으로는 회원님이
                                    사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수
                                    있습니다.<br>2. 설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보3. 단, 귀하께서 쿠키 설치를
                                    거부하였을
                                    경우 서비스 제공에 어려움이 있을 수 있습니다.<br> ■ 개인정보에 관한 민원서비스회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기
                                    위하여
                                    아래와 같이 관련 부서 및 개인정보보호책임자를 지정하고 있습니다.<br>o 개인정보보호담당자성명 : 신성훈소속 : 대표TEL
                                    070-8064-8424<br>팩스 0504-236-5214<br>이메일 : connect@blendingtrend.com <br>o 귀하께서는 회사의
                                    서비스를 이용하시며
                                    발생하는 모든 개인정보보호 관련 민원을 개인정보보호책임자 혹은 담당부서로 신고하실 수 있습니다.<br>o 회사는 이용자들의 신고사항에 대해 신속하게
                                    충분한
                                    답변을 드릴 것입니다.<br>o 기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기
                                    바랍니다.<br>개인정보침해신고센터 (privacy.kisa.or.kr / 국번 없이 118)<br>개인정보분쟁조정위원회 (kopico.go.kr /
                                    1833-6972)<br>대검찰청 사이버수사과 (spo.go.kr / 지역번호+1301<br>)경찰청
                                    사이버안전국 (cyberbureau.police.go.kr
                                    / 국번없이 182)
                                </p>
                            </div>
                        </li>

                    </ul>
                </div>
                <button type="button" class="aggre_btn checkAgree">약관동의 </button>
            </form>

        </div>
    </div>


    <script>
        $('.down_btn').on('click', function () {
            $(this).parents('li').toggleClass('on');
        });

        $("#fullagree").click(function () {
            $("#fullagree").toggleClass("on");
            if ($("#fullagree").hasClass("on")) {
                $("input[name=terms]").prop("checked", true);
            }

        });
        $("input[name=chk]").click(function () {
            var total = $("input[name=terms]").length;
            var checked = $("input[name=terms]:checked").length;

            if (total != checked) {
                $("#fullagree").removeClass("on");
                $("#fullagree").prop("checked", false);
            }
            else {
                $("#fullagree").addClass("on"); $("#fullagree").prop("checked", true);
            }
        });


     var symtcKey="";

        	$( document ).ready(function() {
        		var urls = "<c:url value='/web/main/index.ax'/>";
        		$.ajax({
        			type : "get",
        			url : urls,
        			success : function(result) {
        				$("#sessKey").val(result._ssesKey);
        				symtcKey = result._symtcKey;
        			},
        			error : function(e) {
        				console.log(JSON.stringify(e));
        			}
        		});


        		$(".checkAgree").click(function(){
        			if($("input:checkbox[name='terms']").is(':checked') == true
        			){
        				$("input:checkbox[id='agree_check']").prop("checked", true);
        				$(".repop_close").click();
        			}else{
        				alert("개인정보 처리 약관에 동의해 주세요 ");
        				return false;
        			}
        		});

        		 $(".repop_close").click(function () {
        			 $(".overlay ").removeClass("on");
    				    $(".terms_wrap ").removeClass("on");
        		 });


        			if(getCookie("idSaveCheck") == "true"){
        				$("#idSaveCheck").prop("checked",true);
        				$("#loginId").val(getCookie("loginId"));
        				$("#userPasswordTmp").val(getCookie("userPasswordTmp"));
        			}

        			if(getCookie("auto_login") == "true"){
        				$("#auto_login").prop("checked",true);
        			}




        				$("#userPasswordTmp").keydown(function(key) {
        					if (key.keyCode == 13) {
        						loginDo();
        					}
        				});

        			$.validator.addMethod("pw_regexp", function(value, element) {
        				// return this.optional(element) ||  /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(value);
        				return this.optional(element) ||  /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+]).*$/.test(value);

        			});

        				$.validator.addMethod("telnum", function(telnum, element) {
        				var pattern = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/;
        				if (!pattern.test(telnum)) {
        					return this.optional(element) || false;
        				}
        				return true;
        			});


        			jQuery.validator.addMethod("notEqual", function(value, element, param) {
        				if(value == $(param).val()){
        					return this.optional(element) || false;
        				}
        				return true;
        			});

        			$("#saveFm").validate({
        				rules : {
        					lastNm : {
        						required : true
        					},
        					firstNm : {
        						required : true
        					},
        					email : {
        						required : true
        					},
        					phone : {
        						required : false,
        						telnum : true
        					},
        					password : {
        						pw_regexp : true // 정규식
        						,required  : true // 정규식
        						,minlength : 8 // 최소입력글수  4자
        						,maxlength : 20
        					},
        					cpassword : {
        						pw_regexp : true // 정규식
        						,required  : true // 정규식
        						,minlength : 8 // 최소입력글수  4자
        						,maxlength : 20
        						,equalTo : '#password'
        					},
        					cmpyNm : {
        						required : true
        					},


        				},
        				messages : {
        					lastNm : {
        						required : "<code:msg code='validate.msg.common'/>"
        					},
        					firstNm : {
        						required : "<code:msg code='validate.msg.common'/>"
        					},
        					email : {
        						required : "<code:msg code='validate.msg.common'/>"
        					},
        					password : {
        						required 	: "패스워드를 입력해 주세요"
        						,pw_regexp 	: "영문 대소문자, 숫자, 특수문자를 반드시 입력해 주시기 바랍니다."
        						,minlength 	: "{0}자 이상 입력해 주시기 바랍니다."
        						,maxlength 	: "{0}자 이하로 입력해 주시기 바랍니다."

        					},
        					cpassword : {
        						required 	: "패스워드를 입력해 주세요"
        						,pw_regexp 	: "영문 대소문자, 숫자, 특수문자를 반드시 입력해 주시기 바랍니다."
        						,minlength 	: "{0}자 이상 입력해 주시기 바랍니다."
        						,maxlength 	: "{0}자 이하로 입력해 주시기 바랍니다."
        						,equalTo : "패스워드가 일치하지 않습니다."
        					},
        					phone : {
        						required  : "<code:msg code='valid.pwd.nine'/>"
        					},
        					cmpyNm : {
        						required : "<code:msg code='validate.msg.common'/>"
        					},
        				},
        				errorPlacement : function(error, element) {
        					if (element.is(":radio") || element.is(":checkbox")) {
        					} else if (element.is('select')) {
        						element.attr("placeholder", error[0].outerText);
        						element.css("border", "red solid 1px");
        						element.css("width", "500px");
        					} else {
        						element.attr("placeholder", error[0].outerText);
        					}
        				},
        				submitHandler : function() {
        					$(".modal_bg_sub").show();
        					joinDo();
        				}
        			});

        			$(".saveBtn").click(function() {
        				alert("TEst");
        				if($("input:checkbox[id='agree_check']").is(':checked') == true){
        					$("#saveFm").submit();
        				}
        			});

        	});

        	function loginDo() {
        		if ($.trim($('#loginId').val()) == '') {
        			alert("<code:msg code='valid.id'/>"); // '아이디를 입력해주세요!'
        			$('#loginId').focus();
        			return;
        		}
        		if ($.trim($('#userPasswordTmp').val()) == '') {
        			alert("<code:msg code='valid.pw'/>"); // '패스워드를 입력해주세요!'
        			$('#userPasswordTmp').focus();
        			return;
        		}

        		loginSubmit("<c:url value='/web/lgn/loginDo.ax'/>");
        	}


        	function loginSubmit(urls){
        				if($("#idSaveCheck").is(":checked") == true){
        						setCookie("idSaveCheck", "true", 31);
        					setCookie("loginId", $("#loginId").val(), 31);
        						setCookie("userPasswordTmp",$("#userPasswordTmp").val() , 31);
        				}else{
        					deleteCookie("idSaveCheck");
        					deleteCookie("loginId");
        					deleteCookie("userPasswordTmp");
        				}

        				if($("#auto_login").is(":checked") == true){
        						setCookie("auto_login", "true", 31);
        				}else{
        						deleteCookie("auto_login");
        				}



        		var encrypt = CryptoJS.AES.encrypt($("#userPasswordTmp").val(),symtcKey);
        		$("#userPassword").val(encrypt)

        		$.ajax({
        			type : "POST",
        			url : urls,
        			data : $("#loginFm").serialize(),
        			success : function(data) {

        				if(data.code == "0000"){
        					location.reload();
        					$(".modal_bg_sub").hide();
        				}else{
        					$(".modal_bg_sub").hide();
        					if(data.msg){
        						alert(data.msg);
        					}
        					else{
        						alert("<code:msg code='success.common.error'/>");
        						//var url = "<c:url value='/web/lgn/logOut.lp'/>";
        						//location.href=url;
        					}
        					$("#userPassword").val("");
        				}
        			},
        			error : function(e) {
        				console.log(JSON.stringify(e));
        			}
        		});
        	}


        	function joinDo() {
        		if($(".userType:eq(0)").hasClass("active")){
        			$("#userType").val("001");
        		}else{
        			$("#userType").val("002");
        		}
        		var url = "<c:url value='/web/lgn/joinSubmitDo.ax'/>";
        		var sendData = $("#saveFm").serialize();
        		fn_submitRtnAjax(url, sendData, '')

        	}

        	function rtnFunction(typ,data){
        		alert(data.msg);
        		if(data.code == "0001"){
        			location.href='';
        		}
        	}

        </script>

</body>

</html>




