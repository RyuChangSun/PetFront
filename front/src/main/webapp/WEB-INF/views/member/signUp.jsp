<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common_static.jsp"%>

	<script type="text/javascript">
	
		$(function() 
		{
			// 상단 네비게이션 타이틀
			$("#navigationTitle").text("회원가입");
			
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

                $("#registerForm").attr("action", "/signUp");
                $("#registerForm").attr("method", "post");
                $("#registerForm").submit();
			});	
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

				<p class="notify" id="userNameNoti" style="display:none;"></p>

				<div class="button_area multi">
					<button type="button" class="btn gray" name="btnCancel" onclick="history.go(-1); return false">취소</button>
					<input class="btn red" value="회원가입" id="btnSave" name="btnSave">
				</div>
			</fieldset>
		</form>
	</div>
</div>