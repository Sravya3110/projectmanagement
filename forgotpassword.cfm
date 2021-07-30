<html>
    <head>
        <title>Forgot Password</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/mystyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="container">
            <form action="" method="post">
                <center><h6 class="mt-2"><b>Forgot Password</b></h6></center></br>
                <div class="card shadow-lg">
                    <div class="row mt-5 formstyle">
                        <div class="col-sm-5">
                            <div class="row">
                                <div class="col-sm-2">
                                    <label>EmployeeId:<span class="required">*</span></label>
                                </div>
                                <div class="col-sm-3" style="margin-left:10px;">
                                    <input type="text" name="empid1" id="empid" class="form-control chkvalid" autocomplete="off">
                                </div>
                            </div>
                                <div id="div1"></div>
                        </div>
                        <div class="col-sm-5 ">
                        <div class="row">
                            <div class="col-sm-3">
                                <label>MailId<span class="required">*</span></label>
                            </div>
                            <div class="col-sm-3" style="margin-left:10px;">
                                <input type="text" name="mail1" id="mail" class="form-control chkvalid" autocomplete="off">   
                            </div>
                        </div>
                            <div id="div2"></div>
                            <!--<input type="text" name="desc1" id="desc" class="chkvalid">-->
                        </div>               
                    </div>
                    <div class="row mt-5 formstyle">
                        <div class="col-sm-5">
                            <div class="row">
                                <div class="col-sm-2">
                                    <label>Password:<span class="required">*</span></label>
                                </div>
                                <div class="col-sm-3" style="margin-left:10px;">
                                    <input type="text" name="pwd1" id="pwd" class="form-control chkvalid" autocomplete="off">
                                </div>
                            </div>
                                <div id="div3"></div>
                        </div>
                        <div class="col-sm-5 ">
                        <div class="row">
                            <div class="col-sm-3">
                                <label>ConfirmPassword:<span class="required">*</span></label>
                            </div>
                            <div class="col-sm-3" style="margin-left:10px;">
                                <input type="text" name="conpwd1" id="conpwd" class="form-control chkvalid" autocomplete="off">   
                            </div>
                        </div>
                            <div id="div4"></div>
                            <!--<input type="text" name="desc1" id="desc" class="chkvalid">-->
                        </div>               
                    </div>
                    <div class="row mt-5 mb-5">
                        <div class="col-sm-1 offset-sm-3 leftstyle">
                            <a href="index.cfm"><button type="button" style="background-color:#325D81;color:white;" class="btn btn-sm" title="Back">Cancel</button></a>
                        </div>
                        <div class="col-sm-1">
                            <input type="submit" value="submit" style="background-color:#325D81;color:white;" class="btn btn-sm submit" name="submit">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
    <script>
        $(".submit").click(function(){
            var eid = $("#empid").val();
            var mailid = $("#mail").val();
            var pwd = $("#pwd").val();
            var confirm_pwd = $("#conpwd").val();
            console.log(eid,mailid,pwd,confirm_pwd);
            if(eid == ""){
                $("#div1").text("Enter employeeId");
                $("#div1").css({color:'red'});
                return false;
            }else {
                $("#div1").text("");
            }
            if(mailid == ""){
                $("#div2").text("Enter mailId");
                $("#div2").css({color:'red'});
                return false;    
            }else {
                $("#div2").text("");
            }
            if(pwd == ""){
                $("#div3").text("Enter password");
                $("#div3").css({color:'red'});
                return false;
            }else {
                $("#div3").text("");
            }
            if(confirm_pwd == ""){
                $("#div4").text("Confirm Password");
                $("#div4").css({color:'red'});
                return false;
            }else {
                $("#div4").text("");
            }
        });
    </script>
</html>