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

    section.container-fluid {
        height: 100%;
        background-color: #f7f7f7;
    }

    .get-in-touch {
        background: linear-gradient(to right, rgb(15, 12, 41), rgb(48, 43, 99), rgb(36, 36, 62));
        /*background: url("/images/get-in-touch.jpg") no-repeat;*/
        background-size: cover;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 300px;
        max-height: 300px;
        color: #fff;
    }

    .get-in-touch h1 {
        color: #f0f0f0;
        font-size: 500%;
        font-weight: 900;

    }

    .form form h3 {
        font-size: 200%;
    }

    .form form h3::before, .form form h3::before {
        content: "";
        border-bottom: 1px solid #000;

    }

    .btn-message {
        margin-bottom: 10px;
        padding: 10px 15px;
        background: #581b98;
        color: #fff;
    }
    .btn-message:hover{
        top: 10%;
        transform: translateY(10%);
        color: #fff;
    }
    @media(max-width: 500px){
        .get-in-touch{

            max-height: 150px;
        }
        .get-in-touch h1{
            font-size: 200%;
        }

    }

</style>

<section class="container-fluid">
    <div class="row">
        <div class="get-in-touch col-12">
            <h1>Get in Touch</h1>
        </div>
        <div class="container mt-4 form ">
            <form action="" class="row">
                <h3 class="text-center mb-5 col-12">We'd Love To Hear From You!</h3>
                <div class="col-12 mb-3">
                    <input t type="text" class="form-control" placeholder="Name*">
                </div>
                <div class="col-md-6 col-sm-6 mb-3">
                    <input type="text" class="form-control" placeholder="Email*">
                </div>
                <div class="col-md-6 col-sm-6 mb-3">
                    <input type="text" class="form-control" placeholder="Phone Number">
                </div>
                <div class="col-12 mb-3">
                    <textarea name="message" placeholder="Write your Message*" id="" cols="30" rows="10"
                              class="form-control"></textarea>
                </div>
                <div class="text-center col-12 mb-5">
                    <input type="submit" class="btn btn-message" value="Send Message">
                </div>

            </form>
        </div>
    </div>

</section>

<%@include file="footer.jsp" %>