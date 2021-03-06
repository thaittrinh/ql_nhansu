<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="container-fluid">

		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<div>						
						<div >
							<ul class="navbar-nav float-left mr-auto">
								<!-- ============================================================== -->
								<!-- Search -->
								<!-- ============================================================== -->
								<li class="nav-item search-box">Search <a
									class="nav-link waves-effect waves-dark"
									href="javascript:void()"><i class="ti-search"></i></a>
									<form class="app-search position-absolute"
										action="admin/statistic/staff/search.htm">
										<input type="text" name="nameStaff" class="form-control"
											placeholder="Tên nhân viên &amp; enter"> <a class="srh-btn"><i
											class="ti-close"></i></a>
									</form>
								</li>
							</ul>
						</div>
					</div>

					<br>
					<div class="table-responsive">
						<table class="table table-hover">
							<thead class="thead-light">
								<tr>																
									<th scope="col">Nhân Viên</th>
									<th scope="col">Mã Nhân Viên</th>
									<th scope="col">Thành Tích</th>
									<th scope="col">Kỷ Luật</th>
									<th scope="col">Diểm thưởng</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
						 	<c:forEach var="s" items="${tkStaff}">
									<tr >																									
										<td>${s[1]}</td>
										<td>${s[0]}</td>
										<td>${s[2]}</td>
										<td>${s[3]}</td>
										<td>${s[4]}</td>								
										<th scope="col"><a
											href="admin/statistic/staff/ct.htm?idStaff=${s[0]}">
													<button type="button" class="btn btn-outline-danger">Xem Chi Tiết</button></a></th>
									</tr>							
							</c:forEach>						 
							</tbody>
						</table>
						<ul class="pagination" id="pagination"></ul>
						<input type="hidden" value="" id="page" name="page" />		
					</div>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
var contextPath = window.location.protocol + "/" + window.location.pathname.split('/')[1];
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: ${totalPage} ,
            startPage: ${startPage} ,
            visiblePages: 3,
            onPageClick: function (event, page) {
                console.info(page + ' (from options)');
            }
        }).on('page', function (event, page) {
            window.location.href= contextPath + "/admin/statistic/staff/home.htm?page="+page;
        });
    });       
</script>
