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

    <!-- 구글 recaptcha2 -->
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        * { font-family: 'Pretendard-Regular'; }

        #register-title-area{ /* 회원가입 텍스트 영역 */
            width: 900px;
            margin: auto;
            margin-top: 10%;
            border-bottom: 3px solid rgb(121, 172, 120);;
        }

        #register-title-area>p{ /* 회원가입 텍스트 */
            font-size: 26px;
            font-weight: bold;
            color: rgb(121, 172, 120);
            letter-spacing: 3px;
        }

        .register-title-menu{ /* 상단 슬롯 */
            width: 12%;
            padding: 6px;
            float: right;
            margin-left: 2px;
            margin-top: 20px;
            background-color: rgb(121, 172, 120);
            color: white;
        }
        .register-title-menu:hover{ /* 상단슬롯 호버효과제거 */
            width: 12%;
            padding: 6px;
            float: right;
            margin-left: 2px;
            margin-top: 20px;
            background-color: rgb(121, 172, 120);
            color: white;
        }

        #table-area-default>p{ /* "기본정보입력" */
            padding: 10px;
            font-size: 22px;
            font-weight: 700;
            text-align: center;
            color: rgb(121, 172, 120);
            letter-spacing: 2px;
        }

        #register-form-table{ /* 테이블 */
            width: 1000px;
            margin: auto;
        }
        #register-form-table th{ /* 테이블 제목열 */
            width: 300px;
            text-align: right;
            font-size: 18px;
            color: dimgray;
            padding-bottom: 3%;
        }
        #register-form-table td{ /* 테이블 입력칸들 */
            width: 700px;
            text-align: left;
            font-size: 16px;
            padding-left: 5%;
            padding-bottom: 3%;
        }

        #userName{ width: 300px; }  /* 성명 입력칸 */
        #userBirth{ width: 300px; } /* 생년월일 입력칸 */
        
        
        #domain{ width: 140px; } /* 이메일 계정명 */
        #domainText{ width: 140px; }
        #email{ width: 150px; }

        /* 휴대폰번호 입력칸 */
        #telecom{ width: 90px;
        }
        .phone{
        width: 80px;
        }


        #address, #sAddress{ /* 주소입력칸 */
            width: 300px;
        }
        .nessesary{ color: red; } /* 별 표시 */


        #account-title{ /* "아이디/비밀번호 설정" */
            padding: 10px;
            font-size: 22px;
            font-weight: 700;
            text-align: center;
            color: rgb(121, 172, 120);
            letter-spacing: 2px;
            display: block;
        }

        #table-area-account { /* 테이블 영역 */
            padding: 10px;
            text-align: left;
            margin-top: 7%;
            margin-bottom: 10%;
        }

        #account-form-table{ /* 아이디 비번설정 테이블 */
            width: 1000px;
            margin: auto;
        }

        #account-form-table th{ /* 테이블 제목열 */
            width: 300px;
            text-align: right;
            font-size: 18px;
            color: dimgray;
            padding-bottom: 30px;
            
        }
        #account-form-table td{ /* 테이블 입력칸 영역 */
            width: 700px;
            text-align: left;
            font-size: 16px;
            padding-left: 5%;
        }

        #account-form-table input{ /* 테이블 INPUT 태그 */
            width: 300px;
            display: inline-block;
        }

        #duplicate-check{ /* 아이디 중복확인 버튼 */
            margin-left: 20px;
            border: 0px;
            background-color: rgb(121, 172, 120);
            color: white;
            border-radius: 25px;
            width: 100px;
        }
        #duplicate-check:hover{
            background-color: rgb(82, 116, 82);
        }

        #account-form-table p{ /* ID/PWD 조건텍스트 */
            font-size: 12px;
        }

        #reset-form, #submit-form{ /* 초기화, 다음버튼 공통 */
            width: 120px;
            height: 50px;
            border: 0px;
            border-radius: 10px;
            font-size: 18px;
            margin: 0px 0px 20px 20px;
        }

        #reset-form{
            background-color: rgb(240, 217, 12);
        }
        #submit-form{
            background-color: rgb(121, 172, 120);
            color: white;
        }
        
        #requireDuplicateText{
        	font-size: 14px;
        	color: red;
        	margin-left: 25px;
        }	
        #possible-text{
        	font-size: 14px
        }

    </style>
</head>
<body>
	<%@ include file="../../common/header.jsp" %>

    <div id="register-title-area">
        <p>
            회원가입
                <span class="register-title-menu btn btn-sm disabled">가입완료</span>
                <span class="register-title-menu btn btn-sm disabled" style="background-color: green;">정보입력</span>
                <span class="register-title-menu btn btn-sm disabled">약관동의</span>
        </p>
        
    </div>
 
    <form action="<%= contextPath %>/insertMember.rg" method="post" id="register-form" onsubmit="return onGoogle();">
        <br>
        <div id="table-area-default">
            <p>기본정보입력</p>
            <br>
            <table id="register-form-table" align="center">
                <tr>
                    <th><span class="nessesary">*</span> 성명 : </th>
                    <td colspan="3">
                        <input type="text" id="userName" name="memberName" required class="form-control form-control">
                    </td>
                </tr>
                <tr>
                    <th><span class="nessesary">*</span> 생년월일 : </th>
                    <td colspan="3">
                        <input type="date" id="userBirth" name="memberBirth" required class="form-control form-control">
                    </td>
                </tr>
                <tr>
                    <th><span class="nessesary">*</span> 휴대폰번호</th>
                    <td>
                    <div style="display:flex; width: 300px;">
                        <select id="telecom" name="telecom"  class="phone form-control form-control">
                            <option selected>SKT</option>
                            <option>KT</option>
                            <option>LG U+</option>
                        </select>
                        <input type="text" name="memberPhone1" class="phone form-control form-control" required>
                        <input type="text" name="memberPhone2" class="phone form-control form-control" required>
                    </div>
                    </td>
                </tr>
                <tr>
                    <th><span class="nessesary">*</span> 이메일</th>
                    <td colspan="3">
                    <div style="display:flex; width: 500px;">
                        <input type="text" id="email" name="email" required class="form-control form-control">@
                        <input type="text"  id="domainText" name="domain" class="email form-control form-control" required>
                        <select id="domain" class="email form-control form-control">
                            <option selected>직접입력</option>
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                        </select>
                    </div>
                    </td>
                </tr>
                <tr>
                    <th><span class="nessesary">*</span> 주소</th>
                    <td colspan="3">
                        <input type="text" id="address" name="simpleAddress" required class="form-control form-control">
                    </td>
                </tr>
                <tr>
                    <th>상세주소</th>
                    <td colspan="3">
                        <input type="text" id="sAddress" name="detailAddress" required class="form-control form-control">
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td>
                        <div class="g-recaptcha" data-sitekey="6LfllG4jAAAAAHl2gmj51tnVeIKQArzfQ0g2RdnL"></div>
                    </td>
                    <script>
                        function onGoogle() {
                            if (grecaptcha.getResponse().length == 0) { alert('reCAPTCHA를 확인해 주세요.'); return false; }
                            return true;
                        }
                    </script>
                </tr>
            </table>
        </div>

        <div id="table-area-account">
            <span id="account-title">아이디 / 비밀번호 설정</span>
            <br>
            <table id="account-form-table" align="center">
                <tr>
                    <th>아이디</th>
                    <td>
                        <input type="text" id="userId" name="memberId" required class="form-control form-control"
                        minlength="5" maxlength="15">
                        <button type="button" id="duplicate-check" onclick="duplicateCheck();">
                            중복확인
                        </button> <span id="possible-text"></span>
                        <p>영문, 숫자 포함 5-15자</p>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>
                        <input type="password" id="userPwd" name="memberPwd" required class="form-control form-control"
                        minlength="8" maxlength="20">
                        <p>영문, 숫자, 특수기호 포함 8-20자</p>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td>
                        <input type="password" id="checkPwd" required class="form-control form-control">
                        <p>영문, 숫자, 특수기호 포함 8-20자</p>
                    </td>
                </tr>
            </table>
        </div>

        <div align="center">
            <p id="requireDuplicateText">아이디 중복체크를 진행해주세요</p>
            <button type="reset" id="reset-form">초기화</button>
            <button type="submit" id="submit-form"  disabled onclick="return validate();">확인</button>
        </div>

    </form>
    
    <script> // 아이디 중복체크
    	function duplicateCheck() {
    		
    		let $memberId = $("#userId");
    		let pText = $("#possible-text");
    		let dText = $("#requireDuplicateText");
    		
    		let regExp = /^[a-z][a-z\d]{5,15}$/;
    		
    		$.ajax({
    		url : "duplicateCheck.rg",
    		type : "get",
    		data : { checkId : $memberId.val() },
    		success : function(result) {
    			
    			if(result == "N"){		// 사용불가
    				pText.text("이미 사용중인 아이디입니다.").css("color", "red", "");
    				$memberId.focus();
    			} else {		// 사용가능
    				
    				if(!regExp.test($memberId.val())){ // 아이디 조건이 맞지 않는다면
    					alert("유효한 아이디값이 아닙니다. 영문 소문자, 숫자 포함 5~15자");
    					$memberId.focus();
    				} else if(confirm($memberId.val() + " 아이디로 사용하시겠습니까?")) { // 확인창 띄움
    					$("#submit-form").removeAttr("disabled");
    					$("#submit-form").hover(
    						function(){
    							$(this).css("font-weight", "bold");
    					},
    						function(){
    							$(this).css("font-weight", "500");
    					}
    					)
    					pText.text("사용 가능한 아이디입니다.").css("color", "green");
    					dText.text("");
    					$memberId.attr("readonly", true);
    				} else {
    					$memberId.focus();
    				}
    				
    			}
    			
    		},
    		error : function(){
    			alert("통신실패. 관리자에게 문의하세요");
    		}
    			
    		});
    		
    	}
    </script>
    
    <script> // 비밀번호 유효성 검사
    		function validate () {
        		
        		let memberName = $("#userName").val();
        		const memberPwd = $("#userPwd").val();
            	const checkPwd = $("#checkPwd").val();
            	
            	regExp = /^[a-zA-Z\d!@#$%^&*]{8,20}$/i;
        		
            	if(!regExp.test(memberPwd)){
            		alert("비밀번호가 유효하지 않습니다" + "8~20자리 영문대소문자, 숫자, 특수문자");
            		$("#userPwd").focus();
                    return false;
            	}
            	
        		if(memberPwd != checkPwd){
        			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요");
        			$("#checkPwd").focus();
        			return false;
        		}       	
        		
        		regExp = /^[가-힣]{2,}$/;
        		
        		if(!regExp.test(memberName)) {
        			alert("잘못된 이름을 입력했습니다. (2글자 이상 한글)");
        			$("userName").select();
        			return false;
        		}
        		
        		return true;
        		
        	}
	
    </script>
    
    <script> // 이메일 직접입력 안할 시 input 요소숨김
    
    	$(function (){
    		$("#domain").change(function() {
    			
    			let selectDomain = $(this).val();
    			
    			if(selectDomain == "직접입력"){
    				$("#domainText").val("");
    			} else {
    				$("#domainText").val($("#domain").val());
    			}
    			
    		})
    	})
    
    </script>

    <br><br>

	<%@ include file="../../common/footer.jsp" %>
</body>
</html>