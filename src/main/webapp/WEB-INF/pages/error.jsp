<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>404 Error</title>
    <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
            integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
            crossorigin="anonymous"
    />
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            background-color: #574b90;
            height: 100%;
            width: 100%;
            color: white;
        }

        .error-section {
            display: flex;
            flex-wrap: wrap;
            height: 100vh;
            justify-content: space-around;
            align-items: center;
        }

        .error-section .error-code h1 {
            font-size: 1200%;
        }
        .btn-back{
            background-color: #071a52;
            color: #fff;
        }
        .btn-back:hover{
            background-color: #574b90;
            color: #fff;
            border: 1px solid #fff;
            transition: border 0.5s ease-in-out;
        }

        .btn-outline-contact {
            border: 1px solid white;
            color: white;
        }
        .btn-outline-contact:hover{
            background-color: #071a52;
            color: #fff;
            transition: background-color 0.5s ease-in-out;
        }
    </style>
</head>
<body>
<section class="container">
    <div class="error-section row">

        <div class="col-sm-12 col-md-5 error-code">
            <h1>404</h1>
        </div>
        <div class="col-md-7 col-sm-12 error-text">
            <h2>Page Not found</h2>
            <p>This page you are looking was moved, removed, renamed or might not exist.</p>
            <button class="btn btn-back">BACK TO HOMEPAGE</button>
            <button class="btn btn-outline-contact">CONTACT US</button>
        </div>
    </div>
</section>
</body>
</html>