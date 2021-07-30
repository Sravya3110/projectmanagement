<html>
    <head><title>Login Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    </style>
    </head>
    <body>
        <cfoutput>
            <cfinclude template="includes/modalpopup.cfm">
            <cfif isdefined("form.submit1")>
                <cfset getemp = createobject("component","controller.projectmgnt").validlogin(mailid="#form.email1#")>
                <cfif #getemp# eq true>
                    <cflocation url="projectList.cfm" addtoken="no">
                <cfelse>
                    <script>
                        $('##modal-showAlert').modal('show');
                        $('##headerText').html('Error');
                        $('##modal-showAlert .modal-body').html('Enter valid credentials to login?');
                        $('##modal-showAlert .modal-footer .update').hide();
                        $('##modal-showAlert .modal-footer .no').hide();
                        $('##modal-showAlert .modal-footer .yes').show();
                    </script>
                </cfif>
            </cfif>
            <div class="container">
                <center>
                <div class="card text-center" style="width:35%;margin-top:150px;">
                    <h5 class="card-header" style="height:80px;">SignIn</h5>
                    <div class="card-body">
                        <form action="" method="post">
                            <div class="col-sm-12">
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <span class="fa fa-user"></span>
                                            </span>                    
                                        </div>
                                            <input type="text" id="email" name="email1" class="form-control" placeholder="Email">
                                    </div>
                                </div>
                                <div id="div1" style="font-size: 11px"></div>
                            </div>
                            <div class="col-sm-12">
                                <div class="col-sm-12 mt-3">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <span class="fa fa-lock"></span>
                                            </span>                    
                                        </div>
                                        <input type="password" id="pwd" name="pwd1" class="form-control" placeholder="Password">
                                    </div>
                                </div>
                                <div id="div2" style="font-size: 11px"></div>
                            </div>  
                            <div class="col-sm-12">
                                <div class="col-sm-12 mt-3">
                                    <input type="submit" id="submit" name="submit1" class="btn btn-block login" value="Login" style="background-color:##e69900;color:white;">
                                </div>
                            </div>
                        </form>
                        <a href="forgotpassword.cfm">Forgot Password?</a>
                    </div>
                </div>
                </center>
            </div>
        </cfoutput>
        <script>
        $(document).ready(function(){
            $("#submit").click(function(){
                var mailid = $("#email").val();
                var pswd = $("#pwd").val();
                var reg_mail = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
                console.log(mailid,pswd);
                if(mailid == ""){
                    $("#div1").text("Enter mailid"); 
                    $('#div1').css({color:'red'});   
                    return false;
                }else if(!(mailid.match(reg_mail))){
                    $("#div1").text("Enter valid mailid"); 
                    $('#div1').css({color:'red'});   
                    return false;
                }else {
                     $("#div1").text("");
                }
                if(pswd == ""){
                    $("#div2").text("Enter Password"); 
                    $('#div2').css({color:'red'});   
                    return false;   
                }else {
                     $("#div2").text("");
                }
            });
        });
        </script>
    </body>
</html>