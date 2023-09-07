


// 1. todo 리스트 추가 (체크박스)
// HTML문서의 모든 요소가 메모리에 로드된 후에 이 안의 코드가 실행됨.

$(document).ready(function() { 
    $('#item-plus-btn').click(addItem); //"일정 추가" 버튼을 클릭했을 때만 addItem 함수가 실행됨.
    // 만일 $('#item-plus-btn').click(addItem()); 였다면 즉시 함수가 실행될 것임.
    $('input[type=text]').keypress(function(e) { // 키가 누르는 동작 감지 함수
        if (e.which == 13) { // 아스키코드로 13은 Enter이다.
            addItem();
            return false; //일반적으로 HTML 폼에서 Enter 키를 누르면 해당 폼이 제출되고
            // 페이지가 새로고침 되는데, 이를 방지하기 위해 리턴을 false로 한다.
        }
    });

    function addItem() {
        var inputValue = $('input[type=text]').val();
        var listItem = '<li><input type ="checkbox"><label>' + inputValue + '</label><button class="delete">삭제</button></li>';
        if(inputValue != ""){
			$('#todo-items').append(listItem);
			$('input[type=text]').val("");
		}
    }


	// 2. todo 리스트 삭제

	$('#todo-items').on('click', '.delete', function() {
		// this 이므로 버튼을 클릭한 .delete 클래스의 parent() 부모인 가장 가까운<li> 가 삭제됨.
		$(this).parent().remove();
	});

});




// 3. 