<html>
    <head>
        <title>Create new project</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/mystyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="css/myvalidation.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body {
                font-family : "Myriad Pro Semibold", "Trebuchet MS", Arial, Helvetica, Tahoma, sans-serif;
            }
        </style>
    </head>
    <body>
        <cfinclude template="includes/modalpopup.cfm">
        <cfinclude template="includes/header.cfm">
        <cfif isdefined("form.submit")>
            <cfset instpjt = createobject("component","controller.projectmgnt").insertproject(pname = '#form.pname1#',pdesc='#form.desc1#',psdate='#form.sdate1#',pedate='#form.edate1#')>
            <cfif #instpjt# eq true>
                <cflocation url="projectList.cfm" addtoken="no">
            <cfelse>
                <script>
                     $('#modal-showAlert').modal('show');
                     $('#headerText').html('Alert');
                     $('#modal-showAlert .modal-body').html('Project name already exist please create Project with another name');
                     $('#modal-showAlert .modal-footer .update').hide();
                     $('#modal-showAlert .modal-footer .yes').show();
                </script>
            </cfif>
        </cfif>
        <cfoutput>
            <div class="container">
                <div class="row">
                    <form action="" method="post" class="mt-2">
                        <center><h6 class="mt-2 styleh5"><b>Create Project</b></h6></center></br>
                        <div class="card shadow-lg">
                            <div class="row mt-5 formstyle">
                                <div class="col-sm-5">
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <label>ProjectName:<span class="required">*</span></label>
                                        </div>
                                        <div class="col-sm-3" style="margin-left:10px;">
                                            <input type="text" name="pname1" id="pname" class="form-control chkvalid" autocomplete="off">
                                        </div>
                                    </div>
                                        <div id="div1"></div>
                                </div>
                                <div class="col-sm-5 ">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <span class="labelmiddle">
                                        <label>Description:<span class="required">*</span></label>
                                        </span>
                                    </div>
                                    <div class="col-sm-3" style="margin-left:10px;">
                                        <textarea rows="2" id="desc" name="desc1" class="form-control chkvalid" style="width: 160px;">
                                        </textarea>
                                    </div>
                                </div>
                                    <div id="div2"></div>
                                    <!--<input type="text" name="desc1" id="desc" class="chkvalid">-->
                                </div>               
                            </div>
                            <div class="row mt-2 formstyle">
                                <div class="col-sm-5">
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <label>StartDate:<span class="required">*</span></label>
                                        </div>
                                        <div class="col-sm-3" style="margin-left:10px;">
                                            <input type="date" id="sdate" name="sdate1" class="form-control chkvalid">
                                        </div>
                                    </div>
                                    <div id="div3"></div>
                                </div>
                                <div class="col-sm-5">
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <label>EndDate:</label>
                                        </div>
                                        <div class="col-sm-3" style="margin-left:10px;">
                                            <input type="date" id="edate" name="edate1" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-5 mb-5">
                                <div class="col-sm-1 offset-sm-3 leftstyle">
                                    <a href="projectList.cfm"><button type="button" style="background-color:##325D81;color:white;" class="btn btn-sm" title="Back">Cancel</button></a>
                                </div>
                                <div class="col-sm-1">
                                    <input type="submit" value="submit" style="background-color:##325D81;color:white;" class="btn btn-sm" name="submit">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </cfoutput>
    </body>
</html>