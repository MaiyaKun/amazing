// 글 등록 제목 글자수 카운트
$(document).ready(function() {
	var story = $('#title').html();
	$('#titleCount').html(getBytes(story) + ' 자 / 36 자');
});

$(document).on('keyup', '#title', function(e) {
	var story = $(this).val();
	$('#titleCount').text(getBytes(story) + ' 자 / 36 자');
});

// 글 등록 내용 글자수 체크
$(document).ready(function() {
	var story = $('#story').html();
	$('#storyCount').html(getBytes(story) + ' 자 / 1332 자');
});

$(document).on('keyup', '#story', function(e) {
	var story = $(this).val();
	$('#storyCount').text(getBytes(story) + ' 자 / 1332 자');
});

// 유저+관리자 본인 글 수정 글자수 체크
$(document).ready(function() {
	var story = $('#userUpdateStory').html();
	$('#userUpdateCount').html(getBytes(story) + ' 자 / 1332 자');
});

$(document).on('keyup', '#userUpdateStory', function(e) {
	var story = $(this).val();
	$('#userUpdateCount').text(getBytes(story) + ' 자 / 1332 자');
});

// 유저+관리자 본인 글 제목 수정 글자수 체크
$(document).ready(function() {
	var story = $('#updateTitle').html();
	$('#updateTitleCount').html(getBytes(story) + ' 자 / 36 자');
});

$(document).on('keyup', '#updateTitle', function(e) {
	var story = $(this).val();
	$('#updateTitleCount').text(getBytes(story) + ' 자 / 36 자');
});

// 관리자 남의 글 수정 글자수 체크
$(document).ready(function() {
	var story = $('#managerUpdateStory').html();
	$('#managerUpdateCount').html(getBytes(story) + ' 자 / 1332 자');
});

$(document).on('keyup', '#managerUpdateStory', function(e) {
	var story = $(this).val();
	$('#managerUpdateCount').text(getBytes(story) + ' 자 / 1332 자');
});

// 관리자 남의 글 수정 제목 글자수 체크
$(document).ready(function() {
	var story = $('#managerTitle').html();
	$('#managerTitleCount').html(getBytes(story) + ' 자 / 36 자');
});

$(document).on('keyup', '#managerTitle', function(e) {
	var story = $(this).val();
	$('#managerTitleCount').text(getBytes(story) + ' 자 / 36 자');
});

// 댓글 글자수 카운트
$(document).ready(function() {
	var story = $('#commStory').html();
	$('#commCount').html(getBytes(story) + ' 자 / 200 자');
});

$(document).on('keyup', '#commStory', function(e) {
	var story = $(this).val();
	$('#commCount').text(getBytes(story) + ' 자 / 200 자');
});

/**
 * 한글3바이트 영어,숫자 1바이트 계산 함수
 */
function getBytes(str) {
	var cnt = 0;
	for (var i = 0; i < str.length; i++) {
		cnt += (str.charCodeAt(i) > 128) ? 1 : 1;
	}
	return cnt;
}
