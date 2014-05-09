$(function(){
	$(".dash-review").addClass("hide");
	$(".dash-review2").addClass("hide");
	$(".dash-review3").addClass("hide");
	$(".dash-review4").addClass("hide");
	$(".hide-btn").click(function(){
		if($(".dash-review").hasClass("hide")){
			$(".dash-review").removeClass("hide");
			$(".dash-review3").removeClass("hide");
			$(".hide-btn").text("Hide my investments");
		} else {
			$(".dash-review").addClass("hide");
			$(".dash-review3").addClass("hide");
			$(".hide-btn").text("Show my investments");
		}
	});
	$(".hide-btn2").click(function(){	
		if($(".dash-review2").hasClass("hide")){
			$(".dash-review2").removeClass("hide");
			$(".dash-review4").removeClass("hide");
			$(".hide-btn2").text("Hide latest investments");
		} else {
			$(".dash-review2").addClass("hide");
			$(".dash-review4").addClass("hide");
			$(".hide-btn2").text("Show latest investments");
		}
	});
});