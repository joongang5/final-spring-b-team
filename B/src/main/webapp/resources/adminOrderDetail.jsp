<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지 | 가구</title>
    <link rel="stylesheet" href="./resources/css/base.css">
    <link rel="stylesheet" href="./resources/css/admin.css">
    <link rel="stylesheet" href="./resources/css/invoice.css">
    <style>
        /*invoice.css와 공통되는 부분*/
        .order-content{
            margin: 0;
        }

        .order-content__header{
        border-bottom: none;
        background: #eeded5;
        }

        .order-product-right-block{
            width: 70%;
        }

        .order-content__delivery-container{
            width: 30%;
        }

        .order-delivery__released{
            text-align: left;
            border: 1px solid #eeded5;
            padding: 15px;
            margin-top: 10px;
            /* display: none; */
        }

        label p{
            margin: 0;
        }

        .order-delivery__tracking input{
            width: 85%;
            display: block;
        }

        .order-delivery__released button{
            width: 100%;
            border-radius: 8px;
            margin-top: 5px;
            height: 30px;
        }

        .personalInfo-content__body{
            height: 100%;
        }

        .personalInfo-address{
            width: 93%;
            margin-bottom: 5px;
        }


        .post-code {
        width: 30%;
        }


        .personalInfo-memo{
            width: 93%;
            margin-bottom: 5px;
        }

        .orderState-save-container{
            text-align: center;
            margin: 20px;
        }

        .orderState-save-container button{
            height: 50px;
            width: 180px;
            border-radius: 15px;
            font-size: 15pt;
        }

    </style>
</head>
<body>
<!--admin 공통 부분-->
<div id="layout-container">
    <header id="admin-header"></header>
    <div id="admin-main-container">
        <nav id="admin-sideMenu">
            <div class="sideMenu__block-container">
                <ul class="sideMenu__items">
                    <li class="sideMenu__item">
                        <div class="sideMenu-container">
                            <div><img src="./resources/images/setting.png"></div>
                            <div><a href="">홈으로</a></div>
                        </div>
                    </li>
                    <li class="sideMenu__item sideMenu__item--active">
                        <div class="sideMenu-container">
                            <div><img src="./resources/images/delivery.png"></div>
                            <div><a href="">주문 관리</a></div>
                        </div>
                        <div class="sideMenu-sub-container">
                            <ul class="sideMenu__subItems sideMenu__subItems--active">
                                <li class="sideMenu__subItem sideMenu__subItem--active"><a href="">주문 목록</a></li>
                                <li class="sideMenu__subItem"><a href="">교환 관리</a></li>
                                <li class="sideMenu__subItem"><a href="">환불 관리</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="sideMenu__item">
                        <div class="sideMenu-container">
                            <div><img src="./resources/images/furniture.png"></div>
                            <div><a href="">상품 관리</a></div>
                        </div>
                        <div class="sideMenu-sub-container">
                            <ul class="sideMenu__subItems">
                                <li class="sideMenu__subItem"><a href="">상품 목록</a></li>
                                <li class="sideMenu__subItem"><a href="">상품 등록</a></li>
                                <li class="sideMenu__subItem"><a href="">쿠폰 등록</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="sideMenu__item">
                        <div class="sideMenu-container">
                            <div><img src="./resources/images/user.png"></div>
                            <div><a href="">고객 관리</a></div>
                        </div>
                        <div class="sideMenu-sub-container">
                            <ul class="sideMenu__subItems">
                                <li class="sideMenu__subItem"><a href="">회원 목록</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="sideMenu__item">
                        <div class="sideMenu-container">
                            <div><img src="./resources/images/support.png"></div>
                            <div><a href="">고객 응대</a></div>
                        </div>
                        <div class="sideMenu-sub-container">
                            <ul class="sideMenu__subItems">
                                <li class="sideMenu__subItem"><a href="">상품 문의 목록</a></li>
                                <li class="sideMenu__subItem"><a href="">1:1 문의 목록</a></li>
                                <li class="sideMenu__subItem"><a href="">자주 묻는 질문 관리</a></li>
                                <li class="sideMenu__subItem"><a href="">리뷰 목록</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="sideMenu__item">
                        <div class="sideMenu-container">
                            <div><img src="./resources/images/browser.png"></div>
                            <div><a href="">사이트 관리</a></div>
                        </div>
                        <div class="sideMenu-sub-container">
                            <ul class="sideMenu__subItems">
                                <li class="sideMenu__subItem"><a href="">로그 조회</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <main>
<!--admin 공통 부분 끝-->
            <div class="admin-title">
                <!--(주문 번호)에 주문 번호 출력-->
                <h1>주문 상세 (20211006-1233456)</h1>
            </div>
            <!--주문서 출력-->
            <div class="order-content">
                <div class="order-content__header">
                    <div class="order-content__orderer">주문자 : 홍길동</div>
                    <div class="order-content__orderDate">2021.10.06 15:36</div>
                </div>
                <!--주문서 내 주문한 상품 내용 출력 / 반복문 사용-->
                <div class="order-content__body">
                    <div class="order-content-productContainer">
                        <div class="order-product-left-block">
                            <div class="product-content__productThumbnail">
                                <img src="./resources/images/no-image.png">
                            </div>
                        </div>
                        <div class="order-product-right-block">
                            <div class="product-content__name">상품명</div>
                            <div class="product-content__option-container">
                                <div class="option-content__name">옵션</div>
                                <div class="option-content__price-container">
                                    <div class="option-content__price">50,000원</div>
                                    <div class="option-content__quantity">1개</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--주문한 상품 내용 출력 끝-->
                    <div class="order-content__delivery-container">
                        <div class="order-content__delivery">
                            <select class="search-select">
                                <option>결제 완료</option>
                                <option>출고 준비</option>
                                <option>출고 완료</option>
                            </select>
                        </div>
                        <!--출고 완료일 경우 출력되는 div-->
                        <!--'출고 완료' 선택하면 표시됨-->
                        <div class="order-delivery__released">
                            <div class="order-delivery__courier">
                                택배사: CJ대한통운
                            </div>
                            <div class="order-delivery__tracking">
                                <label>
                                    <p>운송장 번호:</p>
                                    <input type="text">
                                </label>
                            </div>
                            <button>등록</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="personalInfo-container">
                <div class="delivery personalInfo-content-container">
                    <div class="delivery personalInfo-content__header">
                        배송 정보
                    </div>
                    <div class="delivery personalInfo-content__body">
                        <!--입력폼 기본값에 기존값 지정해야함-->
                        <div class="delivery personalInfo-content__short-container">
                            <div class="delivery personalInfo-content__section">
                                받는 사람
                            </div>
                            <div class="delivery personalInfo-content__value">
                                <input type="text" class="personalInfo-name">
                            </div>
                        </div>
                        <div class="delivery personalInfo-content__short-container">
                            <div class="delivery personalInfo-content__section">
                                연락처
                            </div>
                            <div class="delivery personalInfo-content__value">
                                <input type="tel" class="personalInfo-tel">
                            </div>
                        </div>
                        <div class="delivery personalInfo-content__long-container">
                            <div class="delivery personalInfo-content__section">
                                주소
                            </div>
                            <div class="delivery personalInfo-content__value">
                                <!--주소 찾기 API 추가??-->
                                <input type="text" class="post-code personalInfo-address">
                                <input type="text" class="personalInfo-address">
                                <input type="text" class="personalInfo-address">
                            </div>
                        </div>
                        <div class="delivery personalInfo-content__long-container">
                            <div class="delivery personalInfo-content__section">
                                배송 메모
                            </div>
                            <div class="delivery personalInfo-content__value">
                                <input type="text" class="personalInfo-memo">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="payment personalInfo-content-container">
                    <div class="payment personalInfo-content__header">
                        결제 정보
                    </div>
                    <div class="payment personalInfo-content__body">
                        <div class="payment personalInfo-content__short-container">
                            <div class="payment personalInfo-content__section">
                                합계 금액
                            </div>
                            <div class="payment personalInfo-content__value">
                                50,000원
                            </div>
                        </div>
                        <div class="payment personalInfo-content__short-container">
                            <div class="payment personalInfo-content__section">
                                배송료
                            </div>
                            <div class="payment personalInfo-content__value">
                                0원
                            </div>
                        </div>
                        <div class="payment personalInfo-content__short-container">
                            <div class="payment personalInfo-content__section">
                                쿠폰 할인
                            </div>
                            <div class="payment personalInfo-content__value">
                                0원
                            </div>
                        </div>
                        <div class="payment personalInfo-content__short-container">
                            <div class="payment personalInfo-content__section">
                                적립금 사용
                            </div>
                            <div class="payment personalInfo-content__value">
                                0원
                            </div>
                        </div>
                        <div class="payment personalInfo-content__short-container">
                            <div class="payment personalInfo-content__section">
                                결제 금액
                            </div>
                            <div class="payment personalInfo-content__value">
                                50,000원
                            </div>
                        </div>
                        <div class="payment personalInfo-content__short-container">
                            <div class="payment personalInfo-content__section">
                                결제 방법
                            </div>
                            <div class="payment personalInfo-content__value">
                                카카오페이
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="orderState-save-container">
                <!--
                이 버튼은 배송 정보+주문 상태를 저장한다.
                운송장 번호를 저장하는 기능은 .order-delivery__released에 내장되어 있다.
                단 운송장 번호 유효검사 함수는 여기서도 실행된다.
                -->
                <button>저장하기</button>
            </div>
        </main>
    </div>
    <footer id="admin-footer"></footer>
</div>
</body>
</html>