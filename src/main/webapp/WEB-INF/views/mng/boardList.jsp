<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head2.jsp" %>
<style>
*, ::after, ::before {
   box-sizing: unset;
}
.table-hover th, td{
   border: 1px solid #c4c2c2;
   text-align: center;
}

.sel{
   background: #f5a4aa;
}
.wookhall{
   width: 120px;
}



/*다크모드관련*/
.btn-toggle
{
	background: none;
    position: absolute;
    top: 28px;
    left: 79%;
    border: none;
    outline: none;
    color: #ccc;
    font-size: 13px;
    text-decoration: underline;
}

button:focus
{
	outline: none;
}
.btn-toggle:active
{
	outline: none!important;
}
/*다크모드 */
body {  color: #efefef; background: #121212;} 
a { color: #809fff; } 
td,th {color: #eee;}
span {color: #efefef;}
p{color: #efefef;}
.page-link
{
	background: #555!important;
    border: none;
}
/* Dark Mode 아닐떄 */ 
body.dark-theme { color: #222; background: #fff; } 
body.dark-theme a { }
body.dark-theme td,th {color: #333;}
body.dark-theme .page-link.active
{
	    background: #f5a4aa!important;
}
</style>
<script>
	var frCheck = <c:out value="${frCheck}" />
	
	$(function(){
	    
	      $(".FboardUpdate").colorbox({
	            iframe:true, 
	            innerWidth:1235,
	            innerHeight:500,
	            scrolling:false,
	            onComplete:function()
	            {
	               $("#colorbox").css("width", "1235px");
	               $("#colorbox").css("height", "500px");
	               $("#colorbox").css("border-radius", "10px");
	               
	               $('html').css("overflow","hidden");
	            } , 
	            onClosed: function()
		          {
		            $('html').css("overflow","auto");
		          }  
	      });
		
		//다크모드
	    const btn = document.querySelector('.btn-toggle');
	    btn.addEventListener('click', function() {
	    	document.body.classList.toggle('dark-theme'); 
	    	});
		//다크모드 끝
	     
		if(frCheck == 1){
	         document.getElementById('id1').classList.remove('sel');
	         document.getElementById('id2').classList.remove('sel');
	         document.getElementById('id${frCheck}').className += ' sel';  
	        
	         $("#fboard").show();
	         $("#review").hide();
	      }
	     else if(frCheck == 2){
	         document.getElementById('id1').classList.remove('sel');
	         document.getElementById('id2').classList.remove('sel');
	         document.getElementById('id${frCheck}').className += ' sel';  
	        
	         $("#review").show();
	         $("#fboard").hide();
	      }
		
		
		
	});    

	
	function fn_pagingF(curPage)
	{
	   document.bbsFormF.curPage.value = curPage; //매개변수로 받은 현재페이지를 가져옴
	   document.bbsFormF.action = "/mng/boardList";
	   document.bbsFormF.submit();
	}
</script>
<meta charset="UTF-8">
<title>게시판 관리</title>
</head>
<body id="school_list" class="light-theme || dark-theme">
	<jsp:include page="/WEB-INF/views/include/adminNav.jsp" >
	<jsp:param name="userName" value="${wdAdmin.admName}" />
	</jsp:include>
	
<div>
<button class="btn-toggle">다크모드</button>
</div>

<div class="container">
    <div class="row" style="width: 100%;">
    	<div class="col-lg-12" style="width:100%; height:20px;"></div>
    	 <!-- /////////////////////////////////////////// --> 
      <div class="col-lg-12">
         <div class="hsdm_nav">
                <ul class="hsdm_menu">
                    <li class="hsem_li sel" id="id1" onclick="classChange(this)"><a class="hsem_a" href="javascript:void(0)">자유게시판</a></li>
                    <li class="hsem_li" id="id2" onclick="classChange(this)"><a class="hsem_a" href="javascript:void(0)">리뷰게시판</a></li>
                </ul>              
         </div>
      </div>
      
	  <!-- 자유게시판 시작 -->
      <div class="col-lg-12" width="100%">
      <div id="fboard">
         <ul>
            <li class="wdhth">
               <div class="wdhtitle" style="width:9%;"><p>게시물번호</p></div><!-- bSeq -->
               <div class="wdhtitle" style="width:9%;"><p>아이디</p></div><!-- userId -->
               <div class="wdhtitle" style="width:32%;"><p>제목</p></div><!-- bTitle -->
               <div class="wdhtitle" style="width:33%;"><p>내용</p></div><!-- bContent -->
               <div class="wdhtitle" style="width:8%;"><p>조회수</p></div><!-- bReadCnt -->
               <div class="wdhtitle" style="width:8%;"><p>등록일</p></div><!-- regDate -->
            </li>
            <c:forEach var="fList" items="${fList}" varStatus="status">
            <li class="wdhtd">
               <div class="wdhcon" style="width:9%;"><p>${fList.bSeq}</p></div>
               <div class="wdhcon" style="width:9%;"><p>${fList.userId}</p></div>
               <a href="/mng/mngFboardUpdate?bSeq=${fList.bSeq}" name="FboardUpdate" class="FboardUpdate">
               	<div class="wdhcon" style="width:32%; border-right: 1px solid #dedede;"><p style="font-weight: bold;">${fList.bTitle}</p></div>
               </a>
               <div class="wdhcon" style="width:33%;"><p>${fList.bContent}</p></div>
               <div class="wdhcon" style="width:8%;"><p>${fList.bReadCnt}</p></div>
               <div class="wdhcon" style="width:8%;"><p>${fList.regDate}</p></div>
            </li>
            </c:forEach>
         </ul>

         <div class="row">
              <div class="col-lg-10" style="left:43%;">
                <div class="pagination">
               <ul class="pagination justify-content-center">
                  <c:if test="${!empty fPaging}">
                     <c:if test="${fPaging.prevBlockPage gt 0}">   <!-- prevBlockPage이 0 보다 크냐 -->
                     <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_pagingF(${fPaging.prevBlockPage})">이전</a></li>
                     </c:if>
                     <c:forEach var="i" begin="${fPaging.startPage}" end="${fPaging.endPage}">
                        <c:choose>
                           <c:when test="${i ne curPage}">
                              <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_pagingF(${i})">${i}</a></li>
                           </c:when>
                           <c:otherwise>
                              <li class="page-item active"><a class="page-link" href="javascript:void(0)" style="cursor:default">${i}</a></li>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
                     <c:if test="${fPaging.nextBlockPage gt 0}">         
                        <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_pagingF(${fPaging.nextBlockPage})">다음</a></li>
                     </c:if>       
                  </c:if> 
                     <form name="bbsFormF" id="bbsFormF" method="post">
                        <input type="hidden" name="frCheck" value="1" />
                  <input type="hidden" name="curPage" value="${curPage}" />
               </form>
               </ul>
                  </div>
              </div>
            <div class="col-lg-1">
               <!--div>
                    <div class="ticket-item2 gosu_modal" href="/mng/plusStudio">
                        <div class="down-content2">
                            <div class="main-dark-button btn_go wookhall">
                                <a href="/mng/plusStudio" class="studio_modal" >스튜디오 추가</a>
                            </div>    
                         </div>
                    </div>
               </div-->
            </div>
           </div>
         </div>
      </div>
      <!-- 자유게시판 끝 -->    	
    	
    	
    </div>
</div>


   <%@ include file="/WEB-INF/views/include/footer3.jsp" %>
</body>
</html>