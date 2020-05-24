<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .testimonial-item{
        padding:  20px;
        margin: 20px;
        border-radius: 20px ;
        box-shadow: 0px 5px 15px #555;
    }
</style>
<testimonial>
    <div class="conatiner padding" id="testimonial">
        <div class="row title text-center">
            <div class="col-sm-12">
                <h2>Testimonial</h2>
                <hr/>
            </div>
        </div>
    </div>

    <div id="testimonials" class="container-fluid w-75">

        <div class="owl-carousel owl-theme testimonials">

            <c:forEach items="${testimonials}" var="testimonial" varStatus="i">
            <div class="ml-2 mr-2">
                <div class="testimonial-item text-center">
                    <div class="img-box"><img
                            src="..\upload/<c:out value="${testimonial.image}"></c:out>"
                            alt=""></div>
                    <p class="testimonial"><c:out value="${testimonial.testiment}"></c:out></p>
                    <p class="overview"><b><c:out value="${testimonial.name}"></c:out></b>, <c:out value="${testimonial.profession}"></c:out></p>
                </div>
            </div>
            </c:forEach>
        </div>

    </div>

</testimonial>