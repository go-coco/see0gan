<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collection" %>
<%
	/**********************************
	전달해야 할 변수
	***********************************/
	String url = null;
	String str = null;
	String ctrl = null;
	
	url = request.getParameter("url");
	System.out.println("url >>> : " + url);
	str = request.getParameter("str");
	System.out.println("str >>> : " + str);
	ctrl = request.getParameter("pageSize");
	System.out.println("ctrl >>> : " + ctrl);
	
	if(str != null){
		str = str + "&";
	}
%>
<%
	/**********************************
	페이지 네비게이션 관련 변수
	***********************************/
	// 한페이지에 보여질 게시물의 수
	int pageSize = 0;

	// 그룹의 크기
	int groupSize = 0;
	
	// 전체 게시물의 개수
	int totalCount = 0;
	
	// 현재 페이지
	int curPage = 0;
	
	// 전체 페이지의 개수
	int pageCount = 0;
	
	if(request.getParameter("pageSize") != null){
		pageSize = Integer.parseInt(request.getParameter("pageSize"));
		System.out.println("pageSize >>> : " + pageSize);
	}
	if(request.getParameter("groupSize") != null){
		groupSize = Integer.parseInt(request.getParameter("groupSize"));
		System.out.println("groupSize >>> : " + groupSize);
	}
	if(request.getParameter("curPage") != null){
		curPage = Integer.parseInt(request.getParameter("curPage"));
		System.out.println("curPage >>> : " + curPage);
	}
	if(request.getParameter("totalCount") != null){
		totalCount = Integer.parseInt(request.getParameter("totalCount"));
		System.out.println("totalCount >>> : " + totalCount);
	}
	
	// 전체게시물수와 페이지크기를 가지고 전체 페이지 개수를 계산함.
	// 소수점에 따라 계산상의 오류가 없도록 한것임.
	pageCount = (int)Math.ceil(totalCount / (pageSize+0.0));
	System.out.println("pageCount >>> : " + pageCount);
	
	// 현재그룹 설정
	int curGroup = (curPage-1) / groupSize;
	System.out.println("curGroup >>> : " + curGroup);
	int linkPage = curGroup * groupSize;	
	System.out.println("linkPage >>> : " + linkPage);
%>
<ul class="pagination justify-content-center">
<%
	//첫번재 그룹이 아닌 경우
	if(curGroup > 0){		
%>
	<a class="page-link" href="<%=url%>?<%=str%>curPage=1">◁◁</a>
	<a class="page-link" href="<%=url%>?<%=str%>curPage=<%=linkPage%>">◀</a>
<%
	}else{
%>	
	<a class="page-link" href="#" tabindex="-1" aria-disabled="true">◁◁</a>
	<a class="page-link" href="#" tabindex="-1" aria-disabled="true">◀</a>
<% 
	}

	//다음 링크를 위해 증가시킴
	linkPage++;
	
	int loopCount = groupSize;
	// 그룹범위내에서 페이지 링크만듬.
	while((loopCount >0) && (linkPage <= pageCount)){
		if(linkPage == curPage){
%>	
				<a class="page-link" href="#"><%=linkPage%></a>
<% 
		}else{
%>
		<a class="page-link" href="<%=url%>?curPage=<%=linkPage%>&pageCtrl=<%=ctrl%>"><%=linkPage%></a>
<% 
		}
		
		linkPage++;
		loopCount--;
	}
	
	// 다음그룹이 있는 경우
	if(linkPage <= pageCount)
	{
%>
	<a class="page-link" href="<%=url%>?curPage=<%=linkPage%>&pageCtrl=<%=ctrl%>">▶</a>
	<a class="page-link" href="<%=url%>?curPage=<%=pageCount%>&pageCtrl=<%=ctrl%>">▷▷</a>
<%
	}
	else
	{
%>
	<a class="page-link" href="#" tabindex="-1" aria-disabled="true">▶</a>
		<a class="page-link" href="#" tabindex="-1" aria-disabled="true">▷▷</a>		
<%
	}
%>
</ul>