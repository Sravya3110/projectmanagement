<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
img {
  border: 1px solid #ddd;
  border-radius: 4px;
  padding: 5px;
  width: 150px;
}

img:hover {
  box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}
</style>
<cfoutput>
    <div class="container-fluid">
        <img src="images/image1.png" alt="Forest" style="width:150px" id="myimg1" class="mt-3 myimg"></br>
        <img src="images/image2.png" alt="Forest" style="width:150px" id="myimg1" class="mt-3 myimg"></br>
        <img src="images/image3.jpg" alt="Forest" style="width:150px" id="myimg1" class="mt-3 myimg">
    </div>
<div class="modal fade modal-warning" id="modal-showAlert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <span id="headerText"></span>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                <button type="button" style="color:red;" class="btn btn-sm no" data-dismiss="modal"><cfoutput>Cancel</cfoutput></button>
                <!---<button type="button" style="color:green;" class="btn btn-sm download" data-dismiss="modal" id="downloadimg"><cfoutput>Download</cfoutput></button>--->
            </div>
        </div>
    </div>
</div>
</cfoutput>
<script>
$(document).ready(function(){
	$('.myimg').click(function(){
        var imgsrc = $(this).attr('src');
  		$('#modal-showAlert').modal('show')
          console.log(imgsrc);
          $('#headerText').html('Image');
          $('#modal-showAlert .modal-body').html('<img src="'+imgsrc+'" alt="Forest" style="width:150px" id="myimgmodal" class="mt-3">');
          $('#modal-showAlert .modal-footer').html('<a href="'+imgsrc+'" download><button type="button" style="color:green;" class="btn btn-sm download">Download</button></a>');
	});
    
});
</script>