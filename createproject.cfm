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
    </head>
    <body>
        <cfinclude template="includes/modalpopup.cfm">
        <cfif isdefined("form.submit")>
            <cfset instpjt = createobject("component","controller.projectmgnt").insertproject(pname = '#form.pname1#',pdesc='#form.desc1#',psdate='#form.sdate1#',pedate='#form.edate1#')>
            <cfif #instpjt# eq true>
                <cflocation url="projectList.cfm" addtoken="no">
            <cfelse>
                <script>
                     $('#modal-showAlert').modal('show');
                     $('#headerText').html('Alert');
                     $('#modal-showAlert .modal-body').html('Project name already exist please create another name');
                     $('#modal-showAlert .modal-footer .update').hide();
                     $('#modal-showAlert .modal-footer .yes').show();
                </script>
            </cfif>
        </cfif>
        <cfoutput>
            <div class="container">
                <div class="row">
                    <form action="" method="post" class="mt-5">
                        <center><h5 class="mt-4 styleh5">Create Project</h5></center></br>
                        <div class="card shadow-lg">
                            <div class="row mt-5 formstyle">
                                <div class="col-sm-5">
                                    <label>ProjectName:<span class="required">*</span></label>
                                    <input type="text" name="pname1" id="pname" class="form-control chkvalid" autocomplete="off">
                                    <div id="div1"></div>
                                </div>
                                <div class="col-sm-5 ">
                                <div class="row">
                                    <div class="col-sm-2">
                                    <span class="labelmiddle">
                                    <label>Description:<span class="required">*</span></label></span>
                                    </div>
                                    <div class="col-sm-3" style="margin-left:50px;">
                                    <textarea rows="2" id="desc" name="desc1" class="form-control chkvalid" style="width: 160px;">
                                    </textarea>
                                    </div>
                                </div>
                                    <!--<input type="text" name="desc1" id="desc" class="chkvalid">-->
                                    <div id="div2"></div>
                                </div>               
                            </div>
                            <div class="row mt-2 formstyle">
                                <div class="col-sm-5">
                                    <label>StartDate:<span class="required">*</span></label>
                                    <input type="date" id="sdate" name="sdate1" class="form-control chkvalid">
                                    <div id="div3"></div>
                                </div>
                                <div class="col-sm-5">
                                    <label>EndDate:</label>
                                    <input type="date" id="edate" name="edate1" class="form-control">
                                </div>
                            </div>
                            <div class="row mt-5 mb-5">
                                <div class="col-sm-1 offset-sm-3 leftstyle">
                                    <a href="projectList.cfm"><button type="button" class="btn btn-danger btn-sm" title="Back">Cancel</button></a>
                                </div>
                                <div class="col-sm-1">
                                    <input type="submit" value="submit" class="btn btn-primary btn-sm" name="submit">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </cfoutput>
    </body>
</html>