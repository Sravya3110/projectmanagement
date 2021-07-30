<div class="modal fade modal-warning" id="modal-showAlert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 9000;">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header" style="background-color: #325D81;">
          <span id="headerText" style="color:white;"></span>
          <button type="button" style="color:white;" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel"></h4>
        </div>
        <div class="modal-body"></div>
        <div class="modal-footer">
          <button type="button" style="color:red;" class="btn btn-sm no" data-dismiss="modal"><cfoutput>Cancel</cfoutput></button>
          <button type="button" style="color:green;" class="btn btn-sm yes" data-dismiss="modal"><cfoutput>Yes</cfoutput></button>
          <button type="button" style="color:green;" class="btn btn-sm update" data-dismiss="modal" name="update" id="update1"><cfoutput>Update</cfoutput></button>
        </div>
      </div>
    </div>
  </div>