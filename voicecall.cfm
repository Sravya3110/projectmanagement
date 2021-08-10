<cfset accountSid="SKb8b24eb0333900308a75fee97a76643f">
<cfset secret="A9oKQhUjDegdXGHZwVuP858C3UFul4xQ">
<cfset caller="+13212419707">
<cfset called="+919493429728">
<cfset action_url="index.cfm">

<!— make the rest request —>
<cfhttp url="https://api.twilio.com/2008-08-01/Accounts/#accountSid#/Calls"
method="POST"
username="#accountSid#"
password="#secret#">
<cfhttpparam name="Caller" type="FormField" value="#caller#">
<cfhttpparam name="Called" type="FormField" value="#called#">
<cfhttpparam name="Url" type="FormField" value="#action_url#">
</cfhttp>

<!— display results —>
<cfoutput>
HTTP Response = #cfhttp.statusCode# <br>
<textarea cols=80 rows=10>
https://api.twilio.com/2008-08-01/Accounts/#accountSid#/Calls

#cfhttp.fileContent#
</textarea>
<cfdump var="#cfhttp.fileContent#">
</cfoutput>