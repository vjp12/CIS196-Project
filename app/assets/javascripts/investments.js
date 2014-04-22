$(document).on("page:load", function(){
	$(".hide-btn").click(function(){
		if($(".dash-review").hasClass("hide")){
			$(".dash-review").removeClass("hide");
			$(".hide-btn").text("Hide stock quotes");
		} else {
			$(".dash-review").addClass("hide");
			$(".hide-btn").text("Show stock quotes");
		}
		return false;
	});
	return false;
});