<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<slider>
    <div
            id="carouselExampleIndicators"
            class="carousel slide"
            data-ride="carousel"
    >
<%--        <ol class="carousel-indicators">--%>
<%--            <li--%>
<%--                    data-target="#carouselExampleIndicators"--%>
<%--                    data-slide-to="0"--%>
<%--                    class="active"--%>
<%--            ></li>--%>
<%--            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>--%>
<%--            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>--%>
<%--        </ol>--%>
        <div class="carousel-inner">
            <div class="carousel-caption caption">
                <h1>Digimart Nepal</h1>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit.
                </p>
                <button class="btn btn-primary">
                    Learn More
                </button>
            </div>
            <c:forEach items="${sliderimages}" var="sliderimage" varStatus="i">
                <div class="carousel-item <c:if test="${i.index==0}">active</c:if> ">
                    <img
                            class="d-block w-100"
                            src="/upload/<c:out value="${sliderimage.name}"></c:out>"
                            alt="<c:out value="${sliderimage.name}"></c:out>"
                            style=" height: 50vh; object-fit: cover;"
                    />
                </div>
            </c:forEach>
        </div>
        <a
                class="carousel-control-prev"
                href="#carouselExampleIndicators"
                role="button"
                data-slide="prev"
        >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a
                class="carousel-control-next"
                href="#carouselExampleIndicators"
                role="button"
                data-slide="next"
        >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</slider>