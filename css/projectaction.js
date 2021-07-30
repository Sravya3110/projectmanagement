$(document).ready(function(){
    $(document).on("click", ".editpjt", function(){
        console.log($(this).closest("tr").find("td:nth-child(2)").text());
        var row = $(this).closest("tr");
        var project_id = $(this).attr('id');
        var project_name = row.find("td:nth-child(2)").text();
        var p_description = row.find("td:nth-child(3)").text();
        var p_sdate = row.find("td:nth-child(4)").text();
        var p_edate = row.find("td:nth-child(5)").text();
        console.log(project_name,p_sdate)
        $('#modal-showAlert').modal('show');
      $('#headerText').html('Edit Project');
      $('#modal-showAlert .modal-body').html('<div class="row mb-2"><div class="col-sm-3"><label>ProjectName:</label></div><div class="col-sm-5" style="margin-left:25px;text-transform:capitalize;">'+project_name+'</div></div>'+
          '<div class="row mb-2"><div class="col-sm-3"><label>Description:</label></div><div class="col-sm-5"  style="overflow:hidden;"><textarea rows="2"id="udesc" name="udesc1" class="form-control" style="width:160px;font-size:13px;">'+p_description+'</textarea></div></div>'+
          '<div class="row mb-2"><div class="col-sm-3"><label>StartDate:</label></div><div class="col-sm-5"><input type="date" name="usdate1" id="usdate" class="form-control" value='+p_sdate+'></div></div>' +
          '<div class="row mb-2"><div class="col-sm-3"><label>EndDate:</label></div><div class="col-sm-5"><input type="date" name="uedate1" id="uedate" class="form-control" value='+p_edate+'></div></div>');
        $('#modal-showAlert .modal-footer .yes').hide();
        $('#modal-showAlert .modal-footer .update').show();
        $("#update1").attr('newproject_id', project_id);
        /*$('#modal-showAlert .modal-footer .update').click(function(){
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
                    row.find("td:nth-child(2)").text(u_pname);
                    row.find("td:nth-child(3)").text(u_desc);
                    row.find("td:nth-child(4)").text(u_sdate);
                    row.find("td:nth-child(5)").text(u_edate);
                }
            })
        });*/

    });
    $('#update1').click(function(){
        console.log($('#upname').val());
        var u_pname = $('#upname').val();
        var u_desc = $('#udesc').val();
        var u_sdate = $('#usdate').val();
        var u_edate = $('#uedate').val();
        var project_id = $(this).attr('newproject_id');
        $.ajax({
            url: 'controller/projectmgnt.cfc?method=updateproject',
            type: 'get',
            data: {
                    //pname : u_pname,
                    des : u_desc,
                    sdate : u_sdate,
                    edate : u_edate,
                    pid : project_id
            },
            success: function(data){
                //row.find("td:nth-child(2)").text(u_pname);
                //$('table').find('tr#'+project_id).find('td:eq(1)').text(u_pname);
                $('table').find('tr#'+project_id).find('td:eq(2)').text(u_desc);
                $('table').find('tr#'+project_id).find('td:eq(3)').text(u_sdate);
                $('table').find('tr#'+project_id).find('td:eq(4)').text(u_edate);
            }
        })
    });
    $(document).on("click", ".deletepjt", function(){
        var parentrow = $(this).closest("tr");
        var pid = $(this).attr('id');
        var edate = new Date().toISOString().slice(0, 10);
        console.log($(this).attr('id'));
        $('#modal-showAlert').modal('show');
        $('#headerText').html('Close Project');
        $('#modal-showAlert .modal-body').html('Are you sure you want to close this project Resource allocated to this project will be closed?');
        $('#modal-showAlert .modal-footer .update').hide();
        $('#modal-showAlert .modal-footer .yes').show();
        $('#modal-showAlert .modal-footer .yes').click(function(){
            $.ajax({
                url: 'controller/projectmgnt.cfc?method=deleteproject',
                type: 'get',
                data: {
                        pid : pid,
                        edate : edate
                },
                success: function(data){
                    parentrow.remove(); 
                    $.ajax({
                        url: 'controller/projectmgnt.cfc?method=deleteresource',
                        type: 'get',
                        data: {
                                pid : pid
                        },
                        success: function(data){
                            console.log(data);
                        }
                    });
                }
            })
        });
    });
});