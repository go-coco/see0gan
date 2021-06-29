<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!-- Sidebar : include -->
  <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar" data-sidebarbg="skin5" >

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/admin/mainForm.sgg">
                <div class="sidebar-brand-icon rotate-n-50">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-20">관리자 <sup></sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                see0gan 회원관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/admin/gu_listmembers.sgg" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-laugh-wink"></i>
                    <span>게스트 회원</span>
                </a>

            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
     		<li class="nav-item">
                <a class="nav-link collapsed" href="/admin/host_listmembers.sgg" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-laugh-wink"></i>
                    <span>호스트 회원</span>
                </a>

            </li>

            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                	정산 관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
             <li class="nav-item">
                <a class="nav-link collapsed" href="/admin/oderList.sgg" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-table"></i>
                    <span>정산/환불 </span>
                </a>
            </li>

            <!-- Nav Item - Charts -->


            <!-- Nav Item - Tables -->
   

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
			<div class="sidebar-heading">
                	게시판 관리
            </div>
             <li class="nav-item">
                <a class="nav-link collapsed" href="/admin/boardList.sgg" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>1:1게시판 </span>
                </a>

            </li>

        </ul>

			<!-- Sidebar : include -->