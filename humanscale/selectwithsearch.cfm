<html>
    <head>
        <title>select with search</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.jquery.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.css">
    </head>
    <script>
        $(function() {
            $(".chosen-select").chosen();
        });
    </script>
    <body>
        <cfoutput>
            <select name="spname1" id="spname" class="form-control chosen-select s1" style="width:220px;font-size:14px;">
                <!---<cfloop query="getallpjt">
                    <option value="#pid#">#name#</option> 
                </cfloop>--->
                <option>Select Option</option>
                <option value="AF">Afghanistan</option>
                <option value="AX">Åland Islands</option>
                <option value="AL">Albania</option>
                <option value="DZ">Algeria</option>
                <option value="AS">American Samoa</option>
                <option value="AD">Andorra</option>
                <option value="AO">Angola</option>
                <option value="AI">Anguilla</option>
                <option value="AQ">Antarctica</option>
                <option value="SR">SouthAfrica</option>
            </select>
        </cfoutput>
    </body>
</html>