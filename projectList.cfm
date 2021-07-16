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
                margin-right: 30px;
            }
            input {
                width: 90% !important;
                height: 25px !important;
            }
            #table1_info {
                font-size: 14px;
            }
            .pagination {
                height: 25px;
                font-size: 12px;
            }
             #sel {
                font-size: 12px;
            }
        </style>
    </head>
    <body>
        <cfinclude template="includes/modalpopup.cfm">
        <cfset getpjt=createobject("component","controller.projectmgnt").displayproject()>
        <div class="container">
            <center>
            <h5 class="mt-5">View Projects</h5>
            <div class="col-md-10 mt-5">
                <div class="row">
                    <div class="col-md-1">
                        <label>Select Projects:</label>
                    </div>
                    <div class="col-md-2">
                        <select id="sel" name="sel1" class="form-control selectasn">
                            <option>Select</option>
                            <option value="0">All</option>
                            <option value="1">Active</option>
                            <option value="2">InActive</option>
                        </select>
                    </div>
                </div>
            </div>
            <div style="width:80%" class="mt-3">
            <table class="table table-bordered table-sm table-striped css-serial mt-5" id="table1">
                <thead>
                <tr>
                    <!--<th>ProjectId</th>-->
                    <th style="text-align:center;">S.No</th>
                    <th style="text-align:center;">ProjectName</th>
                    <th style="text-align:center;">Description</th>
                    <th style="text-align:center;">StartDate</th>
                    <th style="text-align:center;">EndDate</th>
                    <th style="text-align:center;">Actions
                    <a href="createproject.cfm"><button type="button" class="btn btn-success btn-sm addpjt" style="margin-left:2px;"><i class="fa fa-plus" aria-hidden="true"></i></button></a></th>
                </tr>
                </thead>
                <tbody>
                <cfoutput query="getpjt">
                <tr id="#pid#">
                    <!---<td>#project_Id#</td>--->
                    <td>&nbsp;</td>
                    <td style="text-transform: capitalize;">#name#</td>
                    <td>#description#</td>
                    <td>#startdate#</td>
                    <td>#enddate#</td>
                    <td><cfif isdefined('url.asnid') and #asnid# EQ 2>
                            <button type="button" class="btn btn-warning btn-sm activatepjt" id="#pid#"><i class="fa fa-unlock-alt" style="color:white;" aria-hidden="true"></i></button>
                        <cfelse>
                             <button type="button" class="btn btn-primary btn-sm editpjt" id="#pid#"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                            <button type="button" class="btn btn-danger btn-sm deletepjt" id="#pid#"><i class="fa fa-trash" aria-hidden="true"></i></button>
                        </cfif>
                    </td>
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
               $('#headerText').html('Close Project');
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
