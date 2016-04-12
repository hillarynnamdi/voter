
$(document).on('keyup','#search',function(){
var trimming=$(this).val().trimLeft().toUpperCase()
$(this).val(trimming)
		$(".render-ajax").html("<div style='margin:auto,width:60%;text-align:center;padding:20px;color:black'>Loading...</div>")
		$(this).parent().submit();
	}
	)
	



$(document).on('click','.pagination a', 
function(){

$.get(this.href,null,null,"script")

return false

}
)	

$(document).on('click','.wrapper table a', 
function(){

$(".loading").show()

}
)

$(document).on('click','.new a', 
function(){

$(".loading").show()

}
)



$(document).on('click','#submit_bts', 
function(){

$(".loading").show()

}
)

$(document).on('click','#sms_head', 
function(){

$(".sms_metrics").show()

$(this).hide()
return false;

}
)

$(document).on('click','#hide_metrics', 
function(){

$(".sms_metrics").hide()

$("#sms_head").show()

return false;

}
)

$(document).on('click','#reset_bt', 
function(){

$(':radio').attr({checked:false})

return false;

}
)

$(document).on('click','#reset_bt2', 
function(){

$('.check_uncheck :radio').attr({checked:false})

return false;

}
)


$(document).on('click','.pass_key', 
function(){

var confirm=prompt("Enter Admin Password")
if(confirm=="12345"){
alert($('#pass_key_value').val())
}
else{
	alert("failed,try again!")
}

return false;

}
)







