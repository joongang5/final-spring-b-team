<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title></title>
  <meta charset="UTF-8">
  <link href="./resources/css/header.css" rel="stylesheet"/>
<link href="./resources/css/footer.css" rel="stylesheet"/>
  <link rel="stylesheet" href="./resources/css/base.css">
  
  <style>
header *, footer * {padding: 0;margin: 0;list-style: none;}
header a, footer a{color:black;text-decoration:none;transition:0.3s all;}
header a:link, header a:visited, footer a:link, footer a:visited {color:black;}
header a:hover, header a:focus, footer a:hover, footer a:focus{text-decoration:underline;}
header a:after, footer a:after{height:0;}
    main{
      width: 100%;
    }

    .payment-title{
    margin-bottom: 50px;
    }

    .payment-result-container{
      width: 60%;
      margin: auto;
    }

    .payment-result{
    text-align: center;
    margin-bottom: 30px;
    }

    .payment-result-detail-container{
      border: 7px solid #eeded5;
      padding: 35px 50px;
    }

    .result-detail-short-container{
      display: flex;
      justify-content: space-between;
      font-size: 13pt;
      margin-bottom: 25px;
    }

    .result-detail-section{
      font-weight: 600;
      width: 80px;
    }

    .result-detail-value{
      text-align: right;
    }

    .result-detail-value p{
      font-size: 12pt;
    }

    .payment-result-amount{
      border-top: 1px solid #e5e5e5;
      padding-top: 25px;
      display: flex;
      font-size: x-large;
      font-weight: 700;
      justify-content: space-between;
    }

    .payment-afterAction{
      margin-top: 30px;
      text-align: center;
      display: flex;
      justify-content: space-evenly;
    }

    .payment-afterAction button{
      width: 245px;
      height: 60px;
      font-size: 14pt;
      border-radius: 15px;
    }

    .amount__value{
      font-family: math;
      margin-right: 5px;
      color: #ff8a00;
      font-size: larger;
    }
  </style>
</head>
<body>
<div id="header-space">
	<c:import url="/header.do"/>
</div>
<div id="layout-container">
  <div id="payment-main-container">
    <main>
      <div class="payment-title">
      	<input type="hidden" id="title" value="주문 <c:out value="${result == 'success'? '완료':'오류'}"/> | 가구">
        <h1>주문 <c:out value="${result == 'success'? '완료':'오류'}"/></h1>
      </div>
      <div class="payment-result-container">
        <div class="payment-result">
          <h2>${result == 'success'? '구매가 정상적으로 완료되었습니다.':'주문 처리에 문제가 발생했습니다.'}</h2>
          <c:if test="${errorMsg ne null}">
          <h3>${errorMsg}</h3>
          </c:if>
        </div>
        <div class="payment-result-detail-container">
          <div class="payment-result-detail">
              <div class="result-detail-short-container">
                <div class="result-detail-section">
                  주문 번호
                </div>
                <div class="result-detail-value">
                  ${paymentInfo.pa_id}
                </div>
              </div>
              <div class="result-detail-short-container">
                <div class="result-detail-section">
                  배송지
                </div>
                <div class="result-detail-value">
                  (${paymentInfo.buyer_postcode}) ${paymentInfo.buyer_addr}
               </div>
              </div>
              <div class="result-detail-short-container">
                <div class="result-detail-section">
                  결제 정보
                </div>
                <div class="result-detail-value">
                  ${paymentInfo.pa_plan}
                  <p>결제 일시: ${paymentInfo.pa_date}</p>
                </div>
              </div>
          </div>
          <div class="payment-result-amount">
            <div class="result-amount-section">
              총 결제 금액
            </div>
            <div class="result-amount-value">
              <span class="amount__value"><fmt:formatNumber value="${paymentInfo.pa_amount}" pattern="#,###"/></span>원
            </div>
          </div>
        </div>
        <div class="payment-afterAction">
          <button type="button" onclick="location.href='./orderhistory.do'">구매 내역 확인하기</button>
          <button type="button" onclick="location.href='./index.do'">쇼핑 계속 하기</button>
        </div>
      </div>
    </main>
  </div>
</div>
 <div id="footer-space">
  <c:import url="./footer.jsp"/>
 </div>
</body>
</html>