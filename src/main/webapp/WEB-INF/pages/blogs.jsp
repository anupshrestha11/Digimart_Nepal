<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="head.jsp" %>
<%@include file="header.jsp" %>
<style>
    .blog-box {
        width: 100%;
        margin-top: 3em;
        padding: 30px 10px;
        cursor: pointer;
        -webkit-box-sizing: content-box;
        box-sizing: content-box;
        background: #eee;
        border-radius: 20px;
        -webkit-box-shadow: 0px 0px 20px #000;
        box-shadow: 0px 0px 20px #000;
    }

    .blog-box .blog-img-left {
        float: left;
        width: 100%;
        height: 300px;
        -o-object-fit: cover;
        object-fit: cover;
        cursor: pointer;
    }

    .blog-box .blog-content {
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        padding-right: 8px;
    }

    .blog-box .blog-content .blog-title {
        font-size: 2rem;
    }

    .blog-box .blog-content .blog-text {
        text-align: justify;
    }

    .blog-box .blog-content .blog-author {
        color: #600396;
        font-weight: bold;
        font-style: italic;
    }

    .blog-box .blog-content .blog-published-date {
        color: #600396;
    }

    .blog-box .blog-content .btn-blog {
        -webkit-box-shadow: 0px 0px 5px #000;
        box-shadow: 0px 0px 5px #000;
        background-color: #fff;
        color: #000;
    }

    .blog-box .blog-content .btn-blog:hover {
        background-color: #565656;
        color: white;
    }

    .blog-box:hover .blog-img-left {
        -webkit-transform: rotate(5deg);
        transform: rotate(5deg);
        transition: transform ease-in 0.5s;
    }
</style>
<div class="container mb-5">
    <div class="mt-4">
        <h1>Latest Blogs</h1>
        <hr>
    </div>
    <div class="container">
        <div class="row">
            <c:forEach var="blogpost" items="${blogposts}" varStatus="i">
            <div class="blog-box col-md-12">
                <img src="/upload/${blogpost.bannerImage}" alt="" class="blog-img-left col-md-6" />
                <div class="blog-content">
                    <h5 class="blog-title">${blogpost.title}</h5>
                    <span class="blog-author">${blogpost.author}</span><br />
                    <span class="blog-published-date"> Updated on ${blogpost.postedDate}</span>
                    <p class="blog-text">
                        ${blogpost.blogDesc}
                    </p>
                    <a href="/blog/${blogpost.id}" class="btn btn-blog">Read More</a>
                </div>
            </div>
            </c:forEach>

        </div>

<%--        <nav aria-label="Page navigation example" class="my-5">--%>
<%--            <ul class="pagination">--%>
<%--                <li class="page-item"><a class="page-link" href="#">Previous</a></li>--%>
<%--                <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
<%--                <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--                <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--                <li class="page-item"><a class="page-link" href="#">Next</a></li>--%>
<%--            </ul>--%>
<%--        </nav>--%>
    </div>
</div>

<%@include file="footer.jsp" %>