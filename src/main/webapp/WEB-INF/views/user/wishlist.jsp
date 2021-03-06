<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    	<%@ include file="/WEB-INF/views/include/head.jsp" %>
    	<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Bitter:ital@0;1&family=The+Nautigal&display=swap" rel="stylesheet">
<script>
    $(document).ready(function(){

//장바구니에서 홀 삭제
<c:if test="${!empty wdRez.whCode}">
    	$("#delBtnWishH").on("click", function(){
    		if(confirm("정말 장바구니에서 해당 상품을 삭제하시겠습니까?"))
    		{
    			//ajax통신 시작
    			$.ajax({
				type:"POST",
				url:"/user/updateHproc",
				data:
				{
					rezNo: <c:out value="${wdRez.rezNo}" />
				},
				datatype:"JSON",
				beforeSend:function(xhr){
					xhr.setRequestHeader("AJAX", "true");
				},
				success:function(response){
					if(response.code == 0)
					{
						alert("장바구니에서 해당 상품을 제거했습니다.");
						//업데이트가 성공하면 해당 tr 삭제
		    			$("#wishH").remove();
		    			location.href = "/user/wishlist";
						
					}
					else
					{
						alert("게시물 삭제 중 오류가 발생했습니다.");
					}
				},
				complete:function(data){
					icia.common.log(data);
				},
				error:function(xhr, status, error)
				{
					icia.common.error(error);
				}
				});
    			//ajax통신 종료
    		}
		});
    	//삭제버튼 클릭 종료
</c:if>
//장바구니에서 홀 삭제

//장바구니에서 스튜디오 삭제
<c:if test="${!empty wdRez.sCode}">
    	$("#delBtnWishS").on("click", function(){
    		if(confirm("정말 장바구니에서 해당 상품을 삭제하시겠습니까?"))
    		{
    			//ajax통신 시작
    			$.ajax({
				type:"POST",
				url:"/user/updateSproc",
				data:
				{
					rezNo: <c:out value="${wdRez.rezNo}" />
				},
				datatype:"JSON",
				beforeSend:function(xhr){
					xhr.setRequestHeader("AJAX", "true");
				},
				success:function(response){
					if(response.code == 0)
					{
						alert("장바구니에서 해당 상품을 제거했습니다.");
						//업데이트가 성공하면 해당 tr 삭제
		    			$("#wishS").remove();
		    			location.href = "/user/wishlist";
					}
					else
					{
						alert("게시물 삭제 중 오류가 발생했습니다.");
					}
				},
				complete:function(data){
					icia.common.log(data);
				},
				error:function(xhr, status, error)
				{
					icia.common.error(error);
				}
				});
    			//ajax통신 종료
    		}
		});
    	//삭제버튼 클릭 종료
</c:if>
//장바구니에서 스튜디오 삭제 종료


//장바구니에서 드레스 삭제
<c:if test="${!empty wdRez.dNo}">
    	$("#delBtnWishD").on("click", function(){
    		if(confirm("정말 장바구니에서 해당 상품을 삭제하시겠습니까?"))
    		{
    			//ajax통신 시작
    			$.ajax({
				type:"POST",
				url:"/user/updateDproc",
				data:
				{
					rezNo: <c:out value="${wdRez.rezNo}" />
				},
				datatype:"JSON",
				beforeSend:function(xhr){
					xhr.setRequestHeader("AJAX", "true");
				},
				success:function(response){
					if(response.code == 0)
					{
						alert("장바구니에서 해당 상품을 제거했습니다.");
						//업데이트가 성공하면 해당 tr 삭제
		    			$("#wishD").remove();
		    			location.href = "/user/wishlist";
					}
					else
					{
						alert("게시물 삭제 중 오류가 발생했습니다.");
					}
				},
				complete:function(data){
					icia.common.log(data);
				},
				error:function(xhr, status, error)
				{
					icia.common.error(error);
				}
				});
    			//ajax통신 종료
    		}
		});
    	//삭제버튼 클릭 종료
</c:if>
//장바구니에서 드레스 삭제 종료

//장바구니에서 메이크업 삭제
<c:if test="${!empty wdRez.mCode}">
    	$("#delBtnWishM").on("click", function(){
    		if(confirm("정말 장바구니에서 해당 상품을 삭제하시겠습니까?"))
    		{
    			//ajax통신 시작
    			$.ajax({
				type:"POST",
				url:"/user/updateMproc",
				data:
				{
					rezNo: <c:out value="${wdRez.rezNo}" />
				},
				datatype:"JSON",
				beforeSend:function(xhr){
					xhr.setRequestHeader("AJAX", "true");
				},
				success:function(response){
					if(response.code == 0)
					{
						alert("장바구니에서 해당 상품을 제거했습니다.");
						//업데이트가 성공하면 해당 tr 삭제
		    			$("#wishM").remove();
						location.href = "/user/wishlist";
					}
					else
					{
						alert("게시물 삭제 중 오류가 발생했습니다.");
					}
				},
				complete:function(data){
					icia.common.log(data);
				},
				error:function(xhr, status, error)
				{
					icia.common.error(error);
				}
				});
    			//ajax통신 종료
    		}
		});
    	//삭제버튼 클릭 종료
</c:if>
//장바구니에서 메이크업 삭제 종료

$("#cou").on("click",function(){
    var option="width = 1000, height = 500, top = 100, left = 200, location = no, menubar = no, scrollbars=no";
    window.open("/board/Coupon", "PopUP", option); 
});    

    	
    });
    
    function fn_view1(whCode, hCode)
    {
   	document.rezForm.WHCode.value = whCode; 
       document.rezForm.HCode.value = hCode;
       document.rezForm.action = "/hsdm/HallView";  
       document.rezForm.submit();
    } 
    function fn_view2(sCode)
    {
    	document.rezForm.sCode.value = sCode; 
    	document.rezForm.action = "/hsdm/studioView";
    	document.rezForm.submit();
    }
    function fn_view3(dNo)
    {
    	document.rezForm.dNo.value = dNo;
    	document.rezForm.action = "/hsdm/dressView";
    	document.rezForm.submit();
    }
    function fn_view4(mCode)
    {
    	document.rezForm.mCode.value = mCode; 
    	document.rezForm.action = "/hsdm/makeupView";	
    	document.rezForm.submit();
    }
    
$(document).ready(function(){
	$("#payMent").on("click", function(){
		
		document.rezForm.action = "/user/payMent";
		document.rezForm.submit();
	});
});


</script>  
</head>
    
<body>
    <jsp:include page="/WEB-INF/views/include/navigation.jsp" >
    <jsp:param name="userName" value="${wdUser.userNickname}" />
    </jsp:include>
    
    <div class="page-heading-rent-venue2">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                </div>
            </div>
        </div>
    </div>
    
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12 bcline">
				
				<div class="row">
					<div class="col-lg-1">
					</div>
					<div class="col-lg-10">
						<h2 style="font-family: 'Bitter', serif; margin-top: 50px; padding-left: 10px;">My Page</h2>
						<nav class="bcItem">
							<ol class="breadcrumb bc" >
								<li class="breadcrumb-item active">
									<h5>장바구니</h5>
								</li>
								<li class="breadcrumb-item">
									<a href="/user/payList">결제내역</a>
								</li>
								<li class="breadcrumb-item">
									<a href="javascript:void(0)" id="cou">쿠폰보유현황</a>
								</li>
								<li class="breadcrumb-item">
									<a href="/user/modify">회원정보수정</a>
								</li>
							</ol>
						</nav>
					
					</div>
					<div class="col-lg-1">
					</div>
					
					<!-- 다음 라인 -->
					<div class="col-lg-1">
					
					</div>
					<!-- 경계선 및 내용 -->
					<div class="col-lg-10 lineListMypage">
					
						
                        <table class="table tableWish">
							<tr>
								<div class="rez_sta">
									<h5 class="rez_date">예약일자 &nbsp;&nbsp; <span>${wdRez.rezDate}</span></h5>
									<h5 class="rez_number">예약번호&nbsp;&nbsp; <span>${wdRez.rezNo}</span></h5>
								</div>
							</tr>
                            <tr style="border-top: 3px solid #444;">
                                <th>이미지</th>
                                <th>상품정보</th>
                                <th>참고사항</th>
                                <th>총가격</th>
                                <th>삭제</th>
                            </tr>
<c:if test="${!empty wdRez}">                           
                            <!-- 홀 -->
<c:if test="${!empty wdRez.whCode}">
                            
                            <tr id="wishH">
                                <td class="image-prod">
                                	<div class="imgbox" onclick="fn_view1('${wdRez.whCode}','${wdRez.hCode}')">
                                		<img src="../resources/images/hallrepimage/${wdRez.hImgName}" id="prod" class="wishImg">
                                	</div>
                                </td>
                                
                                <td class="product-name alignleft" style="width: 18%;">
						        	<p class="my_hall"><c:out value="${wdRez.whName}" /></p>
						        	<p><h4>&nbsp;<c:out value="${wdRez.hName}" /></h4></p>
						        	<!-- 주소 넣어야 할까유?? ㄴㄴㄴㄴ무쓸모 -->
						        </td>
                                
                                <td class="HpriceTd alignleft">
                                	<p class="Hpc">홀대관비&nbsp; <fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.hPrice *(1- wdRez.hDiscount*0.01)}" />원
                                	&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;식비&nbsp; <fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.hFood * wdRez.hMin}" />원</p>
                                	<p class="sangsaeP">
	                                	<span class="chamgo">
	                                		대관료할인: <span id="discountSpan">${wdRez.hDiscount}%</span> &nbsp;&nbsp;</span>
	                                		<span id="xPrice"><fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.hPrice}" />원 </span>&nbsp;&nbsp;
	                                		<span id="nPrice"><fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.hPrice *(1- wdRez.hDiscount*0.01)}" />원</span>
	                                	
                                	</p>	
                                	<p class="sangsaeP">
	                                	<span class="chamgo">	                               		
	                                		1인당 식비: <fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.hFood}" />원 x ${wdRez.hMin}명 = <fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.hFood * wdRez.hMin}" />원
	                                	</span>
                                	</p>
                                </td>
                                

                                <td class="HpriceTotal" id="hollprice">
                                	<h4>
                                		<fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.hPrice *(1- wdRez.hDiscount*0.01) + (wdRez.hFood * wdRez.hMin)}" />원
                                	</h4>
                                </td>
                                
                                <td style="width: 5%;">
                                    <input type="button" value="x" class="w-btn-red delBtnWish" id="delBtnWishH">
                                </td>
                            </tr>
</c:if>
                            <!-- 스 -->
<c:if test="${!empty wdRez.sCode}">
                         
                            <tr id="wishS">
                                <td class="image-prod">
                                	<div class="imgbox"  onclick="fn_view2('${wdRez.sCode}')">
                                		<img src="../resources/images/studio/${wdRez.sImgName}" id="prod" class="wishImg">
                                	</div>
                                </td>
                                
                                <td class="product-name alignleft">
						        	<p><h4>&nbsp;<c:out value="${wdRez.sName}" /></h4></p>
						        	<!-- 주소 넣어야 할까유?? ㄴㄴ필요없을듯-->
						        </td>
                                
                                <td class="HpriceTd alignleft">
                                	<p class="Spc">스튜디오 예약일자 &nbsp<span style="font-weight:700; color: #333;"><c:out value="${wdRez.sDate}"/></span></p>
                                	<p class="sangsaeP">
	                                	<span class="chamgo">
	                                		할인: <span id="discountSpan">${wdRez.sDiscount}%</span> &nbsp;&nbsp;</span>
	                                		<span id="xPrice"><fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.sPrice}" />원 </span>&nbsp;&nbsp;
	                                		<span id="nPrice"><fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.sPrice *(1- wdRez.sDiscount*0.01)}" />원</span>
	                                	
                                	</p>
                                	<p><span class="chamgo">
                                		예약일 변경 시 스튜디오와 직접 상의하시면 더 빠르게 처리가 가능합니다.
                                	</span></p>
                                </td>
                                
                                <td class="HpriceTotal" style="width: 18%;">
                                	<h4>
                                		<fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.sPrice *(1- wdRez.sDiscount*0.01)}" />원
                                	</h4>
                                </td>
                                
                                <td>
                                    <input type="button" value="x" class="w-btn-red delBtnWish" id="delBtnWishS">
                                </td>
                            </tr>
</c:if>

                            <!-- 드 -->
<c:if test="${!empty wdRez.dNo}">
                            <tr id="wishD">
                                <td class="image-prod">
                                	<div class="imgbox" onclick="fn_view3('${wdRez.dNo}')">
                                		<img src="../resources/images/dress/${wdRez.dImgName}" id="prod" class="wishImg">
                                	</div>
                                </td>
                                
                                <td class="product-name alignleft">
                                	<p class="my_hall"><c:out value="${wdRez.dcName}" /></p>
						        	<p><h4>&nbsp;<c:out value="${wdRez.dName}" /></h4></p>
						        	<!-- 주소 넣어야 할까유?? -->
						        </td>
                                
                                <td class="HpriceTd alignleft">
                                	<p class="Dpc Hpc"><c:out value="${wdRez.dContent}" /></p>
                                	                                	<p class="sangsaeP">
	                                <span class="chamgo">
                                		할인: <span id="discountSpan">${wdRez.dDiscount}%</span> &nbsp;&nbsp;</span>
                                		<span id="xPrice"><fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.dPrice}" />원 </span>&nbsp;&nbsp;
                                		<span id="nPrice"><fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.dPrice *(1- wdRez.dDiscount*0.01)}" />원</span>	
                                	</p>
                                	<p><span class="chamgo">
                                	</span></p>
                                </td>
                                
                                <td class="HpriceTotal">
                                	<h4>
                                		<fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.dPrice *(1- wdRez.dDiscount*0.01)}" />원
                                	</h4>
                                </td>
                                
                                <td>
                                    <input type="button" value="x" class="w-btn-red delBtnWish" id="delBtnWishD">
                                </td>
                            </tr>
</c:if>

                            <!-- 메 -->
<c:if test="${!empty wdRez.mCode}">
                            <tr id="wishM">
                                <td class="image-prod">
                                	<div class="imgbox"  onclick="fn_view4('${wdRez.mCode}')">
                                		<img src="../resources/images/makeup/${wdRez.mImgName}" id="prod" class="wishImg">
                                	</div>
                                </td>
                                
                                <td class="product-name alignleft">
						        	<p><h4>&nbsp;<c:out value="${wdRez.mName}" /></h4></p>
						        	<!-- 주소 넣어야 할까유?? -->
						        </td>
                                
                                <td class="HpriceTd alignleft">
                                	<p class="Hpc">비용&nbsp; <fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.mPrice *(1- wdRez.mDiscount*0.01)}" />원
<c:if test="${!empty wdRez.mPlusNum}"> 
                                	&nbsp;&nbsp;/&nbsp;&nbsp; 추가비용&nbsp; <fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.mPlus * wdRez.mPlusNum}" />원</p>
</c:if>                                	
                                	<p class="sangsaeP">
	                                	<span class="chamgo">
	                                		할인: <span id="discountSpan">${wdRez.mDiscount}% &nbsp;&nbsp;</span></span>
	                                		<span id="xPrice"><fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.mPrice}" />원 </span>&nbsp;&nbsp;
	                                		<span id="nPrice"><fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.mPrice *(1- wdRez.mDiscount*0.01)}" />원</span>
	                                	
                                	</p>	
<c:if test="${!empty wdRez.mPlusNum}"> 
                                	<p class="sangsaeP">
	                                	<span class="chamgo">	                               		
	                                		추가비용: <fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.mPlus}" />원 x ${wdRez.mPlusNum}명 = <fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.mPlus * wdRez.mPlusNum}" />원
	                                	</span>
                                	</p>
</c:if>
                                </td>
                                
                                <td class="HpriceTotal">
                                	<h4>
                                		<fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.mPrice *(1- wdRez.mDiscount*0.01)+ (wdRez.mPlus*wdRez.mPlusNum)}" />원
                                	</h4>
                                </td>
                                
                                <td>
                                    <input type="button" value="x" class="w-btn-red delBtnWish" id="delBtnWishM">
                                </td>
                            </tr>
</c:if>
</c:if>
                        </table>
<c:if test="${empty wdRez}">
						
							<div style="text-align: center;">
								장바구니에 담긴 상품이 없습니다.
							</div>
						
</c:if>

					
					</div>
					<!-- 경계선 종료 -->

					<div class="col-lg-1"></div>
				
					<div class="col-lg-1"></div>
					<div class="col-lg-10">
<c:if test="${!empty wdRez.whCode or !empty wdRez.sCode or !empty wdRez.dNo or !empty wdRez.mCode or !empty wdRez.mPlusNum}">
						<div class="rez_sum">
							<dl class="sumbox1">
								<dt class="sumsec">총상품금액</dt>
								<dd class="sumpay1" id="preP">
									<fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.hPrice + (wdRez.hFood * wdRez.hMin) + wdRez.sPrice + wdRez.dPrice + wdRez.mPrice + (wdRez.mPlus*wdRez.mPlusNum)}" />원
								</dd>
							</dl>
							
							<dl class="sumbox3">
								<dt class="pam">-</dt>
							</dl>
							
							<dl class="sumbox1">
								<dt class="sumsec">예상할인금액</dt>

								<dd class="sumpay2" id="saleP"><fmt:formatNumber type="number" maxFractionDigits="0" value="${wdRez.hPrice - (wdRez.hPrice *(1- wdRez.hDiscount*0.01)) + wdRez.sPrice - (wdRez.sPrice *(1- wdRez.sDiscount*0.01)) + wdRez.dPrice - (wdRez.dPrice *(1- wdRez.dDiscount*0.01)) + wdRez.mPrice - (wdRez.mPrice *(1- wdRez.mDiscount*0.01))}" />원</dd>

							</dl>
							
							<dl class="sumbox3">
								<dt class="pam">=</dt>
							</dl>
							
							<div class="sumbox2">
								<h5>총 주문금액 

									<span id="aftP">
										<fmt:formatNumber type="number" maxFractionDigits="0" 
										value="${wdRez.hPrice *(1- wdRez.hDiscount*0.01) + (wdRez.hFood * wdRez.hMin) + wdRez.sPrice *(1- wdRez.sDiscount*0.01) + wdRez.dPrice *(1- wdRez.dDiscount*0.01) + wdRez.mPrice *(1- wdRez.mDiscount*0.01)+ (wdRez.mPlus*wdRez.mPlusNum)}" />원
									</span>
								</h5>
							</div>
							<!-- 총 주문금액 변수 i에 넣어서  totalAmount 에 넣어주기-->
							<fmt:parseNumber var="i" type="number" value="${wdRez.hPrice *(1- wdRez.hDiscount*0.01) + (wdRez.hFood * wdRez.hMin) + wdRez.sPrice *(1- wdRez.sDiscount*0.01) + wdRez.dPrice *(1- wdRez.dDiscount*0.01) + wdRez.mPrice *(1- wdRez.mDiscount*0.01)+ (wdRez.mPlus*wdRez.mPlusNum)}" />
							<!-- 카카오 페이 버튼 추가 -->
							<button type="button" id="payMent" style="border: solid 1px black; background:white; position:relative; top:-18px; color:black;" class="btn btn-primary" title="결제페이지로 이동">결제페이지로 이동</button>
						</div>
</c:if>
					</div>
					<div class="col-lg-1"></div>
				
				</div>
			</div>			
		</div>
	</div>	


<form name="rezForm" id="rezForm" method="post">
	  <input type="hidden" name="WHCode" value="" /> 
      <input type="hidden" name="HCode" value="" /> 
      <input type="hidden" name="sCode" value="" />
      <input type="hidden" name="dNo" value="" />
      <input type="hidden" name="mCode" value="" /> 
</form>
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
  </body>

</html>
