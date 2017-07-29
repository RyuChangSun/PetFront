<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common_static.jsp"%>

	<script type="text/javascript">
	
		$(function() 
		{
			// 상단 네비게이션 타이틀
			$("#navigationTitle").text("회원가입");
			$("#inputAuthTmpKey").attr("disabled",true);

			$("#sendAuthTmpKey").click(function(){
				var phoneNo = $("#phoneNo").val();
				var userName = $("#userName").val();
				
				if ( phoneNo == "" )
				{
					alert("휴대폰 번호를 입력하여 주십시오");
					return;
				}

				if ( userName == "" )
				{
					$("#userNameNoti").text("이름을 입력하여 주십시오");
					$("#userNameNoti").show();
					$("#userName").focus();
					
					return false;					
				}
				
				var url = "/signMember/sendAuthKey";
				var param = {mobile:phoneNo, userName:userName};
				
				$.ajax({
		            type: 'POST',
		            contentType: 'application/x-www-form-urlencoded',
		            dataType: 'json',
		            url: url,
		            data: param,		            
		            success: function(data){
		            	if(data.result === 'ok')
	            		{		            		
		            		alert("인증번호를 전송 하였습니다.");
		            		$("#inputAuthTmpKey").attr("class", "btn blue");
		        			$("#inputAuthTmpKey").attr("disabled",false);
		            		dailyMissionTimer(3);
		            		return;		            		
	            		}
		            	else
		            		alert("인증번호 전송중 오류가 발생 하였습니다.");
		            },
		            error: function(){
	            		alert("인증번호 전송중 오류가 발생 하였습니다.");
		            }
		        });				
			});
			
			$("#inputAuthTmpKey").click(function(){
				
				// 인증번호
				var authNo = $("#authNo").val();
				if ( authNo == "" )
				{
					alert("인증번호를 입력하여 주십시오");
					return;
				}
				
				if ( authTimerFlag == false )
				{
					alert("인증시간이 초과 되었습니다. ");					
					return;
				}				
				
				// 휴대폰 번호
				var phoneNo = $("#phoneNo").val();
				
				var url = "/signMember/CheckAuthKey";
				var param = {mobile:phoneNo, authNo:authNo, authTimerFlag:authTimerFlag};
				
				$.ajax({
		            type: 'POST',
		            contentType: 'application/x-www-form-urlencoded',
		            dataType: 'json',
		            url: url,
		            data: param,		            
		            success: function(data){
		            	if(data.result === 'ok')
	            		{		            		
		            		if (data.auth == "ExpireNo")
	            			{
								alert("만료된 인증 번호 입니다.");
								location.reload();
								return;
	            			}
		            		else
	            			{
		            			alert("휴대폰 인증에 성공 하였습니다.");
			            		$("#inputAuthTmpKey").attr("class", "btn light gray");
			        			$("#inputAuthTmpKey").attr("disabled",false);
		            			$("#isAuth").val("Y");
					            clearInterval(interval);
		            			return;
	            			}		            		
	            		}
		            	else
		            		alert("휴대폰 인증에 실패 하였습니다.");
		            },
		            error: function(){
	            		alert("휴대폰 인증에 실패 하였습니다.");
		            }
		        });				
			});
			
			$("#email").change(function(){
				var email = $("#email").val();
				if ( email == "" )
				{
					$("#emailNoti").text("이메일을 입력하여 주십시오.");
					$("#emailNoti").show();
					$("#email").focus();					

					return false;
				}				
				
				var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				
				if(exptext.test(email)==false)
				{
					$("#emailNoti").text("잘 못 입력했습니다. 다시 확인하여 주십시오.");
					$("#emailNoti").show();
					$("#email").focus();
					
					return false;
				}
				
				$("#emailNoti").hide();
			});
			
			$("#password").change(function(){
				var password = $("#password").val();
				if ( password == "" )
				{
					$("#passwordNoti").text("비밀번호를 입력해 주세요.");
					$("#passwordNoti").show();
					$("#password").focus();

					return false;
				}
				
				if(password.length < 6 || password.length > 15)
				{
					$("#passwordNoti").text("6~15자 입력해 주세요.");
					$("#passwordNoti").show();
					$("#password").focus();
					
					return false;
				}				
				
				$("#passwordNoti").hide();
			});

			$("#repassword").change(function(){
				var password = $("#password").val();
				var repassword = $("#repassword").val();
				
				if ( repassword == "" )
				{
					$("#repasswordNoti").text("비밀번호를 입력해 주세요.");
					$("#repasswordNoti").show();
					$("#repassword").focus();

					return false;
				}				
				
				if(password != repassword)
				{
					$("#repasswordNoti").text("입력된 비밀번호가 일치하지 않습니다.");
					$("#repasswordNoti").show();
					$("#repassword").focus();
					
					return false;
				}
				
				$("#repasswordNoti").hide();
			});			
			
			$('input:radio[name=sex]').change(function(){
				if ( !$('input:radio[name=sex]').is(':checked') )
				{
					$("#genderNoti").text("성별을 선택하여 주십시오.");
					$("#genderNoti").show();
					
					return false;					
				}
				
				$("#genderNoti").hide();
			});
			
			$("#btnSave").click(function(){
						
				var email = $("#email").val();
				if ( email == "" )
				{
					$("#emailNoti").text("이메일을 입력하여 주십시오.");
					$("#emailNoti").show();
					$("#email").focus();					

					return false;
				}

				var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				
				if(exptext.test(email)==false)
				{
					$("#emailNoti").text("잘 못 입력했습니다. 다시 확인하여 주십시오.");
					$("#emailNoti").show();
					$("#email").focus();
					
					return false;
				}					
				
				var password = $("#password").val();
				
				if ( password == "" )
				{
					$("#passwordNoti").text("비밀번호를 입력하여 주십시오");
					$("#passwordNoti").show();
					$("#password").focus();					

					return false;
				}				
				
				if(password.length < 6 || password.length > 15)
				{
					$("#passwordNoti").text("6~15자 입력하여 주십시오.");
					$("#passwordNoti").show();
					$("#password").focus();
					
					return false;
				}

				var repassword = $("#repassword").val();
				if(password != repassword)
				{
					$("#repasswordNoti").text("입력된 비밀번호가 일치하지 않습니다.");
					$("#repasswordNoti").show();
					$("#repassword").focus();
					
					return false;
				}
				
				var userName = $("#userName").val();
				if ( userName == "" )
				{					
					$("#userNameNoti").text("이름을 입력하여 주십시오.");
					$("#userNameNoti").show();
					$("#userName").focus();
					
					return false;
				}			
				
//				if ( !$('input:radio[name=sex]').is(':checked') )
//				{
//					$("#genderNoti").text("성별을 선택하여 주십시오.");
//					$("#genderNoti").show();
//
//					return false;
//				}
				
				var isAuth = $("#isAuth").val();
				if ( isAuth == "N" )
				{
					alert("휴대폰을 인증 하셔야 가입이 가능합니다.");
					return false;
				}

                $("#registerForm").attr("action", "/signMember/signUp");
                $("#registerForm").attr("method", "post");
                $("#registerForm").submit();
			});
			
			var authTimerFlag = false;
			var interval = "";
			function dailyMissionTimer(duration) {
			    
			    var timer = duration * 60;
			    var hours, minutes, seconds;
			    
			    interval = setInterval(function(){
			        hours	= parseInt(timer / 3600, 10);
			        minutes = parseInt(timer / 60 % 60, 10);
			        seconds = parseInt(timer % 60, 10);
					
			        hours 	= hours < 10 ? "0" + hours : hours;
			        minutes = minutes < 10 ? "0" + minutes : minutes;
			        seconds = seconds < 10 ? "0" + seconds : seconds;
					
			        //$('#time-hour').text(hours);
					$("#threeMinute").show();
			        
			        $('#countdownMinute').text(minutes);
			        $('#countdownSecond').text(seconds);
			        
			        authTimerFlag = true;
			        
			        if (--timer < 0) {
			            timer = 0;
			            clearInterval(interval);
			            authTimerFlag = false;
			        }
			    }, 1000);
			}		
		});
		
	</script>

<div id="temp_section">
	<div class="form_field">
		<form id="registerForm">
			<input type="hidden" name="result">
			<input type="hidden" name="registerType" value="R">
			<fieldset>
				<legend>회원가입</legend>
				<p>
					<label for="email">이메일</label>
					<input type="email" id="email" name="email" class="float_label">
				</p>
				<p class="notify" id="emailNoti" style="display:none;">잘 못 입력했습니다. 다시 확인해 주세요.</p>

				<p>
					<label for="password">비밀번호 <i>(6자 이상 입력해주세요.)</i></label>
					<input type="password" id="password" name="password" class="float_label">
				</p>
				<p class="notify" id="passwordNoti" style="display:none;"></p>

				<p>
					<label for="repassword">비밀번호 확인</label>
					<input type="password" id="repassword" name="repassword" class="float_label">
				</p>
				<p class="notify" id="repasswordNoti" style="display:none;"></p>

				<p>
					<label for="userName">이름</label>
					<input type="text" id="userName" name="name" class="float_label">
				</p>
				<p class="notify" id="userNameNoti" style="display:none;"></p>

				<div class="button_area multi">
					<button type="button" class="btn gray" name="btnCancel" onclick="history.go(-1); return false">취소</button>
					<input class="btn red" value="회원가입" id="btnSave" name="btnSave">
				</div>
			</fieldset>
		</form>
	</div>
</div>