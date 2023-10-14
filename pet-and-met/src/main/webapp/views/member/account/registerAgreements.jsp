<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String pagePath = "./"; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery 라이브러리 연동 (온라인 방식) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        * { font-family: 'Pretendard-Regular'; }

        #register-title-area{ /* 상단 텍스트 영역 */
            width: 900px;
            margin: auto;
            margin-top: 10%;
            border-bottom: 3px solid rgb(121, 172, 120);;
        }

        #register-title-area>p{ /* 상단 텍스트 */
            font-size: 26px;
            font-weight: bold;
            color: rgb(121, 172, 120);
            letter-spacing: 3px;
        }

        .register-title-menu{ /* 상단슬롯 */
            width: 12%;
            padding: 6px;
            float: right;
            margin-left: 2px;
            margin-top: 20px;
            background-color: rgb(121, 172, 120);
            color: white;
        }
        .register-title-menu:hover{ /* 상단슬롯 호버효과삭제 */
            width: 12%;
            padding: 6px;
            float: right;
            margin-left: 2px;
            margin-top: 20px;
            background-color: rgb(121, 172, 120);
            color: white;
        }

        #agreement-area{ /* 약관 공통 영역 */
            width: 900px;
            margin: auto;
        }

        .title-text{ /* 제목텍스트 + 내용 영역 */
            width: 400px;
            margin-left: 20px;
            margin-right: 20px;
            float: left;            
        }

        .title-text>p{ /* 약관 타이틀 텍스트 */
            font-size: 20px;
            font-weight: 700;
        }

        #agreement-use, #agreement-info{ /* 약관 내용 텍스트박스 */
            width: 400px;
            height: 300px;
            border: 2px solid lightgray;
            resize: none;
            background-color: white;
        }

        #use-true, #info-true{ /* 체크박스 */
            width: 20px;
            height: 20px;
            margin-top: 8px;
            vertical-align: middle;
        }

        .agree-text{ /* "동의합니다." */
            font-size: 18px;
            vertical-align: text-top; 
        }

        #btn-nextPage{ /* 다음버튼 */
            width: 120px;
            height: 50px;
            border: 0px;
            border-radius: 10px;
            font-size: 18px;
            margin-top: 100px;
            background-color: rgb(121, 172, 120);
            color: white;
        }
        #btn-nextPage:hover{
            background-color: rgb(82, 116, 82);
        }

    </style>
</head>
<body>

    <%@ include file="../../common/header.jsp" %>
    <div id="register-title-area">
        <p>
            회원가입
                <span class="register-title-menu btn btn-sm disabled">가입완료</span>
                <span class="register-title-menu btn btn-sm disabled">정보입력</span>
                <span class="register-title-menu btn btn-sm disabled" style="background-color: green;">약관동의</span>
        </p>
    </div>
    <br><br><br>
		<form action="<%= contextPath %>/register.rg" method="post">
        <div id="agreement-area">
			
            <div class="title-text">
                <p>서비스 이용약관</p>
                <textarea class="form-control" rows="5" id="agreement-use" readonly>
제 1 장 총 칙
제 1 조(목적)
이 약관은 Pet&Met이 온라인으로 제공하는 디지털콘텐츠(이하 “콘텐츠”라고 한다) 및 제반서비스의 이용과 관련하여 Pet&Met와(과) 이용자와의 권리, 의무 및 책임사항 등을 규정함을 목적으로 합니다.

제 2 조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
 1. “Pet&Met”(이)라 함은 “콘텐츠” 산업과 관련된 경제활동을 영위하는 자로서 콘텐츠 및 제반서비스를 제공하는 자를 말합니다.
 2. “이용자”라 함은 “Pet&Met”의 사이트에 접속하여 이 약관에 따라 “Pet&Met”이(가) 제공하는 “콘텐츠” 및 제반서비스를 이용하는 사용자를 말합니다.
 3. “콘텐츠”라 함은 정보통신망이용촉진 및 정보보호 등에 관한 법률 제2조 제1항 제1호의 규정에 의한 정보통신망에서 사용되는 부호·문자·음성·음향·이미지 또는 영상 등으로 표현된 자료 또는 정보로서, 그 보존 및 이용에 있어서 효용을 높일 수 있도록 전자적 형태로 제작 또는 처리된 것을 말합니다.
제 3 조 (신원정보 등의 제공)
“Pet&Met”는 이 약관의 내용, 상호, 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 모사전송번호, 전자우편주소, 사업자등록번호, 통신판매업 신고번호 및 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 온라인 서비스초기화면에 게시합니다. 다만, 약관은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
제 4 조 (약관의 게시 등)
① “Pet&Met”는 이 약관을 “이용자”가 그 전부를 인쇄할 수 있고 거래과정에서 해당 약관의 내용을 확인할 수 있도록 기술적 조치를 취합니다.
② “Pet&Met”는 “이용자”가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회, 환불조건 등과 같은 중요한 내용을 이용자가 쉽게 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 “이용자”의 확인을 구합니다.
 
제 5 조 (약관의 개정 등)
① “Pet&Met”는 온라인 디지털콘텐츠산업 발전법, 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
② “Pet&Met”이(가) 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 서비스초기화면에 그 적용일자 7일 이전부터 적용일 후 상당한 기간동안 공지합니다 .
제 6 조 (약관의 해석)
이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 온라인 디지털콘텐츠산업 발전법, 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률, 정보통신부장관이 정하는 디지털콘텐츠이용자보호지침, 기타 관계법령 또는 상관례에 따릅니다.
제 2 장 콘텐츠 이용사항
제 7 조 (“콘텐츠”의 내용 등의 게시)
① “Pet&Met”는 다음 사항을 해당 “콘텐츠”의 이용초기화면이나 그 포장에 “이용자”가 알기 쉽게 표시합니다.
  1. “콘텐츠”의 명칭 또는 제호
  2. “콘텐츠”의 제작 및 표시 연월일
  3. “콘텐츠” 제작자의 성명(법인인 경우에는 법인의 명칭), 주소, 전화번호
  4. “콘텐츠”의 내용, 이용방법, 이용료 기타 이용조건
② “Pet&Met”는 “콘텐츠”별 이용가능기기 및 이용에 필요한 최소한의 기술사양에 관한 정보를 계약체결과정에서 “이용자”에게 제공합니다.
제 8 조 (“Pet&Met”의 의무)
① “Pet&Met”는 법령과 이 약관이 정하는 권리의 행사와 의무의 이행을 성실하게 하여야 합니다.
② “Pet&Met”는 “이용자”가 안전하게 “콘텐츠”를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보보호정책을 공시하고 준수합니다.
③ “Pet&Met”는 콘텐츠이용과 관련하여 “이용자”로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 지체없이 처리합니다. 이용자가 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 그 처리과정 및 결과를 전달합니다
제 9 조 (“이용자”의 의무)
① “이용자”는 다음 행위를 하여서는 안 됩니다.
  1. 신청 또는 변경 시 허위내용의 기재
  2. 타인의 정보도용
  3. “Pet&Met”에 게시된 정보의 변경
  4. “Pet&Met”이(가) 금지한 정보(컴퓨터 프로그램 등)의 송신 또는 게시
  5. “Pet&Met”와(과) 기타 제3자의 저작권 등 지적재산권에 대한 침해
  6. “Pet&Met” 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
  7. 외설 또는 폭력적인 말이나 글, 화상, 음향, 기타 공서양속에 반하는 정보를 “Pet&Met”의 사이트에 공개 또는 게시하는 행위
  8. 기타 불법적이거나 부당한 행위
② “이용자”는 관계법령, 이 약관의 규정, 이용안내 및 “콘텐츠”와 관련하여 공지한 주의사항, “Pet&Met”이(가) 통지하는 사항 등을 준수하여야 하며, 기타 “Pet&Met”의 업무에 방해되는 행위를 하여서는 안 됩니다.
제 10 조 (정보의 제공 및 광고의 게재)
① “Pet&Met”는 “이용자”가 콘텐츠이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 “이용자”에게 제공할 수 있습니다. 다만, “이용자”는 언제든지 전자우편 등을 통하여 수신 거절을 할 수 있습니다.
② 제1항의 정보를 전화 및 모사전송기기에 의하여 전송하려고 하는 경우에는 “이용자”의 사전 동의를 받아서 전송합니다.
③ “Pet&Met”는 “콘텐츠”서비스 제공과 관련하여 콘텐츠화면, 홈페이지, 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편 등을 수신한 “이용자”는 수신거절을 “Pet&Met”에게 할 수 있습니다.
제 11 조 (게시물의 삭제)
① “Pet&Met”는 게시판에 정보통신망이용촉진 및 정보보호 등에 관한 법률을 위반한 청소년유해매체물이 게시되어 있는 경우에는 이를 지체 없이 삭제 합니다. 다만, 19세 이상의 “이용자”만 이용할 수 있는 게시판은 예외로 합니다.
② “Pet&Met”이(가) 운영하는 게시판 등에 게시된 정보로 인하여 법률상 이익이 침해된 자는 “Pet&Met”에게 당해 정보의 삭제 또는 반박내용의 게재를 요청할 수 있습니다. 이 경우 “Pet&Met”는 지체 없이 필요한 조치를 취하고 이를 즉시 신청인에게 통지합니다.
제 12 조 (저작권 등의 귀속)
① “Pet&Met”이(가) 작성한 저작물에 대한 저작권 기타 지적재산권은 “Pet&Met”에 귀속합니다.
② “Pet&Met”이(가) 제공하는 서비스 중 제휴계약에 의해 제공되는 저작물에 대한 저작권 기타 지적재산권은 해당 제공업체에 귀속합니다.
③ “이용자”는 “Pet&Met”이(가) 제공하는 서비스를 이용함으로써 얻은 정보 중 “Pet&Met” 또는 제공업체에 지적재산권이 귀속된 정보를 “Pet&Met” 또는 제공업체의 사전승낙 없이 복제, 전송, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안 됩니다.
④ “Pet&Met”는 약정에 따라 “이용자”의 저작물을 사용하는 경우 당해 “이용자”의 허락을 받습니다.
제 13 조 (개인정보보호)
① “Pet&Met”는 제7조 제2항의 신청서기재사항 이외에 “이용자”의 콘텐츠이용에 필요한 최소한의 정보를 수집할 수 있습니다. 이를 위해 “Pet&Met”이(가) 문의한 사항에 관해 “이용자”는 진실한 내용을 성실하게 고지하여야 합니다.
② “Pet&Met”이(가) “이용자”의 개인 식별이 가능한 “개인정보”를 수집하는 때에는 당해 “이용자”의 동의를 받습니다.
③ “Pet&Met”는 “이용자”가 이용신청 등에서 제공한 정보와 제1항에 의하여 수집한 정보를 당해 “이용자”의 동의 없이 목적 외로 이용하거나 제3자에게 제공할 수 없으며, 이를 위반한 경우에 모든 책임은 “Pet&Met”이(가) 집니다. 다만, 다음의 경우에는 예외로 합니다.
  1. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우
  2. “콘텐츠” 제공에 따른 요금정산을 위하여 필요한 경우
  3. 도용방지를 위하여 본인확인에 필요한 경우
  4. 약관의 규정 또는 법령에 의하여 필요한 불가피한 사유가 있는 경우
④ “Pet&Met”이(가) 제2항과 제3항에 의해 “이용자”의 동의를 받아야 하는 경우에는 “개인정보”관리책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공관련사항(제공받는 자, 제공목적 및 제공할 정보의 내용)등에 관하여 정보통신망이용촉진 및 정보보호 등에 관한 법률 제22조 제2항이 규정한 사항을 명시하고 고지하여야 합니다.
⑤ “이용자”는 언제든지 제3항의 동의를 임의로 철회할 수 있습니다.
⑥ “이용자”는 언제든지 “Pet&Met”이(가) 가지고 있는 자신의 “개인정보”에 대해 열람 및 오류의 정정을 요구할 수 있으며, “Pet&Met”는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. “이용자”가 오류의 정정을 요구한 경우에는 “Pet&Met”는 그 오류를 정정할 때까지 당해 “개인정보”를 이용하지 않습니다.
⑦ “Pet&Met” 또는 그로부터 “개인정보”를 제공받은 자는 “이용자”가 동의한 범위 내에서 “개인정보”를 사용할 수 있으며, 목적이 달성된 경우에는 당해 “개인정보”를 지체 없이 파기합니다.
⑧ “Pet&Met”는 정보통신망이용촉진 및 정보보호에 관한 법률 등 관계 법령이 정하는 바에 따라 “이용자”의 “개인정보”를 보호하기 위해 노력합니다. “개인정보”의 보호 및 사용에 대해서는 관련법령 및 “Pet&Met”의 개인정보보호정책이 적용됩니다.
제 3 장 분쟁해결 및 기타사항
제 14 조 (분쟁의 해결)
“Pet&Met”는 분쟁이 발생하였을 경우에 “이용자”가 제기하는 정당한 의견이나 불만을 반영하여 적절하고 신속한 조치를 취합니다. 다만, 신속한 처리가 곤란한 경우에 “Pet&Met”는 “이용자”에게 그 사유와 처리일정을 통보합니다.
제 15 조 ( 기타 )
본 약관에 규정된 이외의 필요한 사항은 당사자간에 별도로 약정할 수 있습니다.                
                </textarea>
                <br>
                <input type="checkbox" id="use-true" required> &nbsp;
                <label for="use-true" class="agree-text">동의합니다.</label>
            </div>

            <div class="title-text">
                <p>개인정보처리방침</p>   
                <textarea class="form-control" rows="5" id="agreement-info" align="center" readonly>
1. 개인정보의 처리 목적
주식회사 Pet&Met(‘http://pet-and-met.com’이하 ‘주식회사 Pet&Met’) 은(는) 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.

- 온라인 문의상담 등

2. 개인정보처리 위탁
① 주식회사 Pet&Met('주식회사 Pet&Met')은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
② 주식회사 Pet&Met('http://withdog.pet'이하 '주식회사 Pet&Met')은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.
③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.

3. 정보주체의 권리,의무 및 그 행사방법
이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.
① 정보주체는 주식회사 Pet&Met(‘http://withdog.pet’이하 ‘주식회사 Pet&Met') 에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
1. 개인정보 열람요구
2. 오류 등이 있을 경우 정정 요구
3. 삭제요구
4. 처리정지 요구

4. 처리하는 개인정보의 항목
① 주식회사 Pet&Met('http://withdog.pet'이하 '주식회사 Pet&Met')은(는) 다음의 개인정보 항목을 처리하고 있습니다.
1[온라인문의 업무]
- 필수항목 : 이름, 전화번호
- 선택항목 : 이메일, 팩스번호, 기타 요청사항

5. 개인정보의 파기
주식회사 Pet&Met('주식회사 Pet&Met')은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다.
파기의 절차, 기한 및 방법은 다음과 같습니다.
-파기절차이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.-파기기한이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.

6. 개인정보의 안전성 확보 조치
주식회사 Pet&Met('주식회사 Pet&Met')은(는) 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.
1. 개인정보 취급 직원의 최소화 및 교육
개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.

7. 개인정보 보호책임자
① 주식회사 Pet&Met(‘http://withdog.pet’이하 ‘주식회사 Pet&Met) 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.                
                </textarea>
                <br>
                <input type="checkbox" id="info-true" required> &nbsp;
                <label for="info-true" class="agree-text">동의합니다.</label>
            </div>

            <div align="center">
                <button type="submit" id="btn-nextPage">다음</button>
            </div>

        </div>
        </form>

    <br><br>
      
    <%@ include file="../../common/footer.jsp" %>

</body>
</html>