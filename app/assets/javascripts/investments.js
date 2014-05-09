$(function(){
	$(".hide-btn3").click(function(){	
		if($(".dash-review5").hasClass("hide")){
			$(".dash-review5").removeClass("hide");
			$(".hide-btn3").text("Hide stock quote");
		} else {
			$(".dash-review5").addClass("hide");
			$(".hide-btn3").text("Show stock quote");
		}
	});
});	