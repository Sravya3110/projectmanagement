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
    <cffunction name="validlogin" access="remote">
        <cfargument name="mailid" required="true">
        <cfquery name="getempdetails" datasource="projectmanagement">
            select employee.dbo.employee.eId,employee.dbo.employee.firstName,employee.dbo.employee.lastName,employee.dbo.employee.DeptId
            FROM employee.dbo.employee 
            WHERE employee.dbo.employee.emailId = <cfqueryparam value="#arguments.mailid#" cfsqltype="varchar">
        </cfquery>
        <cfif getempdetails.recordcount GT 0>
            <cfset session.name="#getempdetails.firstName#">
            <cfset session.deptid="#getempdetails.DeptId#">
            <cfset session.empid="#getempdetails.eId#">
            <cfreturn true>
        <cfelse>
            <cfreturn false>
        </cfif>
    </cffunction>
    <cffunction name="displayproject" access="public">
        <cfquery name="local.selprojects" datasource="projectmanagement">
            SELECT pid,name,startdate,enddate,status,description
            FROM project.dbo.project
            <cfif isdefined('url.asnid')>
                <cfif url.asnid eq 0>
                    WHERE 1=1
                <cfelseif url.asnid eq 1 OR url.asnid eq 3>
                    WHERE status='A'
                <cfelseif url.asnid eq 2>
                    WHERE status='I'
                </cfif>
            <cfelse>
                WHERE status='A'
            </cfif>
                order by name;
        </cfquery>
            <cfreturn local.selprojects>
    </cffunction>
    <cffunction name="updateproject" access="remote">
        <!---<cfargument name="pname" required="true">--->
        <cfargument name="des">
        <cfargument name="sdate">
        <cfargument name="edate">
        <cfargument name="pid" required="true">
        <cfquery name="updtpjt" datasource="projectmanagement">
            UPDATE project.dbo.project
            SET description = <cfqueryparam value="#arguments.des#" cfsqltype="varchar">,
                startdate = <cfqueryparam value="#arguments.sdate#" cfsqltype="date">,
                enddate = <cfqueryparam value="#arguments.edate#" cfsqltype="date">
            WHERE pid = <cfqueryparam value="#arguments.pid#" cfsqltype="integer">
        </cfquery>
    </cffunction>
    <cffunction name="deleteproject" access="remote">
        <cfargument name="pid" required="true">
        <cfargument name="edate" required="true">
        <cfquery name="delpjt" datasource="projectmanagement">
            UPDATE project.dbo.project
            SET status='I',enddate = <cfqueryparam value="#arguments.edate#" cfsqltype="date">
            WHERE pid = <cfqueryparam value="#arguments.pid#" cfsqltype="integer">
        </cfquery>
    </cffunction>
    <cffunction name="assignproject" access="remote" returnformat="json">
        <cfargument name="newid" required="false">
        <cfquery name="asgnpjt" datasource="projectmanagement">
            SELECT project.dbo.projectemployee.peid,project.dbo.projectemployee.projectId,project.dbo.projectemployee.employeeId,
            project.dbo.projectemployee.status,project.dbo.project.name,employee.dbo.employee.firstName,project.dbo.projectemployee.allocation
            FROM project.dbo.projectemployee 
            INNER JOIN project.dbo.project ON project.dbo.project.pid = project.dbo.projectemployee.projectId
            INNER JOIN employee.dbo.employee ON employee.dbo.employee.eId = project.dbo.projectemployee.employeeId
            <cfif #session.deptid# eq 5>
                <cfif isdefined('newid')>
                    <cfif #arguments.newid# eq 0>
                        WHERE 1=1
                    <cfelseif #arguments.newid# eq 1 OR #arguments.newid# eq 3>
                        WHERE project.dbo.projectemployee.status='A'
                    <cfelseif #arguments.newid# eq 2>
                        WHERE project.dbo.projectemployee.status='I'
                    </cfif>
                <cfelse>
                    WHERE project.dbo.projectemployee.status='A'
                </cfif>
            <cfelse>
                WHERE project.dbo.projectemployee.employeeId=#session.empid# AND project.dbo.projectemployee.status='A'
            </cfif>
                order by firstName;
        </cfquery>
        <cfreturn asgnpjt>
    </cffunction>
    <cffunction name="getallemployees" access="remote">
        <cfquery name="getallemp" datasource="projectmanagement">
            SELECT eId,firstName,lastName,status 
            FROM employee.dbo.employee
            WHERE status=1;
        </cfquery>
        <cfreturn getallemp>
    </cffunction>
    <cffunction name="newassign" access="remote" returnFormat="json">
        <cfargument name="pid" required="true">
        <cfargument name="empid" required="true">
        <cfargument name="paid" required="true">
         <cfquery name="local.checkemployee" datasource="projectmanagement">
            SELECT 1
            FROM project.dbo.projectemployee
            WHERE
            employeeId = <cfqueryparam value='#arguments.empid#' cfsqltype="integer">
            AND projectId = <cfqueryparam value='#arguments.pid#' cfsqltype="integer">
            AND status = <cfqueryparam value='A' cfsqltype="varchar">
        </cfquery>
        <cfif NOT local.checkemployee.recordcount>          
            <cfquery name="assignnew" datasource="projectmanagement" result="res">
                INSERT INTO
                project.dbo.projectemployee (projectId,employeeId,allocation)
                VALUES (
                <cfqueryparam value='#arguments.pid#' cfsqltype="integer">,
                <cfqueryparam value="#arguments.empid#" cfsqltype="integer">,
                <cfqueryparam value="#arguments.paid#" cfsqltype="integer">)
            </cfquery>
            <cfreturn true>
        </cfif>
        <cfreturn false>
    </cffunction>
    <cffunction name="deleteasnproject" access="remote">
        <cfargument name="id" required="true">
        <cfquery name="delasnpjt" datasource="projectmanagement">
            UPDATE project.dbo.projectemployee
            SET status='I',allocation=0
            WHERE peid = <cfqueryparam value="#arguments.id#" cfsqltype="integer">
        </cfquery>
    </cffunction>
    <cffunction name="updateprojectemployee" access="remote">
        <!---<cfargument name="pid" required="true">
        <cfargument name="eid" required="true">--->
        <cfargument name="peid" required="true">
        <cfargument name="palc" required="true">
        <cfquery name="updatepjtemp" datasource="projectmanagement">
            UPDATE project.dbo.projectemployee
            SET allocation = <cfqueryparam value=#arguments.palc# cfsqltype="integer">
            WHERE peid = <cfqueryparam value=#arguments.peid# cfsqltype="integer">
        </cfquery>
        <cfreturn true>
    </cffunction>
    <cffunction name="activateproject" access="remote">
        <cfargument name="actid" required="true">
        <cfquery name="actpjt" datasource="projectmanagement">
            UPDATE project.dbo.project 
            SET status = 'A',enddate = NULL 
            WHERE pid = <cfqueryparam value="#arguments.actid#" cfsqltype="integer">
        </cfquery>
    </cffunction>
    <cffunction name="activateprojectemployee" access="remote" returnformat="json">
        <cfargument name="aid" required="true">
        <cfargument name="pid" required="true">
        <cfargument name="eid" required="true">
        <cfquery name="local.checkresource" datasource="projectmanagement">
            SELECT 1
            FROM project.dbo.projectemployee
            WHERE
            employeeId = <cfqueryparam value='#arguments.eid#' cfsqltype="integer">
            AND projectId = <cfqueryparam value='#arguments.pid#' cfsqltype="integer">
            AND status = <cfqueryparam value='A' cfsqltype="varchar">
        </cfquery>
        <cfif NOT local.checkresource.recordcount> 
            <cfquery name="updatepjtemp" datasource="projectmanagement">
                UPDATE project.dbo.projectemployee
                SET status = 'A'
                WHERE peid = <cfqueryparam value="#arguments.aid#" cfsqltype="integer">
            </cfquery>
            <cfreturn true>
        </cfif>
            <cfreturn false>
    </cffunction>
    <cffunction name="getallocation" access="remote" returnformat="json">
        <cfargument name="empid" required="true">
        <cfquery name="getalc" datasource="projectmanagement">
            SELECT sum(allocation) as total,employee.dbo.employee.firstName,project.dbo.project.name,employee.dbo.employee.eId
            FROM project.dbo.projectemployee 
            INNER JOIN project.dbo.project ON project.dbo.project.pid = project.dbo.projectemployee.projectId
            INNER JOIN employee.dbo.employee ON employee.dbo.employee.eId = project.dbo.projectemployee.employeeId
			where project.dbo.projectemployee.employeeId= <cfqueryparam value="#arguments.empid#" cfsqltype="integer"> and project.dbo.projectemployee.status='A'
            group by project.dbo.project.name,employee.dbo.employee.firstName,employee.dbo.employee.eId;
        </cfquery>
        <cfif getalc.recordcount gt 0>
            <cfreturn getalc>
        <cfelse>
            <cfquery name="selemp" datasource="projectmanagement">
                select 0 as total ,employee.dbo.employee.firstname ,'No project' as name,employee.dbo.employee.eId from employee.dbo.employee where employee.dbo.employee.eId= <cfqueryparam value="#arguments.empid#" cfsqltype="integer">
            </cfquery>
            <cfreturn selemp>
        </cfif>
    </cffunction>
    <cffunction name="deleteresource" access="remote">
        <cfargument name="pid" required="true">
        <cfquery name="delresource" datasource="projectmanagement">
            UPDATE project.dbo.projectemployee
            SET status = 'I'
            WHERE projectId = <cfqueryparam value="#arguments.pid#" cfsqltype="integer">
        </cfquery>
    </cffunction>
    <cffunction name="getreport" access="remote" returnFormat="json">
        <cfargument name="pid" required="true">
        <cfargument name="eid" required="true">
        <cfdump var="#arguments.eid#">
        <cfset result = []>
        <cfloop list="#arguments.pid#" index="local.item">
            <cfquery name="report" datasource="projectmanagement">
                SELECT project.dbo.projectemployee.peid,project.dbo.projectemployee.projectId,project.dbo.projectemployee.employeeId,
                project.dbo.projectemployee.status,project.dbo.project.name,employee.dbo.employee.firstName,project.dbo.projectemployee.allocation
                FROM project.dbo.projectemployee 
                INNER JOIN project.dbo.project ON project.dbo.project.pid = project.dbo.projectemployee.projectId
                INNER JOIN employee.dbo.employee ON employee.dbo.employee.eId = project.dbo.projectemployee.employeeId
                WHERE (project.dbo.projectemployee.employeeId = <cfqueryparam value="#arguments.eid#" cfsqltype="integer"> or 
                project.dbo.projectemployee.projectId = <cfqueryparam value = "#local.item#" cfsqltype="integer">) 
                AND project.dbo.projectemployee.status='A';
            </cfquery>
        </cfloop>
        <cfreturn report>
    </cffunction>
</cfcomponent>