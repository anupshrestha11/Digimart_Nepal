<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="admintop.jsp" %>
<style>
    .post-block {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        border: 1px solid #0f74a8;
        border-radius: 20px;
        padding: 20px;
        overflow: auto;
        margin: 10px auto;
    }

    .add-post {
        overflow: auto;
        margin: 20px;
    }

    .btn {
        color: #fff !important;
    }


</style>
<div class="container-fluid">
    <h3 class="mt-3 ml-3 mb-3">Manage Blog Posts</h3>
    <div class="add-post">
        <a class="btn btn-success" href="/admin/blogeditor">Add Post</a>
    </div>
    <div class="container">
        <c:forEach var="blogpost" items="${blogposts}" varStatus="i">
            <div class="post-block">
                <div class="post-detail">
                    <h4>Title: ${blogpost.title}</h4>
                    <p>Author: ${blogpost.author}</p>
                    <p>Added by: ${blogpost.addedBy}</p>
<%--                    <div>--%>
<%--                        ${blogpost.post}--%>
<%--                    </div>--%>
                    <p>Published Date: ${blogpost.postedDate}</p>
                </div>
                <div class="post-action">
                    <a class="btn btn-warning" href="/admin/blog/edit/${blogpost.id}">Edit</a>
                    <a class="btn btn-danger" href="/admin/blog/delete/${blogpost.id}">Delete</a>
                </div>
            </div>
        </c:forEach>

    </div>
</div>
<%@include file="adminbottom.jsp" %>