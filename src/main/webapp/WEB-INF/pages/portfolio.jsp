<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<portfolio>
    <div class="conatiner-fluid padding" id="portfolio">
        <div class="row title text-center">
            <div class="col-sm-12">
                <h2>Portfolio</h2>
                <hr/>
            </div>
        </div>
    </div>

    <div id="portfolios" class="container-fluid w-75">

        <div class="owl-carousel owl-theme portfolios">

            <c:forEach items="${portfolios}" var="portfolio" varStatus="i">
            <div class="ml-2 mr-2">
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
            </div>
            </c:forEach>
        </div>

    </div>
</portfolio>