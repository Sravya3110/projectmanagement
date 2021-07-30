<html>
    <head>
        <title>Assign project</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/mystyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.jquery.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.css">
        <script src="css/myvalidation.js"></script>
        <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
        rel="stylesheet" type="text/css" />
        <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
        type="text/javascript"></script>
        <script>
        $(function() {
            $(".chosen-select").chosen();
        });
        $(function () {
            $('#sename').multiselect({
                includeSelectAllOption: true
            });
        });
        </script>
        <style>
        .multiselect-selected-text {
            font-size: 14px;
        }
        .btn-group {
            height: 25px;
        }
        .custom-select  {
            height: 30px;
        }
        .showhidediv {
            display: none;
        }
        #selemp, #curallocation, .pjtal1 {
            font-size: 12px;
        }
        .error {
            font-size: 12px;
            margin-left: 20px;
            color: red;
        }
        body {
                font-family : "Myriad Pro Semibold", "Trebuchet MS", Arial, Helvetica, Tahoma, sans-serif;
            }
        .popover {
                    width: 300px !important;
                    height: 100px;
                    font-size: 12px;
                }
        .popover-header {
                    font-size: 12px;
                }
        </style>
    </head>
    <body>
    <cfoutput>
        <cfinclude template="includes/modalpopup.cfm">
        <cfinclude template="includes/header.cfm">
            <!---<cfif isDefined("form.submit")>
            <cfdump var="#form#">
                <cfset getallpjt = createobject("component","controller.projectmgnt").newassign(pid="#form.spname1#",empid="#form.sename1#",paid="#form.pjtal1#")>
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
            </cfif>--->
        <cfset getallpjt = createobject("component","controller.projectmgnt").displayproject()>
        <cfset getallemp = createobject("component","controller.projectmgnt").getallemployees()>
        <div class="container">
            <div class="row">
                <form action="" method="post" class="mt-2">
                    <center><h6 class="mt-2 styleh5"><b>Resource Allocation</b></h6></center></br>
                    <div class="card shadow-lg">
                        <div class="row mt-5 formstyle">
                            <div class="col-sm-5">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label>ProjectName:<span class="required">*</span></label>
                                    </div>
                                    <div class="col-sm-2" style="margin-left:10px;">
                                        <select name="spname1" id="spname" class="form-control chosen-select s1" style="width:120px;font-size:14px;">
                                                <option value="0">--Select--</option>
                                            <cfloop query="getallpjt">
                                                <option value="#pid#">#name#</option> 
                                            </cfloop>
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
                                        <select name="sename1" id="sename" class="form-control s1" multiple="multiple" style="width:200px;height:25px;font-size:14px;">
                                            <cfloop query="getallemp">
                                                <option value="#eId#">#firstname#</option> 
                                            </cfloop>
                                        </select>
                                    </div>
                                </div>
                                <div id="div2"></div>
                            </div>
                            <!---<div> <button type="button" style="background-color:##572ed1;color:white;" class="btn btn-sm viewlist" title="Back">View</button></div>--->
                        </div>
                        <div class="mt-5 showhidediv formstyle">
                            <h6>Employee Resource Allocation Details</h6>
                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <div class="col-md-12">
                                        <strong><label>EmployeeName:</label></strong>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-md-12">
                                        <strong><label>TotalAllocation:</label></strong>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-md-12">
                                        <strong><label>CurrentAllocation:</label></strong>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-3 newrow1">
                            </div>
                            <input type="hidden" name="hidval" id="hidid" class="form-control">
                            <div class="row error"></div>
                        </div>
                        <div class="row mt-5 mb-5">
                            <div class="col-sm-1 offset-sm-3 leftstyle">
                                <a href="assignprojectlist.cfm"><button type="button" style="background-color:##1975A4;color:white;" class="btn btn-sm" title="Back">Cancel</button></a>
                            </div>
                            <div class="col-sm-1">
                                <input type="submit" style="background-color:##1975A4;color:white;" value="submit" class="btn btn-sm savebtn" name="submit">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </cfoutput>
    <script>
        $(document).ready(function(){
         $('#sename').on("change", function(){
            var empids = $(this).val();
            $('.newrow1').html('');
            console.log(empids);
            for(var i=0;i<empids.length;i++){
                var newid = empids[i];
                $.ajax({
                    url: 'controller/projectmgnt.cfc?method=getallocation',
                    type: 'get',
                    data: {
                    empid : newid 
                    },
                    success: function(data){
                        $(".showhidediv").css("display", "block");
                        var res = JSON.parse(data);
                        var curalc=0,newtext="",projectname="",dbempid=0,project_details="";
                        
                            for(var j=0; j<res.DATA.length; j++){
                                var curalc = curalc + res.DATA[j][0];
                                var newtext = res.DATA[j][1];
                                var projectname = projectname + res.DATA[j][2] +',';
                                project_details = project_details + res.DATA[j][2] +':'+ res.DATA[j][0] + '%,';
                                var dbempid = res.DATA[j][3];
                            }
                            console.log(project_details);
                            
                        console.log(curalc,newtext,projectname,dbempid);
                        $('.newrow1').append('<div class="col-md-4"><div class="col-md-12"><div id="selemp" style="text-transform: capitalize;">'+newtext+'</div></div></div>'+
                        '<div class="col-md-4"><div class="col-md-12"><div id="curallocation">'+curalc+ '%<a class="view" id="viewdetails'+dbempid+'" style="font-size:12px" data-trigger="hover" data-toggle="popover" title="ResourceDetails" data-placement="bottom">View Details</a></div></div></div>'+
                        '<div class="col-md-4"><div class="col-md-12"><div class="row" id="pjtallocation">'+
                        '<input type="text" eid="'+dbempid+'" curid="'+curalc+'" name="pjtal1[]" id="alcid" class="form-control alcval" autocomplete="off" style="width:50px;"> <label>%</label></div>'+
                        '</div><div class="col-md-12" id="allcmsg'+dbempid+'" style="font-size:12px;"></div></div>');
                        $('#viewdetails'+dbempid).attr('data-content',project_details);
                    }
                })
            }
            if(empids.length == 0){
                $(".showhidediv").css("display", "none");
            }        
        });
        $(document).on('mouseover', '.view', function() {
            console.log(this.id);
            $('#'+this.id).popover('show');
        });
        let resultval=0;
        $(document).on('click','.savebtn',function (e){
            e.preventDefault();
            $('.alcval').each(function(){
                //console.log($(this).find("input.alcval").val());
                var empid = $(this).attr('eid');
                var paid = $(this).val();
                var pid = $('#spname').val();
                var curalcval = $(this).attr('curid');
                var addvalue = parseInt(paid) + parseInt(curalcval);
                console.log(empid,curalcval,addvalue);
               if(paid == 0){
                   //alert("allocation is not specified");
                   $("#allcmsg"+empid).text("Allocation is not specified");
                    //$(this).find("input.alcval").css("border","1px solid red");
                   $('#allcmsg'+empid).css({color:'red',display:'block'}); 
                   //return false;
                }else{
                    $("#allcmsg"+empid).text("");
                }
                if(addvalue > 100){
                   $("#allcmsg"+empid).text("Allocation greater than 100");
                   $('#allcmsg'+empid).css({color:'red',display:'block'}); 
                   return false;
               }
                console.log(pid,empid,paid);
                $.ajax({
                    url: 'controller/projectmgnt.cfc?method=newassign',
                    type: 'get',
                    data: {
                    pid : pid,
                    empid : empid,
                    paid : paid 
                    },
                    success: function(data){
                        if(data == 'true'){
                            resultval++;
                            $("#hidid").attr('hidvalue',resultval);
                            $("#hidid").val(resultval); 
                        }else{
                            $("#hidid").val(resultval);
                        }
                        //$("#hidid").val(resultval);   
                        
                         var hid_value = $("#hidid").val();
                        if(hid_value > 0){
                            location.href="assignprojectlist.cfm";
                        }                 
                    },  
                 
                }); 
            });
            var newhidvalue = $("#hidid").val();
             console.log(newhidvalue); 
            if(newhidvalue === "0"){
                $(".error").text("Resource Allocation already present");
                return false;
            }
        });
       /*function getvalue(){
            var hid_value = $("#hidid").val();
             console.log(hid_value);
                if(hid_value > 0){
                    location.href="assignprojectlist.cfm";
                }
       }*/
       
    });
    </script>
    </body>
</html>