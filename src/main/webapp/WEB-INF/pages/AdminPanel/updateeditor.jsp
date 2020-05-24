<%@ page import="org.apache.catalina.filters.ExpiresFilter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="admintop.jsp" %>
<style>
    .form {
        overflow: auto;
        display: flex;
    }
</style>

<script src="https://cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
<div class="container">
    <h3 class="mt-3">Add Post</h3>
    <form class="editorform row form" method="post" action="/admin/blog/update" enctype="multipart/form-data" >
        <div class="form-group col-12 right mt-3">
            <input type="submit" value="Publish" class="btn btn-outline-success ">
        </div>
            <input type="text" hidden name="id" value="${blogpost.id}">
        <div class="form-group col-12">
            <label for="title"><h4>Title</h4></label>
            <input type="text" name="title" id="title" class="form-control" value="${blogpost.title}">
        </div>
        <div class="form-group col-12">
            <label for="title"><h4>Author</h4></label>
            <input type="text" name="author" id="author" class="form-control" value="${blogpost.author}">
        </div>
        <div class="form-group col-12">
            <label for="bannerImage"><h4>Banner Image</h4></label>
            <input type="file" name="bannerImage" id="bannerImage" class="form-control-file" accept="image/*">
        </div>
        <div class="form-group col-12">
            <label for="blogdesc"><h4>Blog Description</h4></label>
            <input type="text" name="blogDesc" id="blogDesc" class="form-control" value="${blogpost.blogDesc}">
        </div>

        <div class="form-group col-12">
            <label for="post"><h4>Post</h4></label>
            <textarea name="post" id="post">${blogpost.post}</textarea>
        </div>
    </form>
</div>


<Script>
    CKEDITOR.replace('post', {
        filebrowserUploadUrl: '/image/upload',
        filebrowserBrowseUrl: '/image/browse',
        height: 400
    });
</Script>


<%@include file="adminbottom.jsp" %>