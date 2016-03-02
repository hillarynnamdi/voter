$(document).ready(
function(){
$("#hide_subscription").click(
function(){
$("#subscription_account_name").focus();
	var txt=$("#hide_subscription").val();
		if(txt=="New Subscription"){

		$("#hide_subscription").val("Hide Subscription")

		$("#hide_subscription").removeClass("btn btn-primary")
		$("#hide_subscription").addClass("btn btn-warning")

		}
		else{
		$("#hide_subscription").val("New Subscription")
		$("#hide_subscription").removeClass("btn btn-warning")
		$("#hide_subscription").addClass("btn btn-primary")
		

		}

}
	)
	})



$(document).ready(
function(){
$("#sub_bt").click(
function(){
	$("#sub_bt").val("Creating...")
}
	)
}
	)

$(document).ready(
function(){
$("#close").click(

	function(){
$("error-div").hide();

	})
}
)



$(document).ready(
function(){
$(".pagination a").click(
function(){

$.get(this.href,null,null,"script")

return false;

}
	)
}
)
