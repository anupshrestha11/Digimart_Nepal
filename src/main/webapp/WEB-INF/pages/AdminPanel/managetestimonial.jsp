<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="admintop.jsp" %>

<div class="container-fluid">
    <h1 class="mt-4">Manage Testimonial</h1>
    <div class="ml-2 row">
        <div class="col-12">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addtestimonial">
                Add Testimonial
            </button>
        </div>

        <div class="col-12">
            <h3 class="text-center">Testimonials</h3>
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th>Id</th>
                    <th>name</th>
                    <th>image</th>
                    <th>profession</th>
                    <th>testiment</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${testimonials}" var="testimonial" varStatus="i">
                    <tr>
                        <th scope="row"><c:out value="${i.index+1}"></c:out></th>
                        <td>${testimonial.name}</td>
                        <td><img src="/upload/${testimonial.image}" alt="" style="width: 200px; border-radius: 20px">
                        </td>
                        <td>${testimonial.profession}</td>
                        <td>${testimonial.testiment}</td>
                        <td><a href="/admin/testimonial/${testimonial.id}" class="btn btn-warning edit"  name="edit" id="edit">Edit</a></td>
                        <td><a href="/admin/testimonial/delete/${testimonial.id}" class="btn btn-danger">Delete</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="modal fade" id="addtestimonial" tabindex="-1" role="dialog" aria-labelledby="Title" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="Title">Add testimonial</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/admin/addtestimonial" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="form-group">
                        <input class="form-control" type="text" name="name"  placeholder="Name">
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="text" name="profession" placeholder="Profession">
                    </div>
                    <div class="form-group">
                        <input type="file" name="image" class="form-control-file" ACCEPT="image/*">
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="text" name="testiment" placeholder="Testimonal">
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
<div class="modal fade" id="edittestimonial" tabindex="-1" role="dialog" aria-labelledby="editTitle" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="editTitle">Edit testimonial</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form action="/admin/testimonial/update" method="post" enctype="multipart/form-data">
            <div class="modal-body">
                <input type="text" hidden id="editid" name="id">
                <div class="form-group">
                    <input class="form-control" type="text" name="name" id="editname" placeholder="Name">
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="profession" id="editprofession" placeholder="Profession">
                </div>
                <div class="form-group">
                    <input type="file" name="image" class="form-control-file" id="editimage" ACCEPT="image/*">
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="testiment" id="edittestiment" placeholder="Testimonal">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <input type="Submit" class="btn btn-primary" name="Update">
            </div>
        </form>
    </div>
</div>
</div>

<script type="text/javascript">
        $('.edit').on('click', function (event) {
            event.preventDefault();
            var href = $(this).attr('href');
            $.get(href, function (testimonial, status) {
                $("#editid").val(testimonial.id);
                $("#editname").val(testimonial.name);
                $("#editprofession").val(testimonial.profession);
                $("#edittestiment").val(testimonial.testiment);
            });
            $('#edittestimonial').modal();
        });


</script>

<%@include file="adminbottom.jsp" %>