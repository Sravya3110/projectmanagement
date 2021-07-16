$(document).ready(function(){
   
    $("#pname").keypress(function(e){
        var key=e.keyCode;
        console.log(key)
        if((key >= 32 && key <= 64) || (key >= 91 && key <= 95) || (key >= 123 && key >= 125)){  
            $("#div1").text("Enter valid projectname");
            $('#div1').css({color:'red',display:'block'}); 
            //$('#pname').css({border:'1px solid red'});
            return false;
        } else {
            if($("#div1").text() != ""){
                //$("#div1").css("display", "none");
                //$('#pname').css({border:'1px solid black'});
                $("#div1").text("");
                return false;
              } 
        }
    });

    //$(document).on("click", ".savebtn", function(){
    $('form').on('submit', function () {
        //function validate(){
        var pname = $("#pname").val();
        var desc1 = $("#desc").val();
        var sdate = $("#sdate").val();
        console.log(pname);
        if(pname == ""){
            $("#div1").text("Enter projectname");
            $('#div1').css({color:'red',display:'block'});
            //$('#pname').css({border:'1px solid red'});
            return false;
        }
        if(desc1 == "" || desc1 == " "){
            $("#div2").text("Enter description");
            $('#div2').css({color:'red',display:'block'});
            //$('#desc').css({border:'1px solid red'});
            return false;
        }
        if(sdate == ""){
            $("#div3").text("Enter startdate");
            $('#div3').css({color:'red',display:'block'});
            //$('#sdate').css({border:'1px solid red'});
            return false;
        }
        
    });
    $(document).on("click", ".chkvalid", function(){
        if($("#div1").text() != ""){
            //$("#div1").css("display", "none");
            //$('#pname').css({border:'1px solid black'});
            $("#div1").text("");
            return false;
          } 
          //if($("#div2").css("display") == "block"){
            if($("#div2").text() != ""){
            //$("#div2").css("display", "none");
            //$('#desc').css({border:'1px solid black'});
            $("#div2").text("");
            return false;
          }
          if($("#div3").text() != ""){
            //$("#div3").css("display", "none");
            //$('#sdate').css({border:'1px solid black'});
            $('#div3').text("");
            return false;
          }  
    });
    $(".savebtn").click(function () {
        var pname = $("#spname").val();
        var ename = $("#sename").val();
        console.log(pname);
        if(pname == "" || pname == null){
            $("#div1").text("Select projectname");
            $('#div1').css({color:'red',visibility:'visible',fontsize:12});
            return false;
        }
        if(ename == "" || ename == 0){
            $("#div2").text("Select employeename");
            $('#div2').css({color:'red',visibility:'visible',fontsize:12});
            return false;
    }
    });
    $(".default").click(function (){
        console.log("hi")
        if($("#div1").css("visibility") == "visible"){
            $("#div1").css("visibility","hidden");
            return false;
        }
        if($("#div2").css("visibility") == "visible"){
            $("#div2").css("visibility","hidden");
            return false;
        }
    });
});
