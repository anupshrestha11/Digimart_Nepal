<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>

    function validate() {
        var password = document.getElementById("password").value;
        var repassword = document.getElementById("repassword").value;
        if (password == repassword) {
            return true;
        } else {
            alert("Re-Password Donot Match");
            return false;
        }
    }

</script>

<body>

    <div class="container">
        <div id="login-row" class="row justify-content-center align-items-center">
            <div id="login-column" class="col-md-6">
                <div id="login-box" class="col-md-12">
                    <form id="login-form" class="form" action="/register" method="post"
                          onsubmit="return validate()">
                        <h3 class="text-center text-info">Sign Up
                            <p style="color: red">${status}</p>
                        </h3>
                        <div class="form-group">
                            <label for="firstName" class="text-info">First Name:</label><br>
                            <input type="text" name="firstName" id="firstName" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="lastName" class="text-info">Last Name</label><br>
                            <input type="text" name="lastName" id="lastName" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="userName" class="text-info">Username:</label><br>
                            <input type="text" name="userName" id="userName" class="form-control" required
                                   minlength="5">
                        </div>
                        <div class="form-group">
                            <label for="password" class="text-info">Password:</label><br>
                            <input type="password" name="password" id="password" class="form-control" required
                                   minlength="6">
                        </div>
                        <div class="form-group">
                            <label for="repassword" class="text-info">Re-Password:</label><br>
                            <input type="password" name="repassword" id="repassword" class="form-control" required
                                   minlength="6">
                            <div class="form-group">

                                <div class="form-group">
                                    <label for="email" class="text-info">Email:</label><br>
                                    <input type="email" name="email" id="email" class="form-control" required
                                           minlength="6">
                                </div>

                                <br>
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="submit" required>
                            </div>

                            <div id="register-link" class="text-right">
                                <a href="/login" class="text-info">Login here</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
