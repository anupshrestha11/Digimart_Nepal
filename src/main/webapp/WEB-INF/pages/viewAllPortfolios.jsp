<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="head.jsp" %>
<%@include file="header.jsp" %>
<style>
    body {
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }

    footer {
        margin-bottom: auto;
    }
    .all-portfolio{
        margin-bottom: 2em;
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(325px, 1fr));
    }
    .all-portfolio img{
        min-width: 300px;
        height: 250px;
        object-fit: cover;
    }
    .all-portfolio .card{
        width: 100%;
        box-shadow: 0px 5px 10px #999;
        margin: 20px auto;
        box-sizing: border-box;
    }
</style>
<div class="container">
    <div class="title row">
        <div class="col-12">
            <h1 class="text-center mt-4 mb-4">All Portfolios</h1>
        </div>
    </div>
    <hr>
    <div class="all-portfolio">
        <c:forEach items="${portfolios}" var="portfolio" varStatus="i">
                <div class="card">
                    <img
                            class="card-img-top"
                            src="..\upload/<c:out value="${portfolio.image}"></c:out>"
                            alt="Card image cap"
                    />
                    <div class="card-body">
                        <h4 class="card-title"><c:out value="${portfolio.title}"></c:out></h4>
                        <p class="card-text">
                            <c:out value="${portfolio.description}"></c:out>
                        </p>
                            <%--                        <a class="btn btn-warning">Read More</a>--%>
                    </div>
                </div>
        </c:forEach>
    </div>
</div>


<%@include file="footer.jsp" %>