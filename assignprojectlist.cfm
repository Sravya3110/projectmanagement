<html>
    <head>
        <title>List of Assigned Projects</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/mystyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap4.min.css">
        <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap4.min.js"></script>
        <style>
            #table1_length {
                float: left;
            }
            #table1_filter {
                float: right;
                margin-right: 35px;
                width: 100px;
            }
            select {
                height: 29px !important;
            }
            option {
                font-size: 12px;
            }
            input[type="search"] {
                border: 1px solid black;
                width: 85% !important;
            }
            
            #table1_info {
                font-size: 12px;
                margin-right: 150px;
            }
            .pagination {
                height: 25px;
                font-size: 12px;
            }
            .css-serial {
                counter-reset: serial-number; /* Set the serial number counter to 0 */
            }
            .css-serial td:first-child:before {
                counter-increment: serial-number; /* Increment the serial number counter */
                content: counter(serial-number); /* Display the counter */
            }
            #sel {
                font-size: 12px;
            }
            p {
                font-size: 11px;
            }
            .form-control {
                 border: 1px solid black;
            }
            table {
                border-collapse: separate !important;
                border-spacing: 0 5px !important;
            }
            .popover {
                z-index: 9060;
                width: 500px;
                height: 80px;
                font-size: 12px;
            }
            .popover-header {
                font-size: 12px;
            }
            body {
                  font-family : "Myriad Pro Semibold", "Trebuchet MS", Arial, Helvetica, Tahoma, sans-serif; 
            }
          tbody {
              background-color: #F1F1F1;
          }
          td {
              text-transform: capitalize;
          }
        </style>
    </head>
    <body>
        <cfinclude template="includes/modalpopup.cfm">
        <cfinclude template="includes/header.cfm">
        <cfset getpjt = createobject("component","controller.projectmgnt").displayproject()>
        <cfset getemp = createobject("component","controller.projectmgnt").getallemployees()>
        <cfset getpjtemp = createobject("component","controller.projectmgnt").assignproject()>
        <!---<cfdump var="#getpjtemp#">--->
        <div class="container-fluid">
            <center>
                <h6 class="mt-2"><b>Resource List</b></h6>
                <cfif #session.deptid# eq 5>
                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-sm-1">
                                <p>Resource Status:</p>
                            </div>
                            <div class="col-sm-1">
                                <select id="sel" name="sel1" class="form-control selectpjt" style="margin-left:-30px;">
                                    <option value="3">Select</option>
                                    <option value="0">All</option>
                                    <option value="1">Active</option>
                                    <option value="2">InActive</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </cfif>
                <div style="width: 75%;border: 1px solid black;padding: 20px;margin: 10px;box-shadow: 0 4px 8px 0 rgba(0,0,0,0.4);" class="mt-3">
                    <table class="table table-borderless table-sm mt-5 css-serial" id="table1">
                        <thead>
                        <tr class="border border-dark">
                            <!--<th>ProjectId</th>-->
                            <th width="2%">S.No</th>
                            <th width="6%">EmployeeName</th>
                            <th width="6%">ProjectName</th>
                            <th width="3%">Allocation</th>
                            <cfif #session.deptid# eq 5>
                                <th width="5%">Actions
                                <a href="assignproject.cfm"><button type="button" style="background-color:#5bc0de;color:white;" class="btn btn-sm addpjt" style="margin-left:2px;"><i class="fa fa-plus" aria-hidden="true"></i></button></a></th>
                            </cfif>
                        </tr>
                        </thead>
                        <tbody>
                            <cfoutput query="getpjtemp">
                                <tr id="#getpjtemp.peid#">
                                    <!---<td>#project_Id#</td>--->
                                    <td>&nbsp;</td>
                                    <td style="text-transform: capitalize;">#getpjtemp.firstname#</td>
                                    <td style="text-transform: capitalize;">#getpjtemp.name#</td>
                                    <td>#getpjtemp.allocation#</td>
                                    <cfif #session.deptid# eq 5>
                                        <td><button type="button" style="color:green;" class="btn btn-sm editasnpjt" id="#getpjtemp.peid#" projectID ="#getpjtemp.projectID#" employeeID= "#getpjtemp.employeeId#"><i class="fa fa-pencil" aria-hidden="true"></i></button>
                                            <button type="button" style="color:red;" class="btn btn-sm deleteasnpjt" id="#getpjtemp.peid#"><i class="fa fa-trash" aria-hidden="true"></i></button>
                                        </td>
                                    </cfif>
                                </tr>
                            </cfoutput>
                        </tbody>
                    </table>
                </div>
            </center>
        </div>
    </body>
    <script>
        $(document).ready(function(){
            $('#table1').DataTable();
            var selval = "";
                <cfif isdefined('url.resourceid')>
                    <cfoutput>selval= #url.resourceid#</cfoutput>
                <cfelse>
                    <cfoutput>selval=1</cfoutput>
                </cfif>
                console.log(selval)
                $(".selectpjt option[value="+selval+"]").attr('selected',true);
            let viewvalue=0;
        $(document).on("click", ".editasnpjt", function(){
            var pjt="",emp="",curalcnew=0,project_details="";
            var row = $(this).closest("tr");
            var project_id = $(this).attr('id');
            var getprojectId =  $(this).attr('projectID');
            var getempid = $(this).attr('employeeID');
            var project_name = row.find("td:nth-child(3)").text();
            var e_name = row.find("td:nth-child(2)").text();
            var allocation = row.find("td:nth-child(4)").text();
            console.log(project_name,e_name,project_id,allocation);
            <cfoutput query="getpjt">     
                pjt = pjt + '<option value="#pid#" disabled>#name#</option>';
        </cfoutput>
        <cfoutput query="getemp">
                emp = emp + '<option value="#eId#" disabled>#firstName#</option>';
        </cfoutput>
        $.ajax({
                    url: 'controller/projectmgnt.cfc?method=getallocation',
                    type: 'get',
                    data: {
                            empid: getempid
                    },
                    success: function(data){
                    console.log(data);
                    var res = JSON.parse(data);
                        for(var j=0; j<res.DATA.length; j++){
                            curalcnew = curalcnew + res.DATA[j][0];
                            project_details = project_details + res.DATA[j][2] +':'+ res.DATA[j][0] + '%,\n';
                        }
                        $('input').attr('curalc',curalcnew);
                        $('#cur_allocation').html(curalcnew+'%');
                        $('#viewdetails').attr('data-content',project_details);
                        console.log(project_details);
                        //return curalcnew;  
                    },
            });  
        
            $('#modal-showAlert').modal('show');
        $('#headerText').html('Edit Resource Allocation');
        $('#modal-showAlert .modal-body').html('<div class="row mb-2"><div class="col-sm-3"><label>EmployeeName:</label></div><div class="col-sm-3" style="text-transform: capitalize;">'+e_name+'</div><div class="col-sm-3"><label>ProjectName:</label></div><div class="col-sm-3" style="text-transform: capitalize;">'+project_name+'</div></div>'+
            '<div class="row"><div class="col-sm-3"><label>CurrentAllocation:</label></div><div class="col-sm-3">'+allocation+'%</div><div class="col-sm-3"><label>NewAllocation:</label></div><div class="col-sm-3"><input type="text" style="width:50px;height:30px;margin-left:-5px;" class="form-control" id="ualc" name="ualc1" value='+0+' autocomplete="off"> %</div></div>'+
            '<div class="row"><div class="col-sm-3"><label>TotalAllocation:</label></div><div class="col-sm-1" id="cur_allocation" style="color:red;"></div><div class="col-sm-3"><a class="view" id="viewdetails" style="font-size:12px" data-trigger="hover" data-toggle="popover" title="ResourceDetails" data-placement="bottom">View Details</a></div></div>'+
            '<div class="row" id="errormsg" style="font-size:11px;margin-left:10px;"></div>');
            $("#upname").val(getprojectId);
            $("#uename").val(getempid);
            $(".modal-footer .update").attr('updatenew',project_id);
            $('#modal-showAlert .modal-footer .yes').hide();
            $('#modal-showAlert .modal-footer .update').show();
            /*$("#update1").attr('u_pid', $('#upname').val());
            $("#update1").attr('u_eid', $('#uename').val());
            $("#update1").attr('project_id', project_id);*/
        $("#update1").attr('project_id', project_id);
        
        });

        $('#update1').click(function(){
                var newattr = $(this).attr('project_id');
                var current_alc = $('input').attr('curalc');
                console.log(current_alc);
                //var u_pid = $('#upname').val();
                //var u_eid = $('#uename').val();
                var u_alc = $('#ualc').val();
                var u_pnametext = $('#upname option:selected').text();
                var u_emptext = $('#uename option:selected').text();
                var total = parseInt(u_alc) + parseInt(current_alc);
                console.log(u_pnametext,u_emptext,u_alc,total);
                if(total > 100){
                        $('#errormsg').html("Allocation greater than 100");
                        $('#errormsg').css({color:'red'})
                        return false;
                }
                    $.ajax({
                    url: 'controller/projectmgnt.cfc?method=updateprojectemployee',
                    type: 'get',
                    data: {
                            /*pid : u_pid,
                            eid : u_eid,*/
                            peid : newattr,
                            palc :  u_alc
                    },
                    success: function(data){
                        console.log(u_pnametext,newattr);
                        /*$('table').find('tr#'+newattr).find('td:eq(2)').text(u_pnametext);
                        $('table').find('tr#'+newattr).find('td:eq(1)').text(u_emptext);*/
                        $('table').find('tr#'+newattr).find('td:eq(3)').text(u_alc);
                        /*$('table').find('tr#'+newattr).find('td:eq(4) button').attr('projectID', u_pid);
                        $('table').find('tr#'+newattr).find('td:eq(4) button').attr('employeeID', u_eid);*/
                    }
                });
            });
            $(document).on('mouseover', '#viewdetails', function() {
                console.log("hi");
                $('#viewdetails').popover('show');
            });
            /*$("#viewdetails").popover({html : true, trigger: 'hover'}).popover('show');
            $('[data-toggle="popover"]').popover('show');
            $(document).on("click","#viewdetails",function(event){
                if( viewvalue > 0){
                    console.log("true");
                    $(this).popover('hide');
                    viewvalue--;
                }else {
                $("#" + event.currentTarget.id).popover({html : true}).popover('show');
                    viewvalue++;
                }
                console.log(viewvalue)
            });*/ 
        $(document).on("change", ".selectpjt", function(){
            var chgid = $(this).val();
            /*location.href = 'assignprojectlist.cfm?resourceid=' + chgid ;*/
            console.log(chgid);
            $.ajax({
                    url: 'controller/projectmgnt.cfc?method=assignproject',
                    type: 'get',
                    data: {
                            newid : chgid
                    },
                    success: function(data){
                        var pname="",ename="",peid="",pid="",eid="";
                        var res = JSON.parse(data);
                        console.log(res);
                        //$('tbody').html('');
                        $('#table1').DataTable().rows().remove();
                        for(var i=0; i < res.DATA.length; i++){
                            peid = res.DATA[i][0];
                            pid = res.DATA[i][1];
                            eid = res.DATA[i][2];
                            status = res.DATA[i][3];
                            pname = res.DATA[i][4];
                            ename = res.DATA[i][5];
                            allocation = res.DATA[i][6];
                            console.log(pname,ename,peid,status);
                            /*$('tbody').append('<tr id="'+peid+'"style="background-color:#F1F1F1;"><td></td><td>' +ename+'</td><td>' +pname+'</td><td>'+allocation+'</td>'+ ( status === 'A' ? '<td><button type="button" style="color:red;" class="btn btn-sm deleteasnpjt" title="Delete" id="'+peid+'"><i class="fa fa-trash" aria-hidden="true"></i></button>'+
                        '<button type="button" style="color:green;" class="btn btn-sm editasnpjt" title="Edit" style="margin-left:5px;" id="'+peid+'" projectID ='+pid+' employeeID= '+eid+'><i class="fa fa-pencil" aria-hidden="true"></i></button></td>':'<td> <button type="button" class="btn btn-sm activatepjt" style="color:#3276b1;" id="'+peid+'" title="Activate"><i class="fa fa-unlock-alt" aria-hidden="true"></i></button></td>')+'</tr>');*/
                    var new_row = $('#table1').DataTable().row.add([
                            '', ename, pname, allocation, ( status === 'A' ? '<button type="button" style="color:green;" class="btn btn-sm editasnpjt" title="Edit" style="margin-left:5px;" id="'+peid+'" projectID ='+pid+' employeeID= '+eid+'><i class="fa fa-pencil" aria-hidden="true"></i></button><button type="button" style="color:red;" class="btn btn-sm deleteasnpjt" title="Delete" id="'+peid+'"><i class="fa fa-trash" aria-hidden="true"></i></button>': '<button type="button" class="btn btn-sm activatepjt" style="color:#3276b1;" id="'+peid+'" title="Activate" pid="'+pid+'" eid="'+eid+'"><i class="fa fa-unlock-alt" aria-hidden="true"></i></button>')
                        ]).node().id = peid;
                        
                        //$( new_row ).id = peid;
                        $('#table1').DataTable().draw( false );
                        }
                        
                    }
                });
                /*$('#table1').DataTable();
                        $('table').show();*/
        });
        $(document).on("click", ".activatepjt", function(){
            console.log($(this).attr('id'));
            var idval = $(this).attr('id');
            var pid = $(this).attr('pid');
            var eid = $(this).attr('eid');
            console.log(idval,pid,eid);
            $('#modal-showAlert').modal('show');
                $('#headerText').html('Activate Resource Allocation');
                $('#modal-showAlert .modal-body').html('Are you sure you want to activate this Resource?');
                $('#modal-showAlert .modal-footer .update').hide();
                $('#modal-showAlert .modal-footer .yes').show();
                $('#modal-showAlert .modal-footer .yes').click(function(){
                $.ajax({
                    url: 'controller/projectmgnt.cfc?method=activateprojectemployee',
                    type: 'get',
                    data: {
                        aid : idval,
                        pid : pid,
                        eid : eid    
                    },
                    success: function(data){
                        console.log(data);
                        /*if(data === 'true'){
                            location.href = 'assignprojectlist.cfm';
                        }else {
                            $('#modal-showAlert').modal('show');
                            $('#headerText').html('Close Project');
                            $('#modal-showAlert .modal-body').html('Are you sure you want to activate this project?');
                            $('#modal-showAlert .modal-footer .update').hide();
                            $('#modal-showAlert .modal-footer .yes').show();
                        }*/
                        location.href = 'assignprojectlist.cfm';
                    }
                });
                });
        });
        $(document).on("click", ".deleteasnpjt", function(){
            var parentrow = $(this).closest("tr");
            var id = $(this).attr('id');
            console.log($(this).attr('id'));
            $('#modal-showAlert').modal('show');
            $('#headerText').html('Close Resource Allocation');
            $('#modal-showAlert .modal-body').html('Are you sure you want to close this Resource Allocation?');
            $('#modal-showAlert .modal-footer .update').hide();
            $('#modal-showAlert .modal-footer .yes').show();
            $('#modal-showAlert .modal-footer .yes').click(function(){
                $.ajax({
                    url: 'controller/projectmgnt.cfc?method=deleteasnproject',
                    type: 'get',
                    data: {
                            id : id
                    },
                    success: function(data){
                        parentrow.remove();        
                    }
                })
            });
        });
    });
    </script>
</html>
