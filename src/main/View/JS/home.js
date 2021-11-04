$(document).ready(function(){
	$("#back-top").fadeOut();
	
	$(window).scroll(function(){
		if($(this).scrollTop()){
			$("#back-top").fadeIn();
		}else $("#back-top").fadeOut();
	});
	
	$('#back-top').click(function(){
		$('html, body').animate({scrollTop: 0}, 500);
	});
});

function activeMenu(){
    const menuItems = document.querySelectorAll('.nav-item');
    const menuLength = menuItems.length;
    for(let i = 0; i < menuLength; i++){
        menuItems[i].onclick = function(){
            let j = 0;
            while(j < menuLength){
               menuItems[j++].className = "nav-item"; 
            }
            menuItems[i].className = "nav-item active";
        }
    }
}

function searchByKey(input){
	let key = input.value.trim();
	
	$.ajax({
        url: '/JTCBooks/SearchControl',
        type: "POST",
        data: {
			"key": key
		},
        success: function (info) {
			document.getElementById("listBooks").innerHTML = info;
        }
    });
}

function searchByCategory(input){
	$.ajax({
        url: '/JTCBooks/SearchControl',
        type: "POST",
        data: {
			"category": input
		},
        success: function (info) {
			document.getElementById("listBooks").innerHTML = info;
			document.getElementById("search").value = "";
        }
    });
}

function seeMore(){
	const len = document.getElementsByClassName("bookItem").length;
	$.ajax({
        url: '/JTCBooks/seemore',
        type: "POST",
        data: {
			"len": len
		},
        success: function (info) {
			if(info == "")
				document.getElementById("btnSeeMore").className = "d-none";
			else document.getElementById("listBooks").innerHTML += info;
        }
    });
}