<html>
   <head>
      <title>List page</title>
      <style>
      .t1 {
         text-decoration: none;
         color: white;
      }
      #navbarDropdown1 {
         color: #68737A;
      }
      .dropdown-menu a:hover
      {
      background-color: black !important;
      color: #80dfff !important;
      }
      </style>
   </head>
   <body>
      <div class="container-fluid">
         <cfoutput>
            <div class="row mt-1" style="background-color:##1975A4;color:white;height:50px;">
               <div class="col-sm-6">
                  <h5>Project Management System</h5>
               </div>
               <div class="col-sm-6 text-right">
                  <a href="" class="t1 mr-3"><b style="text-transform: capitalize;">#session.name#</b> <i class="fa fa-user" aria-hidden="true"></i></a>
                  <a href="index.cfm" class="t1"><b class="mr-1">Logout</b><i class="fa fa-power-off" aria-hidden="true"></i></a>
               </div>
            </div>
            <ul class="nav nav-tabs mt-1 bg-light">
               <li class="nav-item dmenu">
                     <a class="nav-link dropdown-toggle" href="" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Project
                     </a>
                     <div class="dropdown-menu sm-menu bg-dark">
                        <a class="dropdown-item text-white" href="projectList.cfm">Project List</a>
                        <a class="dropdown-item text-white" href="assignprojectlist.cfm">Resource List</a>
                  </div>
               </li>
               <!---<li class="nav-item">
                  <a class="nav-link" href="testing.cfm">Testing</a>
               </li>--->
            </ul>
         </cfoutput>
      </div>
   </body>
</html>