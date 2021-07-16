$(document).ready(function(){
    $(document).on("click", ".editpjt", function(){
        console.log($(this).closest("tr").find("td:nth-child(2)").text());
        var row = $(this).closest("tr");
        var project_id = $(this).attr('id');
        var project_name = row.find("td:nth-child(2)").text();
        var p_description = row.find("td:nth-child(3)").text();
        var p_sdate = row.find("td:nth-child(4)").text();
        var p_edate = row.find("td:nth-child(5)").text();
        console.log(project_name)
        $('#modal-showAlert').modal('show');
      $('#headerText').html('Edit Project');
      $('#modal-showAlert .modal-body').html('<label>ID:</label><span style="margin-left: 50px">'+ project_id+'</span></br>'+
          '<div class="row"><label style="margin-left:15px;">ProjectName</label><div class="col-sm-4"><input type="text" style="width:50px;" name="upname1" class="form-control" id="upname" value='+project_name+'></div></div></br>'+
          '<div class="row mb-1"><label style="margin-left:15px;">Description</label><div style="margin-left: 16px;"><textarea rows="2"id="udesc" name="udesc1" class="form-control" style="width:160px;">'+p_description+'</textarea></div></div>'+
          '<div class="row"><label style="margin-left:15px;">StartDate</label><div class="col-sm-5"><input type="date" name="usdate1" id="usdate" class="form-control" value='+p_sdate+'></div></div></br>' +
          '<div class="row"><label style="margin-left:15px;">EndDate</label><div class="col-sm-5"><input type="date" name="uedate1" id="uedate" class="form-control" value='+p_edate+'></div></div>');
        $('#modal-showAlert .modal-footer .yes').hide();
        $('#modal-showAlert .modal-footer .update').show();
        $('#modal-showAlert .modal-footer .update').click(function(){
              console.log($('#upname').val());
              var u_pname = $('#upname').val();
              var u_desc = $('#udesc').val();
              var u_sdate = $('#usdate').val();
              var u_edate = $('#uedate').val();
            $.ajax({
                url: 'controller/projectmgnt.cfc?method=updateproject',
                type: 'get',
                data: {
                        pname : u_pname,
                        des : u_desc,
                        sdate : u_sdate,
                        edate : u_edate,
                        pid : project_id
                },
                success: function(data){
                    row.find("td:nth-child(1)").text(u_pname);
                    row.find("td:nth-child(2)").text(u_desc);
                    row.find("td:nth-child(3)").text(u_sdate);
                    row.find("td:nth-child(4)").text(u_edate);
                }
            })
        });

    });
    $(document).on("click", ".deletepjt", function(){
        var parentrow = $(this).closest("tr");
        var pid = $(this).attr('id');
        console.log($(this).attr('id'));
        $('#modal-showAlert').modal('show');
        $('#headerText').html('Close Project');
        $('#modal-showAlert .modal-body').html('Are you sure you want to close this project?');
        $('#modal-showAlert .modal-footer .update').hide();
        $('#modal-showAlert .modal-footer .yes').show();
        $('#modal-showAlert .modal-footer .yes').click(function(){
            $.ajax({
                url: 'controller/projectmgnt.cfc?method=deleteproject',
                type: 'get',
                data: {
                        pid : pid
                },
                success: function(data){
                    parentrow.remove();        
                }
            })
        });
    });
    $(document).on("click", ".deleteasnpjt", function(){
        var parentrow = $(this).closest("tr");
        var id = $(this).attr('id');
        console.log($(this).attr('id'));
        $('#modal-showAlert').modal('show');
        $('#headerText').html('Close Project For Employee');
        $('#modal-showAlert .modal-body').html('Are you sure you want to deactivate this project for employee?');
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