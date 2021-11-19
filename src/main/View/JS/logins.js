$(document).ready(function(){
	$("#form-login").submit(function(e) {
	    e.preventDefault();
	});
	
	$("#form-register").submit(function(e) {
	    e.preventDefault();
	});
})

function checkLogin() {
	let check = true;
	if($('#login-uname').val() == ''){
		$('#login-uname').css("border","1px solid red");
		check = false;
	}
	
	if($('#login-pass').val() == ''){
		$('#login-pass').css("border","1px solid red");
		check = false;
	}
	
	if(check){
		const data = $('#form-login').serialize();
		$.ajax({
	        url: '/JTCBooks/Login',
	        type: "POST",
	        data: data,
			dataType: 'JSON',
	        success: function (info) {
				if(info.mes == 1)
					window.location.replace("AceptBill");
				else if(info.mes == 0)
					window.location.replace("Home");
				else $("#login-mess").text("Số điện thoại/email hoặc mật khẩu không đúng!");
	        }
	    });
	}else $("#login-mess").text("Các trường không được để trống!");
}

function checkRegister() {
	
	let name = $('#register-name').val().trim();
	if(name == ''){
		$('#register-name').css("border","1px solid red");
		$("#register-mess").text("Vui lòng nhập họ tên!");
		return;
	}else $('#register-name').css("border","none");
	
	let phone = $('#register-phone').val().trim();
	if(phone == ''){
		$('#register-phone').css("border","1px solid red");
		$("#register-mess").text("Vui lòng nhập số điện thoại!");
		return;
	}else if(phone.length != 10){
		$('#register-phone').css("border","1px solid red");
		$("#register-mess").text("Số điện thoại không hợp lệ!");
		return;
	}else {
		for(let k in phone)
			if(k < '0' || k > '9'){
				$('#register-phone').css("border","1px solid red");
				$("#register-mess").text("Số điện thoại không hợp lệ!");
				return;
			}
		$('#register-phone').css("none");
	}
	
	let email = $('#register-email').val().trim();
	if(email == ''){
		$('#register-email').css("border","1px solid red");
		$("#register-mess").text("Vui lòng nhập email!");
		return;
	}else if(email.search('@') == -1 || email.search('.') == -1){
		$('#register-email').css("border","1px solid red");
		$("#register-mess").text("Email không hợp lệ!");
		return;
	}else $('#register-email').css("border","none");
	
	let address = $('#register-address').val().trim();
	if(address == ''){
		$('#register-address').css("border","1px solid red");
		$("#register-mess").text("Vui lòng nhập địa chỉ!");
		return;
	}
	
	let pass = $('#register-pass').val().trim();
	if(pass == ''){
		$('#register-pass').css("border","1px solid red");
		$("#register-mess").text("Vui lòng tạo mật khẩu!");
		return;
	}else if(pass.length < 6){
		$('#register-pass').css("border","1px solid red");
		$("#register-mess").text("Mật khẩu phải ít nhất 6 ký tự!");
		return;
	}else $('#register-pass').css("border","none");
	
	let repass = $('#re-pass').val().trim();
	if(repass == ''){
		$('#re-pass').css("border","1px solid red");
		$("#register-mess").text("Vui lòng xác nhận lại mật khẩu!");
		return;
	}else if(pass != repass){
		$('#re-pass').css("border","1px solid red");
		$("#register-mess").text("Mật khẩu xác nhận không khớp!");
		return;
	}else $('#re-pass').css("border","none");
	
	const data = $('#form-register').serialize();
	$.ajax({
        url: '/JTCBooks/Register',
        type: "POST",
        data: data,
		dataType: 'JSON',
        success: function (info) {
			if(info.mes > 1){
				window.location.replace("LoginRegister");
			}else if(info.mes == -2){
				$('#register-phone').css("border","1px solid red");
				$("#register-mess").text("Số điện thoại đã được đăng ký!");
			}else if(info.mes == -3){
				$('#register-email').css("border","1px solid red");
				$("#register-mess").text("Email đã được đăng ký!");
			}else{
				$("#register-mess").text("Đăng ký không thành công!");
			}
        }
    });
}