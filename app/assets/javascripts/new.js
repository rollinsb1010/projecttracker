$(document).ready(function() {
	$('.project_name').focus(function() {
		$(this).css('background-color','#0ABBCC');
	});
	
	$('#datepicker').click(function() {
		$('#datepicker').datepicker('show');
	});
		});
