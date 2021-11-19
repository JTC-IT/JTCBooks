$(document).ready(function(){
	$("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });
        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
	
	$("#mytable .checkthis").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable #checkall").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
    
    
    $("[data-toggle=tooltip]").tooltip();
});


function selectedBook(id) {
	$("#removeBook").attr("href", "RemoveBook?id=" + id)
}

function searchByKey(input){
	let key = input.value.trim();
	
	$.ajax({
        url: '/JTCBooks/SearchBooks',
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
        url: '/JTCBooks/SearchBooks',
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