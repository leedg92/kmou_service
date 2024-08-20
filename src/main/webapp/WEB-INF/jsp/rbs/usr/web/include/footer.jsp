<c:if test="${!empty loginVO.memberId && (crtMenu.menu_idx != '1' && crtMenu.menu_idx != '39' && crtMenu.menu_idx != '42' && crtMenu.menu_idx != '40' && crtMenu.menu_idx != '41' && crtMenu.menu_idx != '67' && crtMenu.menu_idx != '43') }">
<jsp:include page = "./satisfaction.jsp" flush = "false"/>
</c:if>
<!-- footer -->
<footer>
       <button class="goTop_btn d-flex justify-content-center align-items-center d-lg-none"><img src="../images/arr_top_footer.png" alt="위로가기버튼" class="d-block"/></button>
	<div class="footer_2">
		<address class="d-block lh-sm">${siteInfo.site_addr }<span>TEL : ${siteInfo.site_phone } / FAX : ${siteInfo.site_fax }</span><br>
		${siteInfo.site_copyright }</address>
	</div>
   </footer>
<!-- //footer -->
<%@ include file="../../../include/login_check.jsp"%>