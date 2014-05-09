$(function(){
	$(".dash-review").addClass("hide");
	$(".dash-review2").addClass("hide");
	$(".hide-btn").click(function(){
		if($(".dash-review").hasClass("hide")){
			$(".dash-review").removeClass("hide");
			$(".hide-btn").text("Hide my investments");
		} else {
			$(".dash-review").addClass("hide");
			$(".hide-btn").text("Show my investments");
		}
	});
	$(".hide-btn2").click(function(){	
		if($(".dash-review2").hasClass("hide")){
			$(".dash-review2").removeClass("hide");
			$(".hide-btn2").text("Hide latest investments");
		} else {
			$(".dash-review2").addClass("hide");
			$(".hide-btn2").text("Show latest investments");
		}
	});
});