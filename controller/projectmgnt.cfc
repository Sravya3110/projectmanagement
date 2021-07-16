<cfcomponent>
    <cffunction name="insertproject" access="public">
        <cfargument name="pname" required="true">
        <cfargument name="pdesc" required="true">
        <cfargument name="psdate" required="true">
        <cfargument name="pedate" required="true">
        <cfquery name="local.chkpjt" datasource="projectmanagement">
            SELECT 1 
            FROM project.dbo.project
            WHERE name = <cfqueryparam value="#arguments.pname#" cfsqltype="varchar">
        </cfquery>
        <cfif local.chkpjt.recordcount GT 0>
            <cfreturn false>
        <cfelse>
            <cfquery name="local.insnewpjt" datasource="projectmanagement" result="insres">
                INSERT INTO project.dbo.project (name,description,startdate,enddate)
                VALUES (<cfqueryparam value = "#arguments.pname#" cfsqltype="varchar">,
                    <cfqueryparam value = "#arguments.pdesc#" cfsqltype="varchar">,
                    <cfqueryparam value = "#arguments.psdate#" cfsqltype="date">,
                    <cfqueryparam value = "#arguments.pedate#" cfsqltype="date">)
            </cfquery>
                <cfif insres.recordcount GT 0>
                    <cfreturn true>
                <cfelse>
                    <cfreturn false>
                </cfif>
        </cfif>
    </cffunction>
    <cffunction name="displayproject" access="public">
        <cfquery name="local.selprojects" datasource="projectmanagement">
            SELECT pid,name,startdate,enddate,status,description
            FROM project.dbo.project
            <cfif isdefined('url.asnid')>
                <cfif url.asnid eq 0>
                    WHERE 1=1;
                <cfelseif url.asnid eq 1>
                    WHERE status='A';
                <cfelseif url.asnid eq 2>
                    WHERE status='I';
                </cfif>
            <cfelse>
                WHERE status='A';
            </cfif>
        </cfquery>
        <cfreturn local.selprojects>
    </cffunction>
    <cffunction name="updateproject" access="remote">
        <cfargument name="pname" required="true">
        <cfargument name="des">
        <cfargument name="sdate">
        <cfargument name="edate">
        <cfargument name="pid" required="true">
        <cfquery name="updtpjt" datasource="projectmanagement">
            UPDATE project.dbo.project
            SET name = <cfqueryparam value="#arguments.pname#" cfsqltype="varchar">,
                description = <cfqueryparam value="#arguments.des#" cfsqltype="varchar">,
                startdate = <cfqueryparam value="#arguments.sdate#" cfsqltype="date">,
                enddate = <cfqueryparam value="#arguments.edate#" cfsqltype="date">
            WHERE pid = <cfqueryparam value="#arguments.pid#" cfsqltype="integer">
        </cfquery>
    </cffunction>
    <cffunction name="deleteproject" access="remote">
        <cfargument name="pid" required="true">
        <cfquery name="delpjt" datasource="projectmanagement">
            UPDATE project.dbo.project
            SET status='I'
            WHERE pid = <cfqueryparam value="#arguments.pid#" cfsqltype="integer">
        </cfquery>
    </cffunction>
    <cffunction name="assignproject" access="remote" returnformat="json">
        <cfargument name="newid" required="false">
        <cfquery name="asgnpjt" datasource="projectmanagement">
            SELECT project.dbo.projectemployee.peid,project.dbo.projectemployee.projectId,project.dbo.projectemployee.employeeId,project.dbo.projectemployee.status,project.dbo.project.name,employee.dbo.employee.firstName 
            FROM project.dbo.projectemployee 
            INNER JOIN project.dbo.project ON project.dbo.project.pid = project.dbo.projectemployee.projectId
            INNER JOIN employee.dbo.employee ON employee.dbo.employee.eId = project.dbo.projectemployee.employeeId
            <cfif isdefined('newid')>
                <cfif #arguments.newid# eq 0>
                    WHERE 1=1
                <cfelseif #arguments.newid# eq 1>
                     WHERE project.dbo.projectemployee.status='A'
                <cfelseif #arguments.newid# eq 2>
                     WHERE project.dbo.projectemployee.status='I'
                 </cfif>
            <cfelse>
                WHERE project.dbo.projectemployee.status='A'
            </cfif>
                order by name;
        </cfquery>
        <cfreturn asgnpjt>
    </cffunction>
    <cffunction name="getallemployees" access="remote">
        <cfquery name="getallemp" datasource="projectmanagement">
            SELECT eId,firstName,lastName,status 
            FROM employee.dbo.employee
            WHERE status=1
        </cfquery>
        <cfreturn getallemp>
    </cffunction>
    <cffunction name="newassign" access="remote">
        <cfargument name="pid" required="true">
        <cfargument name="empid" required="true">
        <cftry>
        <cfloop list="#arguments.pid#" index="local.item"> 
            <cfquery name="local.checkproject" datasource="projectmanagement">
                    SELECT 1
                    FROM project.dbo.projectemployee
                    WHERE
                    employeeId = <cfqueryparam value='#arguments.empid#' cfsqltype="integer">
                    AND projectId = <cfqueryparam value='#local.item#' cfsqltype="integer">
                    AND status = <cfqueryparam value='A' cfsqltype="varchar">
            </cfquery>
                <cfif NOT local.checkproject.recordcount>             
                  <cfquery name="assignnew" datasource="projectmanagement" result="res">
                        INSERT INTO
                        project.dbo.projectemployee (projectId,employeeId)
                        VALUES (
                        <cfqueryparam value='#local.item#' cfsqltype="integer">,
                        <cfqueryparam value="#arguments.empid#" cfsqltype="integer">)
                  </cfquery>
               </cfif>
       </cfloop>
       <!---<cfif res.recordcount GT 0>
            <cfreturn true>
        <cfelse>
            <cfreturn false>
        </cfif>--->
            <cfreturn true>
        <cfcatch>
            <cfreturn false>
        </cfcatch>
        </cftry>
    </cffunction>
    <cffunction name="deleteasnproject" access="remote">
        <cfargument name="id" required="true">
        <cfquery name="delasnpjt" datasource="projectmanagement">
            UPDATE project.dbo.projectemployee
            SET status='I'
            WHERE peid = <cfqueryparam value="#arguments.id#" cfsqltype="integer">
        </cfquery>
    </cffunction>
    <cffunction name="updateprojectemployee" access="remote">
        <cfargument name="pid" required="true">
        <cfargument name="peid" required="true">
        <cfargument name="eid" required="true">
        <cfquery name="updatepjtemp" datasource="projectmanagement">
            UPDATE project.dbo.projectemployee
            SET projectId = <cfqueryparam value=#arguments.pid# cfsqltype="integer">,
            employeeId = <cfqueryparam value=#arguments.eid# cfsqltype="integer">
            WHERE peid = <cfqueryparam value=#arguments.peid# cfsqltype="integer">
        </cfquery>
        <cfreturn true>
    </cffunction>
    <cffunction name="activateproject" access="remote">
        <cfargument name="actid" required="true">
        <cfquery name="actpjt" datasource="projectmanagement">
            UPDATE project.dbo.project 
            SET status = 'A'
            WHERE pid = <cfqueryparam value="#arguments.actid#" cfsqltype="integer">
        </cfquery>
    </cffunction>
</cfcomponent>