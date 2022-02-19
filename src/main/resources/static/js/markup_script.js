$(document).ready(function() {
		
	// area 클래스를 가진 input 태그를 제외한 부분을 클릭하면 이벤트 발 	
	$('html').on('click', function(e) {
		if (!$(e.target).hasClass('area')) {
			
		};
	});
	
	// email에 key가 입력되면 check 클래스를 추가하고
	// email이 비었다면 cross 클래스 추가
	$('#email').keyup(function() {
		$('#email').removeClass('cross');
		$('#email').addClass('check');
				
		if ($('#email').val() == '') {
			$('#email').removeClass('check');
			$('#email').addClass('cross');
			return;
		}
		
		// 이메일의 도메인 주소에서 . 뒤에 두글자 이상이면 check 클래스 추가
		if ($('#email').val().split('@')[1].split('.')[1].length < 2) {
			$('#email').removeClass('check');
			$('#email').addClass('cross');
			return;
		}
	});
	
	// name에 key가 입력되면 check 클래스를 추가하고
	// name이 비었다면 cross 클래스 추가
	$('#name').keyup(function() {
		$('#name').addClass('check');
		
		if ($('#name').val() == '') {
			$('#name').removeClass('check');
			return;
		}
	});
	
	// id에 key가 입력되면 check 클래스를 추가하고
	// id가 비었다면 cross 클래스 추가
	$('#id').keyup(function() {
		$('#id').removeClass('cross');
		$('#id').addClass('check');
		
		if ($('#id').val() == '') {
			$('#id').removeClass('check');
			$('#id').addClass('cross');
			return;
		}
	});
	
	// password에 key가 입력되면 check 클래스를 추가하고
	// password가 비었다면 cross 클래스 추가
	$('#password').keyup(function() {
		$('#password').addClass('check');
		
		if ($('#password').val() == '') {
			$('#password').removeClass('check');
			return;
		}
	});
	
	
	
});