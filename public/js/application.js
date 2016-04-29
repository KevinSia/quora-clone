$(document).ready(function(){

	$("form[id^=question_upvote]").on("submit", function(event){
		event.preventDefault();
		$.ajax({
			url: $(this).attr('action'),
			dataType: 'json',
			type: 'POST',
			success: function(data){
				$('input#upvote_' + data.q_id).val(data.upvotes);
				$('input#downvote_' + data.q_id).val(data.downvotes);
			}
		})
	});

	$("form[id^=question_downvote]").on("submit", function(event){
		event.preventDefault();
		$.ajax({
			url:  $(this).attr('action'),
			dataType: 'json',
			type: 'POST',
			success: function(data){
				$('input#upvote_' + data.q_id).val(data.upvotes);
				$('input#downvote_' + data.q_id).val(data.downvotes);
			}
		})
	});


});