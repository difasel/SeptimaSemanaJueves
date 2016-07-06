$(document).ready(function() {

	$( "#slot-machine" ).submit(function( event ) {
		// alert( "Handler for .submit() called." );
    	event.preventDefault();
    // console.log("Test")
    //  new_value = Math.floor((Math.random() * 3) + 1);
    // console.log(new_value)

     $.post('/rolls', function(data){
         console.log(data);
         $('#die').html(data);
     });
	});
});
