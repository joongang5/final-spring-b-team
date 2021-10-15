<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(function(){
	//법률 정보
	$("#view, #full").hide();
	$("#law span").click(function(){
		$("#view, #full").show();
		$("."+$(this).attr("id")).css({"display":"block"});
		return false;
	});
	$("#view, #full").click(function(){
		$("#view, #full").hide();
		$("#view div").css({"display":"none"});
	});
});
</script>
<footer>
	<div id="footer">
		<div id="sns">
			<p><img alt="인스타그램" src="./resources/images/instargram.png" title="인스타그램"></p>
			<p><img alt="페이스북" src="./resources/images/facebook.png" title="페이스북"></p>
			<p><img alt="네이버블로그" src="./resources/images/naver.png" title="네이버블로그"></p>
		</div>
		<div id="law"><span id="userLaw"><strong>개인정보처리방침</strong></span><span id="useLaw">이용약관</span></div>
		<div id="copyright">&copy; 2021 Spring.B</div>
	</div>
	<div id="view">
		<div class="userLaw">
			<h4>Spring.B 서비스 개인정보 처리방침</h4>
			<p>
				Spring.B(이하 "회사"라 합니다)는 회사가 제공하는 Spring.B 서비스(이하 "서비스"라 합니다) 회원의 개인정보보호를 매우 중요시하며, 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』등 개인정보와 관련된 법령 상의 개인정보보호규정을 준수하고 있습니다. 
				회사는 아래와 같이 개인정보처리방침을 명시하여 회원이 회사에 제공한 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치를 취하는지 알려드립니다. 
				회사의 서비스 개인정보처리방침은 정부의 법률 및 지침의 변경과 당사의 약관 및 내부 정책에 따라 변경될 수 있으며 이를 개정하는 경우 회사는 변경사항에 대하여 즉시 서비스 화면에 게시합니다. 회원님께서는 사이트 방문 시 수시로 확인하시기 바랍니다. 
			</p>
			<p>
				1. 오늘의집은 이용하는 서비스의 형태에 따라 다음과 같은 개인정보를 수집 및 이용∙제공∙파기하고 있습니다.<br>
				① 개인정보의 수집 ∙ 이용 목적 및 항목 
				회사가 제공하는 서비스는 별도의 회원가입 절차 없이 자유롭게 컨텐츠에 접근할 수 있습니다. 회사의 회원제 서비스 이용을 위해 수집 ∙ 이용하는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 목적 변경 시 별도의 동의를 받는 등 필요한 조치를 이행합니다. 
			</p>
			<p>
				2. 서비스의 제공 또는 법령에 정해진 책임의 준수를 위하여 회사가 보관하고 있는 개인정보가 제3자에게 수집 목적 범위 내에서 제공될 수 있습니다.<br/>
				① 회사는 이용자의 개인정보를 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정에 해당하는 경우에만 개인정보를 제 3 자에게 제공합니다
				② 회사는 다음과 같이 개인정보를 제 3 자에게 제공하고 있습니다. 
			</p>
			<p>
				3. 이용자의 의무<br>
				① 이용자는 본인의 개인정보를 안전하게 지키기 위해 개인정보보호에 관한 법률을 준수할 의무가 있습니다. 
				② 이용자는 자신의 개인정보를 안전하게 보호할 의무가 있으며, 회사는 이용자 개인의 부주의로 인해 발생된 일에 대해서는 책임을 지지 않습니다. 따라서 이용자는 자신의 개인정보보호를 위하여 ID 및 비밀번호를 철저히 관리하고 주기적으로 변경하는 등의 최선의 노력을 다할 의무가 있습니다. 
				③ 이용자는 본인의 개인정보를 최신의 상태로 정확하게 입력하고 유지할 의무가 있습니다. 이용자의 부정확한 정보 입력으로 인하여 발생하는 문제의 책임은 이용자 본인에게 있습니다. 
				④ 이용자는 타인의 개인정보를 도용하여 회원가입 또는 서비스 이용 시 회원자격 상실과 함께 개인정보에 관한 법률에 의거하여 처벌될 수 있습니다. 
				⑤ 이용자는 타인의 개인정보를 침해하거나 유출하지 않을 의무도 가지고 있습니다. 서비스 이용 중 다른 이용자에 대해 알게 된 개인정보를 언급하거나, 유출할 경우 개인정보 관련 법령에 의거하여 처벌될 수 있습니다. 
			</p>
			<p>
				 개인정보가 침해 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다. 
					▶ 개인정보 침해신고센터 (한국인터넷진흥원 운영) : (국번없이) 118 / privacy.kisa.or.kr 
					▶ 대검찰청 사이버범죄수사단 : (국번없이) 1301 / www.spo.go.kr 
					▶ 경찰청 사이버안전국 : (국번없이) 182 / www.cyber.go.kr 
					▶ 전자거래분쟁조정위원회 (https://www.ecmc.or.kr / 1661-5714)
			</p>
		</div>
		<div class="useLaw">
			<h4>Spring.B 서비스 이용 약관</h4>
			<p>
				제 1조 (목적) Spring.B 서비스 이용약관(이하 “약관”이라 합니다)은 주식회사 Spring.B(이하 “회사”라 합니다)가 제공하는 서비스와 관련하여 회사와 이용 고객(또는 회원) 간에 서비스의 이용 조건 및 절차, 회사와 회원 간의 권리, 의무 및 책임 사항 기타 필요한 사항을 규정함을 목적으로 합니다.
			</p>
			<p>
				제 2조 (용어) 본 약관에서 사용하는 용어의 정의는 다음 각 호와 같으며, 정의되지 않은 용어에 대한 해석은 관계법령 및 서비스별 안내에서 정하는 바에 따릅니다.
				1. 서비스: 이용 고객 또는 회원이 PC, 휴대형 단말기, 태블릿PC 등 각종 유무선 기기 또는 프로그램을 통하여 이용할 수 있도록 회사가 제공하는 서비스를 말합니다.
			</p>
			<p>
				제3조 (약관의 효력 및 변경)<br>
				① 본 약관은 회원이 쉽게 알 수 있도록 서비스 내 또는 연결화면을 통하여 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력이 발생합니다.<br>
				② 회사는 약관의 규제에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관계법령에 위배되지 않는 범위 내에서 본 약관을 개정할 수 있습니다.<br>
				③ 회사는 약관을 개정할 경우 그 개정이유 및 적용일자를 명시하여 현행 약관과 함께 적용일자 7일전부터 적용일 전일까지 제1항의 방법으로 공지합니다. 다만, 회원의 권리 또는 의무에 관한 중요한 규정의 변경은 최소한 30일전에 공지하고 개정약관을 회원이 등록한 E-mail로 발송하여 통지합니다.<br>
				④ 회사가 제3항에 따라 개정약관을 공지 또는 통지하였음에도 불구하고 회원이 명시적으로 거부의사를 표시하지 아니하는 경우 회원이 개정약관에 동의한 것으로 봅니다.<br>
				⑤ 회원은 변경된 약관에 동의하지 아니하는 경우 서비스의 이용을 중단하고 이용계약을 해지할 수 있습니다.<br>
				⑥ 본 약관에 동의하는 것은 서비스를 정기적으로 방문하여 약관의 변경사항을 확인하는 것에 동의함을 의미합니다. 변경된 약관에 대한 정보를 알지 못하여 발생하는 회원의 피해에 대하여 회사는 책임을 지지 않습니다.
			</p>
			<p>
				제8조 (서비스의 이용)<br>
				① 회사는 회원의 이용신청을 승낙한 때부터 서비스를 개시합니다.
				② 회사의 업무상ㆍ기술상의 장애로 인하여 서비스를 개시하지 못하는 경우에는 서비스에 공지하거나 회원에게 이를 통지합니다.
				③ 서비스의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 회사의 업무상ㆍ기술상 또는 서비스 운영정책상 서비스가 일시 중지될 수 있습니다. 이러한 경우 회사는 사전 또는 사후에 이를 공지합니다.
				④ 회사는 서비스를 일정범위로 분할하여 각 범위 별로 이용 가능한 시간을 별도로 정할 수 있으며 이 경우 그 내용을 공지합니다.
				⑤ 회사는 서비스 내의 개별서비스에 대한 별도의 약관을 둘 수 있으며, 개별서비스에서 별도로 적용되는 약관에 대한 동의는 회원이 개별서비스를 최초로 이용할 경우 별도의 동의절차를 거치게 됩니다.
			</p>
			<p>
				제17조 (회원정보의 보호 및 이용)<br>
				① 회사는 적법하고 공정한 수단에 의하여 이용계약의 성립 및 이행에 필요한 최소한의 범위 내에서 개인정보처리방침에 따라 회원의 회원정보를 수집합니다.
				② 회사의 개인정보처리방침은 회사에 연동된 다른 서비스(회사가 운영하지 않는 서비스를 말합니다. 이하 같습니다)에는 적용되지 않습니다.
				③ 회사는 통신비밀보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관계법령에 따라 행정기관이나 수사기관 등에서 회원의 회원정보의 열람이나 제출을 요청하는 경우에는 이를 제공할 수 있습니다.
				④ 회사는 회원의 귀책사유로 인해 노출된 회원정보에 대해서 일체의 책임을 부담하지 않습니다.
				⑤ 회사는 회원정보의 처리 및 관리 등의 업무를 스스로 수행함을 원칙으로 하나, 필요한 경우 이러한 업무의 일부 또는 전부를 회사가 선정한 회사에 위탁할 수 있으며, 회원정보의 처리 및 관리 등에 관한 업무를 위탁하는 경우에는 개인정보처리방침을 통하여 공지합니다.
				⑥ 회원이 이용계약 체결과정에서 회사에 제공한 회원정보에 대한 이용 또는 제공에 대한 동의를 철회하고자 하는 경우에는 개인정보처리방침에서 정한 바에 따르며, 회원이 이러한 동의를 철회하는 경우 서비스 이용계약은 자동으로 해지됩니다.
			</p>
		</div>
	</div>
	<div id="full"></div>
</footer>