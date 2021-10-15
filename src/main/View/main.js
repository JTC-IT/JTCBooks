$(document).ready(function(){
	var modal = document.getElementById('confirmClean');

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
})

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

function clearCart() {
	document.getElementById('confirmClean').style.display='none';
	$.ajax({
        url: '/JTCBooks/ChangeOrder',
        type: "POST",
        data: {
			"amount": "-1"
		},
        success: function (info) {
			const list = document.getElementById("cart-body").querySelectorAll(".cart-item");
			for(let i = 0; i < list.length; i++)
				list[i].remove();
			document.getElementById("alert-status").innerHTML = "Giỏ hàng trống !";
			document.getElementById("sumPay").innerHTML = info;
        }
    });
}

function changeAmount(select,id) {
	const amount = $(select).children("option:selected").val();
	$.ajax({
        url: '/JTCBooks/ChangeOrder',
        type: "POST",
        data: {
        	"id": id,
			"amount": amount
		},
        success: function (info) {
			const data = info.split(";");
			const item = select.parentElement.parentElement.parentElement.querySelector("#intoMoney");
			item.innerHTML = data[0];
			
			document.getElementById("sumPay").innerHTML = data[1];
        }
    });
}

function removeCartItem(btn,id) {
	$.ajax({
        url: '/JTCBooks/ChangeOrder',
        type: "POST",
        data: {
        	"id": id,
			"amount": "0"
		},
        success: function (info) {
			document.getElementById("cart-body").removeChild(btn.parentNode.parentNode);
			if(document.getElementsByClassName("cart-item").length == 0)
				document.getElementById("alert-status").innerHTML = "Giỏ hàng trống !";
			document.getElementById("sumPay").innerHTML = info;
        }
    });
}