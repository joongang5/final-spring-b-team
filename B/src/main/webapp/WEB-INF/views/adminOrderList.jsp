<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>관리자 페이지 | Spring.B</title>
  <link rel="stylesheet" href="./resources/css/base.css">
  <link rel="stylesheet" href="./resources/css/admin.css">
  <style>
    #change-orderState {
      background-color: #eeded5;
      width: 115px;
      padding: 7px 14px;
      border-radius: 8px;
      background-position-x: 94%;
      background-position-y: center;
      margin-right: 10px;
    }

      .orderList-container{
        margin-top: 25px;
      }

    .orderList{
    margin: auto;
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
        <h1>주문 목록</h1>
      </div>
      <div class="period-search-box">
        <label>
          <p>주문일 검색</p>
          <input type="date"> ~
          <input type="date">
        </label>
        <button class="search-button">조회</button>
      </div>
      <div class="keyword-search-box">
        <label for="keyword-search__word">
          <p>키워드 검색</p>
        </label>
        <div class="keyword-search__bar">
          <select id="keyword-search__column">
            <option>주문 번호</option>
            <option>주문자</option>
            <option>상품 번호</option>
            <option>상품명</option>
          </select>
          <input type="search" id="keyword-search__word">
        </div>
          <button class="search-button">검색</button>
      </div>
      <div class="change-orderState-box">
        <label>
          <p>선택한 주문</p>
          <select id="change-orderState" class="search-select">
            <option>결제 완료</option>
            <option>출고 준비</option>
          </select>
        </label>
        <button class="search-button">일괄 변경</button>
      </div>
      <div class="orderList-container">
        <table class="list-table orderList">
          <thead>
            <tr>
              <th scope="col">선택</th>
              <th scope="col">주문 번호</th>
              <th scope="col">주문자</th>
              <th scope="col">주문일</th>
              <th scope="col">주문 내역</th>
              <th scope="col">합계</th>
              <th scope="col">결제 금액</th>
              <th scope="col">
                <select id="sort__by-orderState">
                  <option>처리 상태</option>
                  <option>결제 완료</option>
                  <option>출고 준비</option>
                  <option>출고 완료</option>
                </select>
              </th>
            </tr>
          </thead>
          <tbody>
          <!--주문 목록 출력 / 반복문 사용-->
            <tr>
              <td>
                <label>
                  <input type="checkbox">
                  <span class="checkMark"></span>
                </label>
              </td>
              <td>주문 번호</td>
              <td>주문자</td>
              <td>주문일</td>
              <!--여기서 주문 내역은 간결하게 출력한다. ex) 상품 ooo 외 *개-->
              <td>주문 내역</td>
              <td>합계</td>
              <td>결제 금액</td>
              <td>처리 상태</td>
            </tr>
          <!--주문 목록 출력 끝-->
          </tbody>
        </table>
        <div class="paging orderList__paging">
          <!--페이징 출력-->
          <a class="page-value">1</a>
          <a class="page-value">2</a>
          <a class="page-value">3</a>
          <a class="page-value">4</a>
          <a class="page-value">5</a>
        </div>
      </div>
    </main>
  </div>
  <footer id="admin-footer"></footer>
</div>
</body>
</html>