<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="head.jsp" %>
<%@include file="header.jsp" %>

<div class="container">
    <div class="title row">
        <div class="col-12">
            <h1 class="text-center mt-4 mb-4">All Portfolios</h1>
        </div>
    </div>
    <hr>
    <div class="row">
        <% for(int i=0; i<10;i++){%>
        <div class="col-md-4 mb-3">
            <div class="card">
                <img
                        class="card-img-top"
                        src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2FS0mhvQxvy58%2Fhqdefault.jpg&f=1&nofb=1"
                        alt="Card image cap"
                />
                <div class="card-body">
                    <h4 class="card-title">Anup Shrestha</h4>
                    <p class="card-text">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium dolorum ea, eos error
                        laudantium molestiae nisi odio perferendis sint sunt, tempore totam unde. Aliquam amet...
                    </p>
                    <a class="btn btn-warning">Read More</a>
                </div>
            </div>
        </div>
        <%}%>
    </div>
</div>


<%@include file="footer.jsp" %>