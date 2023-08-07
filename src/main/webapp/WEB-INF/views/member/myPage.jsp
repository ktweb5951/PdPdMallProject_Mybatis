<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

    <head>
    	<jsp:include page="/WEB-INF/views/common/asideHead.jsp"></jsp:include>
        <title>마이 페이지</title>
    </head>

    <body>
        <div id="container">
            <header>
            	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
            </header>
            <main>
                <aside>
                    <h1>마이페이지</h1>
                    <ul class="myPage">
                        <li><a href="/member/list.do?member-id=${memberId})">프로필</a></li>
                        <li><a href="#" onclick="loadPage('거래내역.html')">거래내역</a></li>
                        <li><a href="/member/update.do?member-id=${memberId}">회원정보수정</a></li>
                        <li><a href="/member/withdraw.do?member-id=${memberId}">회원탈퇴</a></li>
                    </ul>
                </aside>
                <section id="main-content" style="display: flex;">
		            <div class="member-form">
		                <div class="top">
		                    <img src="../../resources/images/components/logoimage2.png" alt="">
		                    <h2>회원 정보 수정</h2>
		                </div>
		                <form action="/member/update.do" method="post" id="memberForm">
		                    <ul>
		                        <li>
		                            <label>아이디</label>
		                            <div>
		                                <input type="text" id="member-id" name="member-id" value="${member.memberId}" readonly>
		                            </div>
		                        </li>
		                        <li>
		                            <label>이름</label><input type="text" id="member-name" name="member-name" value="${member.memberName}" readonly >
		                        </li>
		                        <li>
		                            <label>닉네임</label>
		                            <div>
		                                <input type="text" id="member-nickname" name="member-nickname" value="${member.memberNickname}">
		                            </div>
		                        </li>
		                        <li>
		                            <label>핸드폰번호</label>
		                            <div>
		                                <input type="text" id="member-phone" name="member-phone" value="${member.memberPhone}">
		                                <button class="certifiedBtn">인증받기</button>
		                            </div>                                 
		                            <div>
		                                <input type="text" id="tel-certified" placeholder="인증번호를 입력하세요">
		                            </div>
		                        </li>
		                        <li>
		                            <label>주소</label>
		                            <div>
		                                <input type="text" id="addr" name="member-address" value="${member.memberAddress}">
		                                <button onclick="addrSearch();">주소검색</button>
		                            </div>
		                        </li>
		                        <li>
		                            <label>우편번호</label>
		                            <div>
		                                <input type="text" size="5" id="post-1" name="post-1" vlaue="${member.postalCodeOne}"> - <input type="text" size="5" id="post-2" name="post-2" vlaue="${member.postalCodeTwo}"> 
		                            </div>
		                        </li>
		                        <li>
		                            <label>이메일</label><input type="text" id="member-email" name="member-email" value="${member.memberEmail}">
		                        </li>
		                    </ul>
		                    <span id="message" class="message"></span>
		                    <div class="form-btn">
		                    </div>
		                </form>
		            </div>
	             </section>

            </main>
            <footer>
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
            </footer>
        </div>


    </body>

</html>