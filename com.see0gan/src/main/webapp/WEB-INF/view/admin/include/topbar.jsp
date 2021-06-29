<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>
					<!-- TopBar : include -->
					<nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top">

						<ul class="navbar-nav ml-auto">

           			 <!-- Nav Item - Pages Collapse Menu -->
            		<li class="nav-item">
               		 <a class="nav-link collapsed" href="/admin/mainForm.sgg" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    <span>메인페이지</span>
                </a>

            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
     		<li class="nav-item">
                <a class="nav-link collapsed" href="/admin/login.sgg" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    <span>로그아웃</span>
                </a>

            </li>
						</ul>
					</nav>
					<!-- Topbar : include -->