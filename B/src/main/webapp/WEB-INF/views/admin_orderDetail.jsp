<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지 | 가구</title>
    <link rel="stylesheet" href="./resources/css/base.css">
    <link rel="stylesheet" href="./resources/css/admin.css">
    <link rel="stylesheet" href="./resources/css/invoice2.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        /*invoice.css와 공통되는 부분*/
        .order-content{
            margin: 0;
        }

        .order-content__header{border-bottom: none;background: #eeded5;}

		.order-content_body{

        }
        
        .order-content__container{
			display: flex;
        }

        .order-product-right-block{
            width: 70%;
        }

        .order-content__delivery-container{
            width: 30%;
        }

        .order-content__delivery{

        }

        /**/

        .order-content__delivery select{

        }

        .order-delivery__released{
            text-align: left;
            border: 1px solid #eeded5;
            padding: 15px;
            margin-top: 10px;
            /* display: none; */
        }

        .order-delivery__courier{

        }

        .order-delivery__tracking{

        }

        .order-delivery__tracking label{

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
        
        .order-content__container+.order-content__container{
        	margin-top: 20px;
   			padding-top: 20px;
    		border-top: 1px solid #e5e5e5;
        }

        .personalInfo-container{
            margin-top: 30px;
        }

        .personalInfo-content-container{

        }

        .personalInfo-content__header{

        }

        .personalInfo-content__body{
            height: 100%;
        }

        .personalInfo-content__section{

        }

        .personalInfo-content__value{

        }


        .delivery{

        }

        .personalInfo-name, .personalInfo-tel{
			width: 90%;
        }

        .personalInfo-name{

        }

        .personalInfo-tel{
        }

        .personalInfo-address, .personalInfo-memo{
            width: 95%;
            margin-bottom: 5px;
        }


        .post-code {width: 30%;}

        .payment{
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
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
function registerWaybill(){
	 var wayBillNum = $("#waybill").val()
	 var pa_id = $("#pa_id").val()
	 
	 
	   $.ajax({
			url : "registerWaybill.do",
			type : "post",
			data : {"way" : wayBillNum , "pa_id" : pa_id},
			success : function(data) {
				
				if(data >= 1){
					
					$('input[name=waybill]').attr('type',"hidden")
					$('input[name=result]').attr('type',"text")
					$('input[name=result]').attr('value',"운송장 번호 등록 완료")
					
				}else{
					alert("운송장 번호 등록 불가")
				}
				//	alert(data)
					 //$('input[name=waybill]').attr('value',"운송장 번호 등록 완료")
				//}else{
				//	alert("운송장 번호 등록 불가")
				
			},
		})
}		

</script>
</head>
<body>
<!--admin 공통 부분-->
<header id="admin-header">
<c:import url="/adminHeader.do"/>
</header>
<div id="layout-container">
		<div id="admin-main-container">
			<nav id="admin-sideMenu">
				<div class="sideMenu__block-container">
					<ul class="sideMenu__items">
						<li class="sideMenu__item">
							<div class="sideMenu-container">
								<div>
									<img src="./resources/images/setting.png">
								</div>
								<div>
									<a href="./index.do">홈으로</a>
								</div>
							</div>
						</li>
						<li class="sideMenu__item sideMenu__item--active">
							<div class="sideMenu-container">
								<div>
									<img src="./resources/images/delivery.png">
								</div>
								<div>
									<a href="./admin_orderList.do">주문 관리</a>
								</div>
							</div>
							<div class="sideMenu-sub-container">
								<ul class="sideMenu__subItems sideMenu__subItems--active">
									<li class="sideMenu__subItem sideMenu__subItem--active"><a
										href="./admin_orderList.do">주문 목록</a></li>
									<li class="sideMenu__subItem"><a href="">교환 관리</a></li>
									<li class="sideMenu__subItem"><a href="">환불 관리</a></li>
								</ul>
							</div>
						</li>
						<li class="sideMenu__item">
							<div class="sideMenu-container">
								<div>
									<img src="./resources/images/furniture.png">
								</div>
								<div>
									<a href="./product.do">상품 관리</a>
								</div>
							</div>
							<div class="sideMenu-sub-container">
								<ul class="sideMenu__subItems">
									<li class="sideMenu__subItem"><a href="./product.do">상품
											목록</a></li>
									<li class="sideMenu__subItem"><a
										href="./registerProduct.do">상품 등록</a></li>
									<li class="sideMenu__subItem"><a href="">쿠폰 등록</a></li>
								</ul>
							</div>
						</li>
						<li class="sideMenu__item">
							<div class="sideMenu-container">
								<div>
									<img src="./resources/images/user.png">
								</div>
								<div>
									<a href="./adminMember.do">고객 관리</a>
								</div>
							</div>
							<div class="sideMenu-sub-container">
								<ul class="sideMenu__subItems">
									<li class="sideMenu__subItem"><a href="./adminMember.do">회원
											목록</a></li>
								</ul>
							</div>
						</li>
						<li class="sideMenu__item">
							<div class="sideMenu-container">
								<div>
									<img src="./resources/images/support.png">
								</div>
								<div>
									<a href="">고객 응대</a>
								</div>
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
								<div>
									<img src="./resources/images/browser.png">
								</div>
								<div>
									<a href="./adminLog">사이트 관리</a>
								</div>
							</div>
							<div class="sideMenu-sub-container">
								<ul class="sideMenu__subItems">
									<li class="sideMenu__subItem"><a href="./adminLog">로그
											조회</a></li>
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
					<h1>주문 상세 (${orderDetail.pa_id })</h1>
					<div>
					
					
				
				
				
				<!--주문서 출력-->
				<div class="order-content">
					<div class="order-content__header">
						<div class="order-content__orderer">주문자 :
							${orderDetail.m_name }(${orderDetail.m_id})</div>
						<div class="order-content__orderDate">${orderDetail.o_date}</div>
					</div>

					<br>
					<!--주문서 내 주문한 상품 내용 출력 / 반복문 사용-->
					<div class="so" style="width:60%;">
					<div class="sosad1">
					<c:forEach items="${orderDetailList }" var="odl">
							<div class="order-content-productContainer">
								<div class="order-product-left-block">
									<div class="product-content__productThumbnail">
										<c:if test="${odl.p_img eq null or odl.p_no ge 58}">
											<img src="./resources/images/no-image.png">
										</c:if>
										<c:if test="${odl.p_no lt 58 }">
											<img
												src="https://blogger.googleusercontent.com/img/a/${odl.p_img}">
										</c:if>
									</div>
								</div>
								<div class="order-product-right-block">
									<div class="product-content__name">${odl.p_title }</div>
									<div class="product-content__option-container">

										<div class="option-content__price-container">
											<div class="option-content__price">
												<fmt:formatNumber type="number" maxFractionDigits="3"
													value="${odl.p_price}" />
												원
											</div>
											<div class="option-content__quantity">${odl.cnt}개</div>
										</div>
									</div>
								</div>
							</div>
							<!--주문한 상품 내용 출력 끝-->
							<br>
							
							
					</c:forEach>
					</div>
					
					<div class="soSad2" style="position:absolute;left:67%;top:30%;;width:20%;height:30%;" >	
					
					<p style="text-align:center"><c:if test="${orderDetail.o_state eq 0 }"> 결제완료 </c:if>
					<c:if test="${orderDetail.o_state eq 1 }"> 출고준비 </c:if>
					<c:if test="${orderDetail.o_state eq 2 }"> 출고완료 </c:if></p>
				    
				    <c:if test="${orderDetail.o_state eq 2 and orderDetail.o_waybill eq '0' }">
		                    <p style="text-align:center">택배사: CJ대한통운 </p>
		                     <p style="text-align:center">운송장 번호:</p>       
		                           
		       
						
					     <input type="text" value="" name="waybill" id="waybill" required>
						<input type="hidden" value="" name="result" id="result">
						<input type="hidden" name="pa_id" id="pa_id" value="${orderDetail.pa_id}">
					    

					<button type="submit" name="wayButton" onclick="registerWaybill()">등록</button>

				</c:if>				
				<p style="text-align:center"> <c:if test="${orderDetail.o_waybill ne '0'}">${orderDetail.o_waybill}</c:if></p>
				</div>
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
                                <input type="text" class="personalInfo-name" value="${orderDetail.m_name }">
                            </div>
                        </div>
                        <div class="delivery personalInfo-content__short-container">
                            <div class="delivery personalInfo-content__section">
                                연락처  
                            </div>
                            <div class="delivery personalInfo-content__value">
                                <input type="tel" class="personalInfo-tel" value="${orderDetail.m_phone }">
                            </div>
                        </div>
                        <div class="delivery personalInfo-content__long-container">
                            <div class="delivery personalInfo-content__section">
                                
                                주소
                            </div>
                            <div class="delivery personalInfo-content__value">
                                <!--주소 찾기 API 사용-->
								<!--우편번호, 주소1, 주소2-->
									<div class="address payment-delivery__form">
										<input type="text" class="personalInfo-address" value="${m_addr2 }">
									</div>

								</div>
                        </div>
                        <div class="delivery personalInfo-content__long-container">
                            <div class="delivery personalInfo-content__section">
                                배송 메모
                            </div>
                            <div class="delivery personalInfo-content__value">
                                <input type="text" class="personalInfo-memo" value="${orderDetail.o_memo}">
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
                               <fmt:formatNumber type="number" maxFractionDigits="1" value="${orderDetail.pa_amount}" /> 원
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
                          
                               <fmt:formatNumber type="number" maxFractionDigits="1" value="${orderDetail.pa_usePoint}" />원
                            </div>
                        </div>
                        <div class="payment personalInfo-content__short-container">
                            <div class="payment personalInfo-content__section">
                                결제 금액
                            </div>
                            <div class="payment personalInfo-content__value">
                                <fmt:formatNumber type="number" maxFractionDigits="1" value="${orderDetail.pa_amount - orderDetail.pa_usePoint}" />원
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
          </main>
    </div>
    <footer id="admin-footer"></footer>
</div>
</body>
</html>