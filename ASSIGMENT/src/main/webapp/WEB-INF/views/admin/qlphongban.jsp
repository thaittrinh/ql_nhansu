<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script>
if(${Departs.status=='FAIL'}){
	 Swal.fire({
		  type: 'error',
		  title: '${Departs.message}',
		  text: 'You clicked the button!1'	
		})
}
if(${Departs.status=='SUCCESS'}){

		Swal.fire(
				  '${Departs.message}',
				  'You clicked the button!2',
				  'success'
				)	
 }

</script>


<div class="container-fluid">

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">

					<div id="abb" style="margin-bottom: 10px;">
						<button type="button" class="btn btn-success">
							<i class="fa fa-plus-square"></i> Tạo Mới
						</button>
					</div>

					<div>
						<form:form action="admin/departs.htm" method="Post"
							modelAttribute="Depart" class="form-inline" id="formDepart"
							style="float: left;">

							<div class="form-group mx-sm-3 mb-2" style="width: 260px">
								<form:input path="id" type="text" class="form-control"
									id="idform" placeholder="Id" />
							</div>
							<div class="form-group mx-sm-3 mb-2" style="width: 260px">
								<form:input path="name" type="text" class="form-control"
									id="nameform" placeholder="Name" />

							</div>

							<button type="submit" class="btn btn-primary mb-2" id="somename"
								hidden="true" name="update">Lưu Thay
								Đổi</button>
							<button type="submit" class="btn btn-primary mb-2" id="someid"
								name="insert">Thêm Phòng Ban</button>
						</form:form>



						<div style="float: right;">
							<ul class="navbar-nav float-left mr-auto">
								<!-- ============================================================== -->
								<!-- Search -->
								<!-- ============================================================== -->
								<li class="nav-item search-box">Search <a
									class="nav-link waves-effect waves-dark"
									href="javascript:void()"><i class="ti-search"></i></a>
									<form class="app-search position-absolute"
										action="admin/departs.htm">
										<input type="text" class="form-control" name="name_depart"
											placeholder="Nhap ten &amp; enter"> <a
											class="srh-btn"><i class="ti-close"></i></a>
									</form>
								</li>
							</ul>
						</div>

					</div>

					<br>
					<div class="table-responsive">
						<form action="admin/departs.htm" id="formTable">
							<table class="table table-hover">
								<thead class="thead-light">
									<tr>
										<th scope="col">Mã Phòng Ban</th>
										<th scope="col">Tên Phòng Ban</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="d" items="${Departs.data.listItem}" varStatus="i">
										<tr class="edit">
											<td>${d.id }</td>
											<td>${d.name}</td>
											<th scope="col"><a
												href="admin/departs/delete.htm?id=${d.id}"><button
														type="button" class="btn btn-danger" style="width: 100px;">Delete</button></a></th>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<ul class="pagination" id="pagination"></ul>
							<input type="hidden" value="" id="page" name="page" />
							<input type = "hidden" value="${Departs.data.name}" name ="name_depart"/>
							<!-- 	<input type="hidden" value="" id="item" name="maxItem" />	 -->
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

</div>
<script src="resources/admin/editjs/validation.js"></script>
<script src="resources/admin/editjs/qlphongban.js"></script>
<script type="text/javascript">
//var contextPath = window.location.protocol + "/" + window.location.pathname.split('/')[1];
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: ${Departs.data.totalPage} ,
            startPage: ${Departs.data.startPage} ,
            visiblePages: 3,
            onPageClick: function (event, page) {
            	$('#page').val(page);
                console.info(page + ' (from options)');
            }
        }).on('page', function (event, page) {
            /* window.location.href= contextPath + "/admin/departs/home.htm?page="+page; */
            $('#formTable').submit();
        });
    });
</script>


