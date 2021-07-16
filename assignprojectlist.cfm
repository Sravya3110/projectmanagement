<html>
    <head>
        <title>List of Projects</title>
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
        <style>
            #table1_length {
                float: left;
            }
            #table1_filter {
                float: right;
                margin-right: 30px;
            }
            select {
                height: 29px !important;
            }
            option {
                font-size: 12px;
            }
            input {
                width: 85% !important;
                height: 25px !important;
            }
            #table1_info {
                font-size: 14px;
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
        </style>
        <script>
            $(document).ready(function () {
                $('#table1').DataTable();
            });
        </script>
    </head>
    <body>
        <cfinclude template="includes/modalpopup.cfm">
        <cfset getpjt = createobject("component","controller.projectmgnt").displayproject()>
        <cfset getemp = createobject("component","controller.projectmgnt").getallemployees()>
        <cfset getpjtemp = createobject("component","controller.projectmgnt").assignproject()>
        <div class="container">
        <center>
            <h5 class="mt-3">Assigned Projects</h5>
            <div class="col-md-7 mt-5">
                <div class="row">
                    <div class="col-md-2">
                        <label>Select Projects:</label>
                    </div>
                    <div class="col-md-3">
                        <select id="sel" name="sel1" class="form-control selectpjt" >
                            <option>Select</option>
                            <option value="0">All</option>
                            <option value="1">Active</option>
                            <option value="2">InActive</option>
                        </select>
                    </div>
                </div>
            </div>
            <div style="width:55%" class="mt-3">
            <table class="table table-bordered table-sm table-striped mt-5 css-serial" id="table1">
                <thead>
                <tr>
                    <!--<th>ProjectId</th>-->
                    <th width="2%" style="text-align:center;">S.No</th>
                    <th width="5%" style="text-align:center;">ProjectName</th>
                    <th width="5%" style="text-align:center;">EmployeeName</th>
                    <th width="5%" style="text-align:center;">Actions
                    <a href="assignproject.cfm"><button type="button" class="btn btn-success btn-sm addpjt" style="margin-left:2px;"><i class="fa fa-plus" aria-hidden="true"></i></button></a></th>
                </tr>
                </thead>
                <tbody>
                <cfoutput query="getpjtemp">
                <tr>
                    <!---<td>#project_Id#</td>--->
                    <td id="td1">&nbsp;</td>
                    <td id="td2">#name#</td>
                    <td id="td3">#firstname#</td>
                    <td id="td4"><button type="button" class="btn btn-danger btn-sm deleteasnpjt" id="#peid#"><i class="fa fa-trash" aria-hidden="true"></i></button>
                    <button type="button" class="btn btn-primary btn-sm editasnpjt" id="#peid#" projectID =#projectID# employeeID= #employeeId#><i class="fa fa-pencil" aria-hidden="true"></i></button></td>
                </tr>
                </cfoutput>
                </tbody>
            </table>
            </div>
        </center>
        </div>
    </body>
    <script>
       $(document).on("click", ".editasnpjt", function(){
        var pjt="",emp="";
        console.log($(this).closest("tr").find("td:nth-child(2)").text());
        var row = $(this).closest("tr");
        var project_id = $(this).attr('id');
        var getprojectId =  $(this).attr('projectID');
        var getempid = $(this).attr('employeeID');
        var project_name = row.find("td:nth-child(2)").text();
        var e_name = row.find("td:nth-child(3)").text();
        console.log(project_name,e_name);
        <cfoutput query="getpjt">     
        pjt = pjt + '<option value="#pid#" <cfif getpjt.name EQ getpjtemp.name>selected</cfif>>#name#</option>';
       </cfoutput>
       <cfoutput query="getemp">
            emp = emp + '<option value="#eId#">#firstName#</option>';
       </cfoutput>
        $('#modal-showAlert').modal('show');
      $('#headerText').html('Edit Project');
      $('#modal-showAlert .modal-body').html('<label>ID:</label><span style="margin-left: 25px">'+ project_id+'</span></br>'+
          '<div class="row"><label style="margin-left:15px;">ProjectName</label><select class="form-control" id="upname" name="upname1" style="width:160px;height:30px;font-size:14px;">'+ pjt +'</select></div></br>'+
          '<div class="row mb-1"><label style="margin-left:15px;">Employeename</label><select class="form-control" id="uename" name="uename1" style="width:160px;height:30px;font-size:14px;">'+ emp +'</select></div>');
        $("#upname").val(getprojectId);
        $("#uename").val(getempid);
        $('#modal-showAlert .modal-footer .yes').hide();
        $('#modal-showAlert .modal-footer .update').show();
        $('#modal-showAlert .modal-footer .update').click(function(){
              console.log($('#upname option:selected').text());
              var u_pid = $('#upname').val();
              var u_eid = $('#uename').val();
              var u_pnametext = $('#upname option:selected').text();
              var u_emptext = $('#uename option:selected').text();
                $.ajax({
                url: 'controller/projectmgnt.cfc?method=updateprojectemployee',
                type: 'get',
                data: {
                        pid : u_pid,
                        peid : u_eid,
                        eid : project_id
                },
                success: function(data){
                   row.find("td:nth-child(1)").text(u_pnametext);
                   row.find("td:nth-child(2)").text(u_emptext);
                }
            })
        });

    });
     $(document).on("change", ".selectpjt", function(){
          var chgid = $(this).val();
         
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
                    $('tbody').html('');
                    for(var i=0; i < res.DATA.length; i++){
                        peid = res.DATA[i][0];
                        pid = res.DATA[i][1];
                        eid = res.DATA[i][2];
                        pname = res.DATA[i][4];
                        ename = res.DATA[i][5];
                        console.log(pname,ename,peid);
                        $('tbody').append('<tr><td></td><td>' +pname+'</td><td>' +ename+'</td><td><button type="button" class="btn btn-danger btn-sm deleteasnpjt" id="'+peid+'"><i class="fa fa-trash" aria-hidden="true"></i></button>'+
                    '<button type="button" class="btn btn-primary btn-sm editasnpjt" style="margin-left:5px;" id="'+peid+'" projectID ='+pid+' employeeID= '+eid+'><i class="fa fa-pencil" aria-hidden="true"></i></button></td></tr>');
                        //$('tbody').append($('#td3').html(ename));
                    }

                }
            })
     });
    </script>
</html>
