console.log("memberService.js파일 불러옴");

$(function() {
	
	//
	$("#member_read_btn_delete").click(function(event){
		event.preventDefault();
		let isDelete = confirm("정말 삭제합니까?");
		
		if(isDelete){
			let username = $(this).attr("href");
			let input = $("<input>").attr("type", "hidden").attr("name", "username").val(username);
			let form = $("<form>").attr("method", "post").attr("action", "/member/delete").appendTo("body");
			form.append(input).submit();
		}
	});

	// 
	$("#member_update_attach").change(function() {
		let orgImg = $("#member_update_preview").find("img").attr("data-orgImg");

		let reader = new FileReader();
		reader.readAsDataURL(event.target.files[0]);

		reader.onload = function(event) {
			let result = event.target.result;
			if (event.target.result.startsWith("data:image")) {
				$("#member_update_preview").find("img").attr("src", `${result}`);
				
			} else {
				$("#member_update_preview").find("img").attr("src", `${orgImg}`);
				$("input[name='profileImg']").val('');
				alert("이미지 파일만 올리세요!");
			}

		}

	});

	//
	$("input[name='profileImg']").change(function() {
		let reader = new FileReader();
		reader.readAsDataURL(event.target.files[0]);

		reader.onload = function(event) {
			let result = event.target.result;
			if (event.target.result.startsWith("data:image")) {
				let imgTag = `<img src="${result}" width="100%" height="100%">`;
				
				$("#preview").html(imgTag);
			} else {
				$("#preview").html('');
				$("input[name='profileImg']").val('');
				alert("이미지 파일만 올리세요!");
			}

		}

	});

	let isPassConfirmPassword = false;
	let isPassCheckId = false;

	// join.jsp password바꾸면...
	$("#member_join_insertForm").on("input", "input[name^='password']", function() {
		isPassConfirmPassword = false;
		$("input[name^='password']").closest("div").find("span").removeAttr().text("");

		let pass = $("input[name='password']").val();
		let pass2 = $("input[name='password2']").val();

		if (pass && pass2 && pass == pass2) {
			$("input[name^='password']").closest("div").find("span").attr("style", "color:blue").text("비밀번호 일치함");
			isPassConfirmPassword = true;
			return;
		}

		if (pass && pass2 && pass != pass2) {
			$("input[name^='password']").closest("div").find("span").attr("style", "color:red").text("비밀번호 일치하지 않음");
			return;
		}

	});

	// join.jsp username 바꾸면...
	$("#member_join_insertForm").on("input", "input[name='username']", function() {
		$("#member_join_btn_checkId").next().removeAttr().text('');
		isPassCheckId = false;
	});

	// join.jsp 회원등록 버튼
	$("#member_join_insertForm").on("click", "#member_join_btn_submit", function() {
		let username = $("input[name='username']").val();
		let pass = $("input[name='password']").val();
		let pass2 = $("input[name='password2']").val();
		let name = $("input[name='name']").val();

		if (!username || !pass || !pass2 || !name) {
			alert("입력하세요.");
			return;
		}

		if (!isPassCheckId) {
			alert("중복검사 하세요.");
			return;
		}

		if (!isPassConfirmPassword) {
			alert("비번 일치하지 않음.");
			return;
		}

		$("#member_join_insertForm").submit();
	});

	// member/join.jsp 중복검사 버튼
	$("#member_join_insertForm").on("click", "#member_join_btn_checkId", function() {
		let username = $("input[name='username']").val();
		$.ajax({
			url: "/member/checkId",
			type: "post",
			data: {
				username: username
			},
			dataType: "text",
			success: function(result) {
				if (result == 'ok') {
					alert("사용가능");
					isPassCheckId = true;
					return;
				}
				alert("사용불가");
			}
		});
	});

});