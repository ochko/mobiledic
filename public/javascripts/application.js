$(document).ready(function() {
	$("#learn_detail_submit").attr("disabled", "disabled");
	$("input[@name='answer']").click(function() {
		$("#learn_detail_submit").removeAttr("disabled");

            });
    });
