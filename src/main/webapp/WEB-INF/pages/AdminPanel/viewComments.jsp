<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="admintop.jsp" %>
<style>
    .comments {
        display: flex;
        flex-direction: column;
    }

    .comments .comment-box {
        border: 1px solid #999;
        padding: 10px;
        margin: 1rem 0;
    }

    .comments .comment-box img {
        width: 100%;
        height: 100%;
    }

    .comments .comment-box .comment-content a {
        color: #fff;
    }

    .comments .comment-box .comment-content .btn-success {
        background-color: #00aced;
    }

    .comments .comment-box .comment-content .btn-success:hover {
        background-color: #0f74a8;
    }

    .comments .comment-box .comment-content .btn-warning {
        background-color: #6a3dd3;
    }

    .comments .comment-box .comment-content .btn-warning:hover {
        background-color: #0000cc;
    }
</style>
<section class="comment-section container">
    <h3 class="my-4">${blogpost.title}</h3>
    <div class="row comments">
        <c:forEach var="comment" items="${comments}" varStatus="i">
            <div class="comment-box col-sm-12 row">
                <img src="${comment.imageUrl}" class="col-sm-1" alt="${comment.name}">
                <div class="comment-content col-sm-7">
                    <h5>${comment.name}</h5>
                    <p>${comment.comment}</p>
                    <c:if test="${!comment.approved}">
                        <a class="btn btn-success btn-accept" href="/admin/status/accept/${comment.id}" >Accept</a>

                    </c:if>
                    <a class="btn btn-warning btn-reject" href="/admin/status/reject/${comment.id}" >Reject</a>
                </div>
            </div>
        </c:forEach>
    </div>
</section>
<script>
    $('.btn-accept').click(action);
    $('.btn-reject').click(action);

    function action(e) {
        e.preventDefault();
        if (confirm("do you want to perform this action")) {
            const href = e.target.href;
            const request = new XMLHttpRequest();
            request.open('get', href);
            request.onload = () => {
                console.log(request.responseText);
                location.reload();
            }
            request.send();

        }
    }
</script>
<%@include file="adminbottom.jsp" %>