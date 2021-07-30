<html>
    <head>
        <title>List of Projects Assigned</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/mystyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="css/projectaction.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap4.min.css">
        <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap4.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#table1').DataTable();
            });
        </script>
        <style>
            .css-serial {
                counter-reset: serial-number; /* Set the serial number counter to 0 */
            }
            .css-serial td:first-child:before {
                counter-increment: serial-number; /* Increment the serial number counter */
                content: counter(serial-number); /* Display the counter */
            }
            #table1_length {
                float: left;
            }
            select {
                height: 29px !important;
            }
            #table1_filter {
                float: right;
                margin-right: 40px;
                width: 130px;
            }
            input[type="search"] {
                border: 1px solid black;
                width: 90%;
            }
            input {
                width: 90% !important;
                height: 25px !important;
            }
            #table1_info {
                font-size: 12px;
                margin-right: 270px;
            }
            .pagination {
                height: 25px;
                font-size: 12px;
            }
             #sel {
                font-size: 12px;
            }
            .form-control {
                 border: 1px solid black;
            }
            table {
                border-collapse: separate !important;
                border-spacing: 0 5px !important;
            }
             p {
                font-size: 11px;
            }
            body {
           font-family : "Myriad Pro Semibold", "Trebuchet MS", Arial, Helvetica, Tahoma, sans-serif;
            }
        </style>
    </head>
    <body>
        <cfinclude template="includes/modalpopup.cfm">
        <cfinclude template="includes/header.cfm">
        <cfset getpjt=createobject("component","controller.projectmgnt").displayproject()>
        <div class="container-fluid">
            <center>
                <h6 class="mt-2"><b>Projects List</b></h6>
                <cfif #session.deptid# eq 5>
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-1">
                                <p>Project Status:</p>
                            </div>
                            <div class="col-md-1">
                                <select id="sel" name="sel1" class="form-control selectasn" style="margin-left:-30px;">
                                    <option value="3">Select</option>
                                    <option value="0">All</option>
                                    <option value="1">Active</option>
                                    <option value="2">InActive</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </cfif>
                <div style="width:80%;border: 1px solid black;padding: 20px;margin: 10px;box-shadow: 0 4px 8px 0 rgba(0,0,0,0.4);" class="mt-3">
                    <table class="table table-borderless table-sm table-hover css-serial mt-5" id="table1">
                        <thead>
                        <tr>
                            <!--<th>ProjectId</th>-->
                            <th>S.No</th>
                            <th>ProjectName</th>
                            <th>Description</th>
                            <th>StartDate</th>
                            <th>EndDate</th>
                            <cfif #session.deptid# eq 5>
                                <th>Actions
                                <a href="createproject.cfm"><button type="button" style="background-color:#5bc0de;color:white;" class="btn btn-sm addpjt" style="margin-left:2px;"><i class="fa fa-plus" aria-hidden="true"></i></button></a></th>
                            </cfif>
                        </tr>
                        </thead>
                        <tbody>
                            <cfoutput query="getpjt">
                                <tr id="#pid#" style="background-color:##F1F1F1;" class="text-dark">
                                    <!---<td>#project_Id#</td>--->
                                    <td>&nbsp;</td>
                                    <td style="text-transform: capitalize;">#name#</td>
                                    <td style="text-transform: capitalize;">#description#</td>
                                    <td>#startdate#</td>
                                    <td>#enddate#</td>
                                    <cfif #session.deptid# eq 5>
                                        <td><cfif isdefined('url.asnid') and #status# EQ 'I'>
                                                <button type="button" style="color:##3276b1;" class="btn btn-sm activatepjt" id="#pid#" title="Activate"><i class="fa fa-unlock-alt" aria-hidden="true"></i></button>
                                            <cfelse>
                                                <button type="button" style="color:green;" class="btn btn-sm editpjt" id="#pid#" title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                                                <button type="button" style="color:red;" class="btn btn-sm deletepjt" id="#pid#" title="Delete"><i class="fa fa-trash" aria-hidden="true"></i></button>
                                            </cfif>
                                        </td>
                                    </cfif>
                                </tr>
                            </cfoutput>
                        </tbody>
                    </table>
                </div>
            </center>
        </div>
        <script>
           $(document).ready(function(){
               var selval = "";
                <cfif isdefined('url.asnid')>
                    <cfoutput>selval= #url.asnid#</cfoutput>
                <cfelse>
                    <cfoutput>selval=1</cfoutput>
               </cfif>
               console.log(selval)
               $(".selectasn option[value="+selval+"]").attr('selected',true);
           });
            $(document).on("change", ".selectasn", function(){
                var chgid = $(this).val();
                console.log(chgid);
                location.href = 'projectList.cfm?asnid=' + chgid ;
            });
            $(document).on("click", ".activatepjt",function(){
               console.log($(this).attr('id'));
               var newid = $(this).attr('id');
               $('#modal-showAlert').modal('show');
               $('#headerText').html('Activate Project');
               $('#modal-showAlert .modal-body').html('Are you sure you want to activate this project?');
               $('#modal-showAlert .modal-footer .update').hide();
               $('#modal-showAlert .modal-footer .yes').show();
               $('#modal-showAlert .modal-footer .yes').click(function(){
               $.ajax({
                url: 'controller/projectmgnt.cfc?method=activateproject',
                type: 'get',
                data: {
                     actid : newid    
                },
                success: function(data){
                    location.href = 'projectList.cfm';
                }
               });
               });
    
            });
        </script>
    </body>
</html>
