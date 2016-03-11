$(document).ready(
function(){
	$("#search").focus()
	$("#search").keyup(function(){
var trimming=$(this).val().trimLeft().toUpperCase()
$(this).val(trimming)
		
		$(this).parent().submit();
	}
	)
}
	)




$(document).on('click','.pagination a', 
function(){

$.get(this.href,null,null,"script")

return false

}
)	







