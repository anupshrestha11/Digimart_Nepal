<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="head.jsp" %>
<%@include file="header.jsp" %>
<style>
    p {
        text-align: justify;
    }

    .title img {
        width: 100%;
        height: 400px;
        object-fit: cover;
    }

    body {
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }



    .heading {
        width: 100%;
    }

    .heading img {
        margin-top: 1rem;
        width: 100%;
        max-height: 400px;
        object-fit: cover;
    }
    .comment .comments{
        width: 100%;
    }

    .comment .comment-box {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        overflow: auto;
        padding: 30px 20px;
        width: 100%;
        display: flex;
        flex-direction: row;
    }

    .comment .comment-box .commentor-img {
        width: 50px;
        height: 50px;
        -o-object-fit: cover;
        object-fit: cover;
        border-radius: 50%;
        margin: 20px;
        -webkit-box-shadow: 0px 0px 20px #999;
        box-shadow: 0px 0px 20px #999;
    }

    .comment .comment-box .comment-content {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        overflow: auto;
        flex-grow: 2;
        padding: 10px 20px;
        border-radius: 10px;
        -webkit-box-shadow: 0px 0px 20px #999;
        box-shadow: 0px 0px 20px #999;
    }

    .comment .input-comment {
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        margin: 20px;
        display: none;
    }

    .comment .input-comment .commentor-img {
        width: 50px;
        height: 50px;
        -o-object-fit: cover;
        object-fit: cover;
        border-radius: 50%;
        margin: 10px 20px;
        -webkit-box-shadow: 0px 0px 20px #999;
        box-shadow: 0px 0px 20px #999;
    }

    .comment .input-comment .comment-form .form-control {
        border: 2px solid #999;
        border-radius: 10px;
    }

    .comment .input-comment .comment-form .btn-submit {
        background: #6a3dd3;
        color: #fff;
        margin: 10px;
    }

    .comment .input-comment .comment-form .btn-submit:hover {
        background: #42287e;
    }

    .fb-login-btn {
        background-color: #2d88ff;
        margin-bottom: 2rem;
        color: #fff;
    }

    .fb-login-btn:hover {
        background-color: #00aced;
        color: #fff;
        transition: background-color ease-in-out 0.5s;
    }

    @media screen and (max-width: 756px) {
        .content img {
            width: 100% !important;
            height: auto !important;
            margin: 0 auto !important;
            object-fit: cover;
        }
    }
</style>
<div class="container">
    <div class="row">
        <div class="col-sm-12 heading">
            <img src="/upload/${blogpost.bannerImage}" alt="">
            <h1 class="mt-4 mb-4">${blogpost.title}</h1>
        </div>
    </div>
    <hr>
    <div class="content col-sm-12">
        <small>Posted by <span class="font-italic text-success font-weight-bold">${blogpost.author}</span>
            on ${blogpost.postedDate}</small>
        <p class="col-sm-12">
            ${blogpost.post}
        </p>

    </div>
</div>

<section class="comment container">
    <h3>Comments</h3>
    <hr>
    <div class="row comments">
        <c:forEach items="${comments}" varStatus="i" var="comment">
            <div class="comment-box">
                <img src="${comment.imageUrl}" class="commentor-img"/>
                <div class="comment-content">
                    <h5 class="commentor-name">${comment.name}</h5>
                    <p>
                            ${comment.comment}
                    </p>
                    <small>${comment.postedDate}</small>
                </div>
            </div>
        </c:forEach>

    </div>

    <div class="input-comment">
        <div class="row">

            <div class="col-md-1 col-sm-12 text-center">
                <img src="/upload/person.jpg" class="commentor-img text-center"/>
            </div>
            <div class="col-md-11 col-sm-12">
                <form action="/comment/${blogpost.id}" id="commentForm" method="post"
                      class="col-sm-12 comment-form text-center">
                    <h5 id="commentor-name"></h5>
                    <input type="text" hidden name="blogPostId">
                    <input type="text" hidden name="name" id="name">
                    <input type="text" hidden name="imageUrl" id="imageUrl">
                    <div class="input-group">
                  <textarea
                          type="text"
                          name="comment"
                          id="ta"
                          rows="2"
                          class="form-control col-sm-12"
                          placeholder="Write a comment..."
                  ></textarea>
                    </div>
                    <input type="submit" class="btn btn-submit" value="Submit"/>
                </form>
            </div>
        </div>
    </div>
    <div class="col-sm-12 text-center">
        <h5 id="status"></h5>
        <button class="btn fb-login-btn" onclick="login()">Log in with Facebook to comment</button>
    </div>
</section>


<script>
    let inputComment = document.querySelector('.input-comment');
    window.fbAsyncInit = function () {
        FB.init({
            appId: '209684307124929',
            autoLogAppEvents: true,
            xfbml: true,
            version: 'v6.0'
        });
    };

    function login() {
        FB.login(function (response) {
            if (response.authResponse) {
                console.log('Welcome!  Fetching your information.... ');
                FB.api('/me', 'GET', {fields: 'id,name,picture'}, function (
                    response
                ) {
                    inputComment.querySelector('img').src = response.picture.data.url;
                    inputComment.querySelector('#commentor-name').textContent = response.name;
                    inputComment.style.display = "block";
                    $('#name').val(response.name);
                    console.log($("#name"))
                    $('#imageUrl').val(response.picture.data.url);
                    document.querySelector('.fb-login-btn').style.display = "none";
                });
            } else {
                console.log('User cancelled login or did not fully authorize.');
            }
        });
    }

    document.getElementById('ta').addEventListener('keydown', function () {
        var rows = $('#ta').attr('rows');
        var text = $('#ta').val();
        rows = parseInt(rows, 10);
        var lines = text.split('\n');
        if (lines.length >= rows && lines.length < 15) {
            rows = lines.length + 1;
            $('#ta').attr('rows', rows);
        }
    });

    let ta = document.getElementById('ta').val;


    const commentForm = document.getElementById("commentForm");
    commentForm.addEventListener("submit", (e) => {
        e.preventDefault();
        const request = new XMLHttpRequest();
        request.open("post", "/comment/${blogpost.id}");
        request.onload = () => {
            console.log(request.responseText);
            $('#ta').val("");
            document.getElementById('status').textContent = request.responseText;
            document.getElementById('status').classList.toggle("text-success");
        }
        request.send(new FormData(commentForm));
        console.log("form has been submitted");

    });


</script>
<script async defer src="https://connect.facebook.net/en_US/sdk.js"></script>


<%@include file="footer.jsp" %>
