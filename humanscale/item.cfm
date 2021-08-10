<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<cfoutput>
	<div class="row">
        <div class="col-1 mt-3">
           <button class="btn btn-info btn-sm addline">Add Line</button>
        </div>
        <div class="col-2 mt-3">
            <button class="btn btn-info savetable">Save to continue</button>
        </div>
    </div>
    <div class="row">
        <div class="col-12 mt-3">
        	<div class="table-responsive">
                <table class="table table-striped table-bordered tablelist" cellpadding="4">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Item Number</th>                    
                            <th>Site</th>
                            <th>Requested New Product Code</th>
                            <th>Description (Max 40 chars)</th>
                            <th>Overview (Full Description)</th>
                            <th>U/M</th>
                            <th>Product Code</th>
                            <th>Family Code</th>
                            <th>Lead the Category</th>
                            <th>List Price</th>
                            <th>Vendor</th>
                            <th>Cost</th>
                            <th>Currency</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<tr>
                        	<td><input type="text" name="noname" id="no" class="form-control"></td>
                            <td><input type="text" name="itemnoname" id="itemno" class="form-control itemname"></td>
                            <td><select id="site" name="sitename" class="form-control">
                                    <option value="1">Site1</option>
                                    <option value="2">Site2</option>
                                <select>
                            </td>
                            <td><input type="text" name="newpcodename" id="newpcode" class="form-control"></td>
                            <td><input type="text" name="descriptionname" id="description" class="form-control"></td>
                            <td><input type="text" name="overviewname" id="overview" class="form-control"></td>
                            <td><select id="um" name="umname" class="form-control">
                                    <option value="1">Um1</option>
                                    <option value="2">Um2</option>
                                <select>
                            </td>
                            <td><select id="pcode" name="pcodename" class="form-control">
                                    <option value="1">Productcode1</option>
                                    <option value="2">Productcode2</option>
                                <select>
                            </td>
                            <td><select id="famcode" name="famcodename" class="form-control">
                                    <option value="1">Familycode1</option>
                                    <option value="2">Familycode2</option>
                                <select>
                            </td>
                            <td><select id="leadcat" name="leadcatname" class="form-control">
                                    <option value="1">Leadcategory1</option>
                                    <option value="2">Leadcategory2</option>
                                <select>
                            </td>
                            <td><input type="text" name="listpricename" id="listprice" class="form-control"></td>
                            <td><input type="text" name="vendorname" id="vendor" class="form-control"></td>
                            <td><input type="text" name="costname" id="cost" class="form-control"></td>
                            <td><input type="text" name="currencyname" id="currency" class="form-control"></td>
                        </tr>
                        <tr>
                        	<td><input type="text" name="noname" id="no" class="form-control"></td>
                            <td><input type="text" name="itemnoname" id="itemno" class="form-control itemname"></td>
                            <td><select id="site" name="sitename" class="form-control">
                                    <option value="1">Site1</option>
                                    <option value="2">Site2</option>
                                <select>
                            </td>
                            <td><input type="text" name="newpcodename" id="newpcode" class="form-control"></td>
                            <td><input type="text" name="descriptionname" id="description" class="form-control"></td>
                            <td><input type="text" name="overviewname" id="overview" class="form-control"></td>
                            <td><select id="um" name="umname" class="form-control">
                                    <option value="1">Um1</option>
                                    <option value="2">Um2</option>
                                <select>
                            </td>
                            <td><select id="pcode" name="pcodename" class="form-control">
                                    <option value="1">Productcode1</option>
                                    <option value="2">Productcode2</option>
                                <select>
                            </td>
                            <td><select id="famcode" name="famcodename" class="form-control">
                                    <option value="1">Familycode1</option>
                                    <option value="2">Familycode2</option>
                                <select>
                            </td>
                            <td><select id="leadcat" name="leadcatname" class="form-control">
                                    <option value="1">Leadcategory1</option>
                                    <option value="2">Leadcategory2</option>
                                <select>
                            </td>
                            <td><input type="text" name="listpricename" id="listprice" class="form-control"></td>
                            <td><input type="text" name="vendorname" id="vendor" class="form-control"></td>
                            <td><input type="text" name="costname" id="cost" class="form-control"></td>
                            <td><input type="text" name="currencyname" id="currency" class="form-control"></td>
                        </tr>
                        <tr>
                        	<td><input type="text" name="noname" id="no" class="form-control"></td>
                            <td><input type="text" name="itemnoname" id="itemno" class="form-control itemname"></td>
                            <td><select id="site" name="sitename" class="form-control">
                                    <option value="1">Site1</option>
                                    <option value="2">Site2</option>
                                <select>
                            </td>
                            <td><input type="text" name="newpcodename" id="newpcode" class="form-control"></td>
                            <td><input type="text" name="descriptionname" id="description" class="form-control"></td>
                            <td><input type="text" name="overviewname" id="overview" class="form-control"></td>
                            <td><select id="um" name="umname" class="form-control">
                                    <option value="1">Um1</option>
                                    <option value="2">Um2</option>
                                <select>
                            </td>
                            <td><select id="pcode" name="pcodename" class="form-control">
                                    <option value="1">Productcode1</option>
                                    <option value="2">Productcode2</option>
                                <select>
                            </td>
                            <td><select id="famcode" name="famcodename" class="form-control">
                                    <option value="1">Familycode1</option>
                                    <option value="2">Familycode2</option>
                                <select>
                            </td>
                            <td><select id="leadcat" name="leadcatname" class="form-control">
                                    <option value="1">Leadcategory1</option>
                                    <option value="2">Leadcategory2</option>
                                <select>
                            </td>
                            <td><input type="text" name="listpricename" id="listprice" class="form-control"></td>
                            <td><input type="text" name="vendorname" id="vendor" class="form-control"></td>
                            <td><input type="text" name="costname" id="cost" class="form-control"></td>
                            <td><input type="text" name="currencyname" id="currency" class="form-control"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12 mt-3 text-end">
        	<input tyype="file" name="itemAttachment" id="itemAttachment" class="visually-hidden"/>
        	<input tyype="file" name="bomAttachment" id="bomAttachment" class="visually-hidden"/>
           <button class="btn btn-info btn-sm btnitemAttachment">Item Details Attachment</button>
           <button class="btn btn-info btn-sm btnBOMAttachment">BOM Details Attachment</button>
        </div>
    </div>
    <div class="modal fade modal-warning" id="modal-showAlert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span id="headerText"></span>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body"></div>
            </div>
        </div>
    </div>
</cfoutput>
<script>
	$(document).ready(function () {
		$('.btnitemAttachment').click(function(){
			$('#itemAttachment').trigger('click');
		});
		$('.btnBOMAttachment').click(function(){
			$('#bomAttachment').trigger('click');
		});
        $(".addline").click(function(){
            var actions = '<button class="btn btn-danger deleterow" id="0" name="delbtn" title="delete"><i class="fa fa-times"></i></button>';
            var row = '<tr>'+
                       '<td><input type="text" name="noname" id="no" class="form-control"></td>'+
                       '<td><input type="text" name="itemnoname" id="itemno" class="form-control"></td>'+
                       '<td><select id="site" name="sitename" class="form-control"><option value="1">Site1</option><option value="2">Site2</option><select></td>'+
                       '<td><input type="text" name="newpcodename" id="newpcode" class="form-control"></td>'+
                       '<td><input type="text" name="descriptionname" id="description" class="form-control"></td>'+
                       '<td><input type="text" name="overviewname" id="overview" class="form-control"></td>'+
                       '<td><select id="um" name="umname" class="form-control"><option value="1">Um1</option><option value="2">Um2</option><select></td>'+
                       '<td><select id="pcode" name="pcodename" class="form-control"><option value="1">Productcode1</option><option value="2">Productcode2</option><select></td>'+
                       '<td><select id="famcode" name="famcodename" class="form-control"><option value="1">Familycode1</option><option value="2">Familycode2</option><select></td>'+
                       '<td><select id="leadcat" name="leadcatname" class="form-control"><option value="1">Leadcategory1</option><option value="2">Leadcategory2</option><select></td>'+
                       '<td><input type="text" name="listpricename" id="listprice" class="form-control"></td>'+
                       '<td><input type="text" name="vendorname" id="vendor" class="form-control"></td>'+
                       '<td><input type="text" name="costname" id="cost" class="form-control"></td>'+
                       '<td><input type="text" name="currencyname" id="currency" class="form-control"></td>'+
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
                if(itemnoval === ""){
                    $(this).find("input.itemname").css("border","1px solid red");
                    $(this).find("input.itemname").html('<div>Required</div>')
                   return false;
                }else {
                    $(this).find("input.itemname").css("border","none");
                }
            });
        });
        $(document).on("click", "#overview", function(){
            var overview = $(this).val();
            console.log(overview);
            if(overview != ""){
            $('#modal-showAlert').modal('show');
            $('#headerText').html('Overview Full Description');
            $('#modal-showAlert .modal-body').html(overview);
            }
        });
	});
</script>