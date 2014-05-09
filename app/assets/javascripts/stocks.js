

$(function(){
	$(".dash-review").addClass("hide");
	$(".dash-review2").addClass("hide");
	$(".dash-review3").addClass("hide");
	$(".dash-review4").addClass("hide");
	$(".hide-btn").click(function(){	
		if($(".dash-review").hasClass("hide")){
			$(".dash-review").removeClass("hide");
			$(".dash-review3").removeClass("hide");
			$(".hide-btn").text("Hide My Investments");
		} else {
			$(".dash-review").addClass("hide");
			$(".dash-review3").addClass("hide");
			$(".hide-btn").text("Show My Investments");
		}
	});
	$(".hide-btn2").click(function(){	
		if($(".dash-review2").hasClass("hide")){
			$(".dash-review2").removeClass("hide");
			$(".dash-review4").removeClass("hide");
			$(".hide-btn2").text("Hide Latest Investments");
		} else {
			$(".dash-review2").addClass("hide");
			$(".dash-review4").addClass("hide");
			$(".hide-btn2").text("Show Latest Investments");
		}
	});
});