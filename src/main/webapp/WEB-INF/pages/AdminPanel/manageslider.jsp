<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="admintop.jsp" %>
<style>
    .image-box {
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        overflow: auto;
        /*flex-direction: row;*/
        justify-content: space-around;
        align-items: center;
    }

    .image {
        width: 250px;
        align-self: center;
        justify-content: space-around;
        margin: 20px auto;
    }

    img {
        flex: 1;
        width: 100%;
        margin: 20px auto;
        image-orientation: from-image;
    }
</style>
<div class="container-fluid">
    <h1 class="mt-4">Manage Slider</h1>
    <div class="row">
        <form enctype="multipart/form-data" method="post" action="upload" enctype="multipart/form-data">
            <div class="mt-3 col-12">
                <label for="filesToUpload">Select Files to Upload</label><br/>
            </div>
            <div class="col-md-6">
                <input type="file" name="file" id="filesToUpload" multiple="multiple" accept="image/jpeg"/>
                <input type="submit" value="Upload" class="btn btn-primary m-2">
                <br>
                <br>
            </div>
            <div class="col-md-6">
                <output id="filesInfo"></output>
            </div>
        </form>
    </div>

    <div class="container-fluid w-75">
        <div class="row">
            <h3 class="text-center col-12">Images for Slider</h3>
            <div class="image-box">
                <c:forEach var="sliderImage" items="${sliderImages}" varStatus="i">
                    <div class="image text-center">
                        <img src="${sliderImage.location}" alt="${sliderImage.name}">
                        <a href="/admin/slider/active/${sliderImage.id}" class="btn btn-success">
                            <c:if test="${sliderImage.status == true}">
                                Selected
                            </c:if>
                            <c:if test="${sliderImage.status == false}">
                                Select

                            </c:if>
                        </a>
                        <a href="/admin/slide/delete/${sliderImage.id}" class="btn btn-warning">Delete</a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<script>
    function fileSelect(evt) {
        if (window.File && window.FileReader && window.FileList && window.Blob) {
            var files = evt.target.files;

            var result = '';
            var file;
            for (var i = 0; file = files[i]; i++) {
                // if the file is not an image, continue
                if (!file.type.match('image.*')) {
                    continue;
                }

                reader = new FileReader();
                reader.onload = (function (tFile) {
                    return function (evt) {
                        var div = document.createElement('div');
                        div.innerHTML = '<img style="width: 90px;" src="' + evt.target.result + '" />';
                        document.getElementById('filesInfo').appendChild(div);
                    };
                }(file));
                reader.readAsDataURL(file);
            }
        } else {
            alert('The File APIs are not fully supported in this browser.');
        }
    }

    document.getElementById('filesToUpload').addEventListener('change', fileSelect, false);
</script>
<%@include file="adminbottom.jsp" %>
