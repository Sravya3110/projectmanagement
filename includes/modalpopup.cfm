<div class="modal fade modal-warning" id="modal-showAlert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 9000;">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <span id="headerText"></span>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel"></h4>
        </div>
        <div class="modal-body"></div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default btn-sm no" data-dismiss="modal"><cfoutput>Cancel</cfoutput></button>
          <button type="button" class="btn btn-success btn-sm yes" data-dismiss="modal"><cfoutput>Yes</cfoutput></button>
          <button type="button" class="btn btn-success btn-sm update" data-dismiss="modal" id="update1"><cfoutput>Update</cfoutput></button>
        </div>
      </div>
    </div>
  </div>