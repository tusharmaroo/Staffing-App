$(document).ready(function () {
	
	$("input").focus(function(){
		$(this).removeClass("required");
	});
	
	$(".numeric").blur(function(){
		if ($(this).val() == ''){
			$(this).addClass("required");
			$(this).attr('placeholder', 'Please enter a Number.');
		}else if($.isNumeric($(this).val())){
			$(this).removeClass("required");

		}
		if(!$.isNumeric($(this).val())){
			$(this).removeClass("required").addClass("required");
			$(this).val('');
			$(this).attr('placeholder', 'Please enter a Number.');
		}
	});

	$(".phonenumber").blur(function(){
		var phoneno = /^\d{10}$/;  
		  if($(this).val().match(phoneno))  
		  {  
		  	$(this).removeClass("required");
		      return true;
		  }  
		  else  
		  {  
		    $(this).removeClass("required").addClass("required");
			$(this).val('');
			$(this).attr('placeholder', 'Please enter a valid Mobile Number.');  
		    return false;  
		  }
	});

	$(".email").blur(function(){
		var emailid = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;  
		  if($(this).val().match(emailid))  
		  {  
		  	$(this).removeClass("required");
		      return true;
		  }  
		  else  
		  {  
		    $(this).removeClass("required").addClass("required");
			$(this).val('');
			$(this).attr('placeholder', 'Please enter a valid Email Address.');  
		    return false;  
		  }
	});

	$(".textArea").blur(function(){ 
		  if($(this).val() == '')  
		  {  
		  	$(this).removeClass("required").addClass("required");
			$(this).val('');
			$(this).attr('placeholder', 'This cannot be left blank.');  
		    return false;  
		  }  
		  else  
		  {    

		    if($(this).val().length >= 8){
			  	$(this).removeClass("required");
			      return true;
			}else{
			  	$(this).removeClass("required").addClass("required");
				$(this).val('');
				$(this).attr('placeholder', 'Minimum length: 8 chars.');
				return false;
			}
		  }
	});

	$(".name").blur(function(){
		var name = /^[a-zA-Z\s]*$/;  
		  if($(this).val() == '')  
		  {  
		  	$(this).removeClass("required").addClass("required");
			$(this).val('');
			$(this).attr('placeholder', 'Name cannot be left blank.');  
		    return false;  
		  }
		  if($(this).val().match(name))  
		  {  
		  	if($(this).val().length >= 2)  
			  {  
			  	$(this).removeClass("required");
			      return true;
			  }else{
			  	$(this).removeClass("required").addClass("required");
				$(this).val('');
				$(this).attr('placeholder', 'Only Alphabates and spaces are allowed. minimum length: 2 chars.');
				return false;
			  }
		  }  
		  else  
		  {  
		    $(this).removeClass("required").addClass("required");
			$(this).val('');
			$(this).attr('placeholder', 'Only Alphabates and spaces are allowed.');  
		    return false;  
		  }
	});

	$(".modal-body > form").submit(function(){
		  if ($( "input" ).hasClass( "required" )){
		  	return false;
		  }else{
		  	return true;		  	
		  }
	});


});

