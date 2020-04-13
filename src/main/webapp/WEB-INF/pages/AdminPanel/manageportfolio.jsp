<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="admintop.jsp" %>

<div class="container-fluid">
    <h1 class="mt-4">Manage Portfolio</h1>
    <div class="ml-2 row">
        <div class="col-12">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addportfolio">Add
                Portfolio
            </button>
        </div>

        <div class="col-12">
            <h3 class="text-center">Portfolios</h3>
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th>Id</th>
                    <th>Title</th>
                    <th>image</th>
                    <th>Description</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${portfolios}" var="portfolio" varStatus="i">
                    <tr>
                        <th scope="row"><c:out value="${i.index+1}"></c:out></th>
                        <td><c:out value="${portfolio.title}"></c:out></td>
                        <td><img src="/upload/<c:out value="${portfolio.image}"></c:out>" alt=""
                                 style="width: 300px; height: 400px; object-fit:cover;">
                        </td>
                        <td><c:out value="${portfolio.description}"></c:out></td>
                        <td><a href="/admin/portfolio/${portfolio.id}" class="btn btn-warning edit" name="edit"
                               id="edit">Edit</a></td>
                        <td><a href="/admin/portfolio/delete/${portfolio.id}" class="btn btn-danger" name="delete"
                               id="delete">Delete</a></td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </div>
    </div>

</div>
<div class="modal fade" id="addportfolio" tabindex="-1" role="dialog" aria-labelledby="Title" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="Title">Add Portfolio</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/admin/addportfolio" method="post" enctype="multipart/form-data">
                <div class="modal-body">

                    <div class="form-group">
                        <input class="form-control" type="text" name="title" placeholder="Title">
                    </div>
                    <div class="form-group">
                        <input type="file" name="imagefile" class="form-control-file" ACCEPT="image/jpeg">
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="text" name="description" placeholder="Description">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="Submit" class="btn btn-primary" name="Save">
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="editportfolio" tabindex="-1" role="dialog" aria-labelledby="edit-Title" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="edit-Title">Edit Portfolio</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/admin/portfolio/update" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <input type="text" hidden id="editid" name="id">
                    <div class="form-group">
                        <input class="form-control" type="text" name="title" id="edittitle" placeholder="Title">
                    </div>
                    <div class="form-group">
                        <input type="file" name="imagefile" class="form-control-file" ACCEPT="image/jpeg">
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="text" name="description" id="editdescription"
                               placeholder="Description">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="Submit" class="btn btn-primary" name="Save">
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $('.edit').on('click', function (event) {
        event.preventDefault();
        var href = $(this).attr('href');
        $.get(href, function (portfolio, status) {
            $("#editid").val(portfolio.id);
            $("#edittitle").val(portfolio.title);
            $("#editdescription").val(portfolio.description);
        });
        $('#editportfolio').modal();
    });
</script>

<%@include file="adminbottom.jsp" %>