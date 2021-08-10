<html>
    <head>
        <title>Resource Report</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/mystyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.jquery.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.css">
        <script>
            $(function() {
                $(".chosen-select").chosen();
            });
        </script>
    </head>
    <body>
        <cfoutput>
            <cfset getallpjt = createobject("component","controller.projectmgnt").displayproject()>
            <cfset getallemp = createobject("component","controller.projectmgnt").getallemployees()>
            <cfinclude template="includes/header.cfm">
            <div class="container">
                <div class="row">
                    <form action="" method="post" class="mt-2 mb-2">
                    <center><h6 class="mt-2 styleh5"><b>Resource Allocation</b></h6></center></br>
                        <div class="card shadow-lg">
                            <div class="row mt-5 formstyle mb-5">
                                <div class="col-sm-5">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <label>ProjectName:<span class="required">*</span></label>
                                        </div>
                                        <div class="col-sm-2" style="margin-left:10px;">
                                            <select name="spname1" id="spname" class="form-control chosen-select filterfield s1" multiple style="width:150px;font-size:14px;">
                                                <optgroup label="ALL">
                                                    <cfloop query="getallpjt">
                                                        <option value="#pid#">#name#</option> 
                                                    </cfloop>
                                                </optgroup>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="div1"></div>
                                </div>
                                <div class="col-sm-5">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <label>EmployeeName:<span class="required">*</span></label>
                                        </div>
                                        <div class="col-sm-2" style="margin-left:30px;">
                                            <select name="sename1" id="sename" class="form-control chosen-select s1" multiple style="width:150px;font-size:14px;">
                                                <optgroup label="ALL">
                                                    <cfloop query="getallemp">
                                                        <option value="#eId#">#firstname#</option> 
                                                    </cfloop>
                                                <optgroup>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="div2"></div>
                                </div>
                                <div class="col-sm-2">
                                    <input type="submit" id="search" name="search1" value="search" class="btn btn-primary btn-sm">
                                </div>
                                <!---<div> <button type="button" style="background-color:##572ed1;color:white;" class="btn btn-sm viewlist" title="Back">View</button></div>--->
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </cfoutput>
            <script>
                $("#search").click(function(){
                    var pname = $("#spname").val();
                    var ename = $("#sename").val();
                    /*if(pname == ""){
                        console.log(pname,ename); 
                        $('#div1').html("select project name");
                        $('#div1').css({color:'red'});   
                        return false;
                    }
                    if(ename == ""){
                        console.log(pname,ename);  
                        $('#div2').html("select employee name");
                        $('#div2').css({color:'red'});  
                        return false;
                    }*/
                    if(pname == "" && ename == ""){
                       $('#div1').html("select project or employee name");
                        $('#div1').css({color:'red'});   
                        return false; 
                    }
                    if(pname == "" && ename != ""){
                        pname = 0;
                    }
                    if(pname != "" && ename == ""){
                        ename = 0;
                    }
                    var jsonpname=JSON.parse(pname);
                    var jsonename=JSON.parse(ename);
                   console.log(jsonpname);
                    $.ajax({
                        url: 'controller/projectmgnt.cfc?method=getreport',
                        type: 'get',
                        data: {
                        pid : jsonpname,
                        eid : jsonename 
                        },
                        success: function(data){
                            console.log(data);
                        }
                    });
                    return false;
                });
            </script>
    </body>
</html>