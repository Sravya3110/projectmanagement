<html>
<head>
    <title>Assign project</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/mystyle.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.jquery.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.css">
    <script src="css/myvalidation.js"></script>
</head>
<script>
    $(function() {
        $(".chosen-select").chosen();
    });
</script>
<body>
    <cfinclude template="includes/modalpopup.cfm">
        <cfif isDefined("form.submit")>
            <cfset getallpjt = createobject("component","controller.projectmgnt").newassign(pid="#form.spname1#",empid="#form.sename1#")>
            <cfif #getallpjt# EQ true>
                <cflocation url="assignprojectlist.cfm" addtoken="no">
            <cfelse>
                <script>
                    $('#modal-showAlert').modal('show');
                     $('#headerText').html('Alert');
                     $('#modal-showAlert .modal-body').html('Employee with this project already exist');
                     $('#modal-showAlert .modal-footer .update').hide();
                     $('#modal-showAlert .modal-footer .yes').show();
                </script>
            </cfif>   
        </cfif>
        <cfset getallpjt = createobject("component","controller.projectmgnt").displayproject()>
        <cfset getallemp = createobject("component","controller.projectmgnt").getallemployees()>
    <cfoutput>
        <div class="container">
        <div class="row">
            <form action="" method="post" class="mt-5">
                <center><h5 class="mt-4 styleh5">Assign Project</h5></center></br>
                <div class="card shadow-lg">
                <div class="row mt-5 formstyle">
                    <div class="col-sm-5">
                     <div class="row">
                        <label>ProjectName:<span class="required">*</span></label>
                        <!--<input type="text" name="pname1" id="pname" class="chkvalid">-->
                        <select name="spname1" id="spname" class="form-control chosen-select s1" multiple style="width:160px;height:100px;font-size:14px;">
                            <!---<option value="0">--Select--</option>--->
                            <cfloop query="getallpjt">
                              <option value="#pid#">#name#</option> 
                            </cfloop>
                        </select>
                        <div id="div1"></div>
                        </div>
                    </div>
                    <div class="col-sm-5">
                    <div class="row">
                        <label>EmployeeName:<span class="required">*</span></label>
                        <!--<input type="text" name="ename1" id="ename" class="chkvalid">-->
                        <select name="sename1" id="sename" class="form-control chosen-select s1" style="width:160px;height:30px;font-size:14px;">
                            <option value="0">--Select--</option>
                            <cfloop query="getallemp">
                                <option value="#eId#">#firstname#</option> 
                            </cfloop>
                        </select>
                        <div id="div2"></div>
                    </div>
                    </div>
                </div>
                <div class="row mt-5 mb-5">
                    <div class="col-sm-1 offset-sm-3 leftstyle">
                        <a href="assignprojectlist.cfm"><button type="button" class="btn btn-danger btn-sm" title="Back">Cancel</button></a>
                    </div>
                    <div class="col-sm-1">
                        <input type="submit" value="submit" class="btn btn-primary btn-sm savebtn" name="submit">
                    </div>
                </div>
                </div>
            </form>
        </div>
        </div>
        
    </cfoutput>
</body>
</html>