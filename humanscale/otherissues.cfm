<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<cfoutput>
    <div class="container-fluid">
        <div class="row">
            <div class="col-4 mt-3">
                <button class="btn btn-info btn-sm btnlistprice" style="width:300px;">Issue Details</button>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-1">
            <button class="btn btn-info btn-sm addline">Add Line</button>
            </div>
            <div class="col-2">
                <button class="btn btn-info btn-sm savetable">Save to continue</button>
            </div>
        </div>
        <div class="row">
            <div class="col-12 mt-3">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered tablelist" cellpadding="4">
                        <thead>
                            <tr>
                                <th width="10%">No.</th>
                                <th width="15%">Item Code</th>                    
                                <th>Site</th>
                                <th width="20%">Issue Type</th>
                                <th>Issue Details</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="text" name="noname" id="no" class="form-control"></td>
                                <td><input type="text" name="itemcodename" id="itemcode" class="form-control itemname"></td>
                                <td><select id="site" name="sitename" class="form-control">
                                        <option value="1">Site1</option>
                                        <option value="2">Site2</option>
                                    <select>
                                </td>
                                <td><select name="issuetypename" id="issuetype" class="form-control">
                                        <option value="1">Configuration Error</option>
                                        <option value="2">Item Attribute updates</option>
                                        <option value="3">Others</option>
                                    </select>
                                </td>
                                <td><input type="text" name="issuedetailsname" id="issuedetails" class="form-control"></td>
                            </tr>
                            <tr>
                                <td><input type="text" name="noname" id="no" class="form-control"></td>
                                <td><input type="text" name="itemcodename" id="itemcode" class="form-control itemname"></td>
                                <td><select id="site" name="sitename" class="form-control">
                                        <option value="1">Site1</option>
                                        <option value="2">Site2</option>
                                    <select>
                                </td>
                                <td><select name="issuetypename" id="issuetype" class="form-control">
                                        <option value="1">Configuration Error</option>
                                        <option value="2">Item Attribute updates</option>
                                        <option value="3">Others</option>
                                    </select>
                                </td>
                                <td><input type="text" name="issuedetailsname" id="issuedetails" class="form-control"></td>
                            </tr>
                            <tr>
                                <td><input type="text" name="noname" id="no" class="form-control"></td>
                                <td><input type="text" name="itemcodename" id="itemcode" class="form-control itemname"></td>
                                <td><select id="site" name="sitename" class="form-control">
                                        <option value="1">Site1</option>
                                        <option value="2">Site2</option>
                                    <select>
                                </td>
                                <td><select name="issuetypename" id="issuetype" class="form-control">
                                        <option value="1">Configuration Error</option>
                                        <option value="2">Item Attribute updates</option>
                                        <option value="3">Others</option>
                                    </select>
                                </td>
                                <td><input type="text" name="issuedetailsname" id="issuedetails" class="form-control"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</cfoutput>
<script>
	$(document).ready(function () {
        $(".addline").click(function(){
            var actions = '<button class="btn btn-danger deleterow" id="0" name="delbtn" title="delete"><i class="fa fa-times"></i></button>';
            var row = '<tr>'+
                        '<td><input type="text" name="noname" id="no" class="form-control"></td>'+
                        '<td><input type="text" name="itemcodename" id="itemcode" class="form-control"></td>'+
                        '<td><select id="site" name="sitename" class="form-control"><option value="1">Site1</option><option value="2">Site2</option><select></td>'+
                        '<td><select name="issuetypename" id="issuetype" class="form-control"><option value="1">Configuration Error</option><option value="2">Item Attribute updates</option><option value="3">Others</option></select></td>'+
                        '<td><input type="text" name="issuedetailsname" id="issuedetails" class="form-control"></td>'+
                        '<td>'+actions+'</td>'
                      '</tr>';
             $(".tablelist").append(row);
        });
        $(document).on("click", ".deleterow", function(){
            $(this).parents("tr").remove();
        });
        $(".savetable").click(function(){
            $("tbody tr").each(function() {
                var itemnoval = $(this).find("input.itemname").val(); 
                console.log(itemnoval);
                if(itemnoval == ""){
                    $("#msg1").html("Required");
                }
            });
        });
	});
</script>