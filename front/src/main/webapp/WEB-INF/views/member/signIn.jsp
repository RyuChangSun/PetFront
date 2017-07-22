<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>BODYCODI</title>

    <link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/notosanskr.css">
    <link type="text/css" rel="stylesheet" href="/css/layout.css">
    <script type="text/javascript" src="/jquery/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/js/ui.js"></script>

    <script>

        $(function()
        {
            /*
             * Sign-Up
             * 작성일 Apr 03, 2017
             * 최초작성자 : Harold
             * 변경이력
             *   - 최초작성 Apr 03, 2017 by Harold
             * */
            $("#register").click(function(){
                location.href = "/signUp";
            });

            /*
             * Sign-in
             * 작성일 Apr 03, 2017
             * 최초작성자 : Harold
             * 변경이력
             *   - 최초작성 Apr 03, 2017 by Harold
             * */
            $("#login").click(function(){
                checkLogin();
            });
        });

        /*
         * checkLogin
         * 작성일 Apr 06, 2017
         * 최초작성자 : Harold
         * 변경이력
         *   - 최초작성 Apr 06, 2017 by Harold
         * */
        function checkLogin(){

            if($("input[name=email]").val() == "")
            {
                $("#checkNoti").text("이메일을 입력하여 주십시오.");
                $("#checkNoti").show();
                $("input[name=email]").focus();

                return;
            }
            else if($("input[name=password]").val() == "")
            {
                $("#checkNoti").text("비밀번호를 입력하여 주십시오.");
                $("#checkNoti").show();
                $("input[name=loginPwd]").focus();

                return;
            }

            $.ajax({
                type : "POST",
                data: $("#frmLogin").serialize(),
                url : "/signIn",
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                dataType : 'json',
                success: function(data) {
                    if(data.result == "ok")
                    {
                        //location.href = "/reservation/index/";
                    }
                    else
                    {
                        $("#checkNoti").text("아이디 또는 비밀번호가 잘못 입력 되었습니다.");
                        $("#checkNoti").show();
                    }
                }
            });
        }
    </script>
</head>
<body>
<div id="wrap">
	<div class="login m_align">
		<div class="inner">
			<h1><img src="/img/layout/logo.png" alt="BODYCODI"></h1>
			
			<form id="frmLogin">
				<div class="form_field">
					<fieldset>
						<legend>로그인</legend>
						<p class="notify" id="checkNoti" style="display:none;">아이디 또는 비밀번호가 잘못 입력 되었습니다.</p>
						<p>
							<label for="mb_id">아이디</label>
                            <input type="email" id="mb_id" name="email" class="float_label" onkeydown="javascript: if (event.keyCode == 13) {checkLogin(); return false;}">
						</p>
						<p>
							<label for="mb_pw">비밀번호</label>
							<input type="password" id="mb_pw" name="password" class="float_label" onkeydown="javascript: if (event.keyCode == 13) {checkLogin(); return false;}">
						</p>
						<p>
							<input type="checkbox" id="auto_login" name="autoSignYn" value="Y">
							<label for="auto_login">자동 로그인</label>
						</p>
						<div class="button_area">
							<button type="button" class="btn red" id="login">로그인</button>
							<button type="button" class="btn line" id="register">회원가입</button>
						</div>
					</fieldset>
	
					<div class="bt_fix_btn">
						<a href="/signMember/findId">아이디 찾기</a>
						<a href="/signMember/findPw">비밀번호 찾기</a>
					</div>
	
					<div class="term_txt">
						<p>
							회원가입과 동시에 <a href="#">서비스 이용약관</a>, <a href="#">개인정보취급방침</a>에<br> 동의하는 것으로 간주합니다.
						</p>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>