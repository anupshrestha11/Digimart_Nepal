<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

    .portfolios{
        box-sizing: border-box;
    }
    .portfolios .card{
        box-shadow: 0px 5px 15px #999;
        margin: 10px 20px;
        box-sizing: border-box;
    }

</style>
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
                <div class="card">
                    <img
                            class=" card-img-top"
                            src="..\upload/<c:out value="${portfolio.image}"></c:out>"
                            alt="Card image cap"
                    />
                    <div class="card-body">
                        <h4 class="card-title"><c:out value="${portfolio.title}"></c:out></h4>
                        <p class="card-text">
                            <c:out value="${portfolio.description}"></c:out>
                        </p>
                        <a class="btn btn-warning">Read More</a>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>
</portfolio>