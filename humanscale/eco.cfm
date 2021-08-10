<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<cfoutput>
    <div class="container-fluid">
        <div class="row">
            <div class="col-4 mt-3">
                <button class="btn btn-info btn-sm btnlistprice" style="width:300px;">Eco/Rev Change</button>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-2">
                <input type="text" id="chgtype" name="chgtypename" style="width:120px;" value="Change Type">
            </div>
            <div class="col-1">
                <select id="updates" name="updatename" style="margin-left:-50px;">
                    <option value="1">BOM updates</option>
                    <option value="2">updates</option>
                </select>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-2">
                <input type="text" id="handstock" name="handstockname" style="width:120px;" value="On Hand Stock">
            </div>
            <div class="col-1">
                <select id="status" name="statusname" style="margin-left:-50px;">
                    <option value="1">Yes</option>
                    <option value="2">No</option>
                </select>
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
                                <th>No.</th>
                                <th>Item Code</th>                    
                                <th>Site</th>
                                <th>Remove Material</th>
                                <th>Original Qty</th>
                                <th>Remove Qty</th>
                                <th>Add Material</th>
                                <th>Add Qty</th>
                                <th>Backflush Location</th>
                                <th>Effective Date</th>
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
                                <td><input type="text" name="removematerialname" id="removematerial" class="form-control"></td>
                                <td><input type="text" name="originalqtyname" id="originalqty" class="form-control"></td>
                                <td><input type="text" name="removeqtyname" id="removeqty" class="form-control"></td>
                                <td><input type="text" name="addmaterialname" id="addmaterial" class="form-control"></td>
                                <td><input type="text" name="addqtyname" id="addqty" class="form-control"></td>
                                <td><input type="text" name="backflushname" id="backflush" class="form-control"></td>
                                <td><input type="text" name="effdatename" id="effdate" class="form-control"></td>
                            </tr>
                            <tr>
                                <td><input type="text" name="noname" id="no" class="form-control"></td>
                                <td><input type="text" name="itemcodename" id="itemcode" class="form-control itemname"></td>
                                <td><select id="site" name="sitename" class="form-control">
                                        <option value="1">Site1</option>
                                        <option value="2">Site2</option>
                                    <select>
                                </td>
                                <td><input type="text" name="removematerialname" id="removematerial" class="form-control"></td>
                                <td><input type="text" name="originalqtyname" id="originalqty" class="form-control"></td>
                                <td><input type="text" name="removeqtyname" id="removeqty" class="form-control"></td>
                                <td><input type="text" name="addmaterialname" id="addmaterial" class="form-control"></td>
                                <td><input type="text" name="addqtyname" id="addqty" class="form-control"></td>
                                <td><input type="text" name="backflushname" id="backflush" class="form-control"></td>
                                <td><input type="text" name="effdatename" id="effdate" class="form-control"></td>	
                            </tr>
                            <tr>
                                <td><input type="text" name="noname" id="no" class="form-control"></td>
                                <td><input type="text" name="itemcodename" id="itemcode" class="form-control itemname"></td>
                                <td><select id="site" name="sitename" class="form-control">
                                        <option value="1">Site1</option>
                                        <option value="2">Site2</option>
                                    <select>
                                </td>
                                <td><input type="text" name="removematerialname" id="removematerial" class="form-control"></td>
                                <td><input type="text" name="originalqtyname" id="originalqty" class="form-control"></td>
                                <td><input type="text" name="removeqtyname" id="removeqty" class="form-control"></td>
                                <td><input type="text" name="addmaterialname" id="addmaterial" class="form-control"></td>
                                <td><input type="text" name="addqtyname" id="addqty" class="form-control"></td>
                                <td><input type="text" name="backflushname" id="backflush" class="form-control"></td>
                                <td><input type="text" name="effdatename" id="effdate" class="form-control"></td>
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
                        '<td><input type="text" name="removematerialname" id="removematerial" class="form-control"></td>'+
                        '<td><input type="text" name="originalqtyname" id="originalqty" class="form-control"></td>'+
                        '<td><input type="text" name="removeqtyname" id="removeqty" class="form-control"></td>'+
                        '<td><input type="text" name="addmaterialname" id="addmaterial" class="form-control"></td>'+
                        '<td><input type="text" name="addqtyname" id="addqty" class="form-control"></td>'+
                        '<td><input type="text" name="backflushname" id="backflush" class="form-control"></td>'+
                        '<td><input type="text" name="effdatename" id="effdate" class="form-control"></td>'+
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