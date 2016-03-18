
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






