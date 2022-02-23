<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section class="content d-flex justify-content-between container">
	<div class="timeline-box">
		<div class="post">
			<div class="post-header">
				<div class="profile-img-box">
					<img alt="profile" src="/images/profile-img1.jpeg" class="profile-img">
				</div>
				<div>포스팅한 사용자 아이디</div>
			</div>
			<div class="image">
				<img alt="post-img" src="/images/post-img1.jpeg" class="image">
			</div>
			<div class="post-icon-box d-flex justify-content-between">
				<div class="col-4 p-0">
					<img src="/images/like-black.png" class="post-icon-like">
					<img src="/images/comment.png" class="post-icon">
				</div>
				<div class="col-4 p-0 d-flex justify-content-center">
					<%-- 이미지 개수에 따라 버튼개수 가감 --%>
					<div class="img-list-btn"></div>
				</div>
				<div class="col-4 p-0 d-flex justify-content-end">
					<img src="/images/bookmark.png" class="post-icon">
				</div>
			</div>
			<div>
				<div>좋아요 14,221개</div>
				<div>
					<div>사용자 이름(loginId)</div>				
					<div>내용</div>
					<%-- 내용이 n자 이상이면 내용을 숨기고 더보기 버튼 표시 --%>
					<div>더보기</div>
				</div>
			</div>
			<div class="post-comment">
				<div class="post-comment">
					<%-- 댓글이 1개 이상이면 나머지 댓글을 숨기고 댓글 n개 모두보기 버튼 표시 --%>
					<div>댓글 n개 모두 보기</div>
					<div>
						<div>댓글 단 사용자 이름(loginId)</div>
						<div>댓글 내용</div>
					</div>
					<div>n시간 전</div>
				</div>
			</div>
		</div>
	</div>
	<div class="side-box bg-warning">
		<div class="profile bg-danger"></div>
		<div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</section>
