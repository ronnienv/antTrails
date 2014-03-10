<div id="form">

<div id="title"><a href="/"> <img src= assets\spotocform.jpg> </a> 
  <script>
  $(function() {
    var spotNumber = $( "#spotNumber" ),
      password = $( "#password" ),
      allFields = $( [] ).add( spotNumber ).add( password ),
      tips = $( ".validateTips" );
 
    function updateTips( t ) {
      tips
        .text( t )
        .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }
 
    $( "#dialog-form" ).dialog({
      autoOpen: false,
      modal: true,
      buttons: {
        "Edit": function() {
          var bValid = true;
          allFields.removeClass( "ui-state-error" );
 
          if ( bValid ) {
            $( "#users tbody" ).append( "<tr>" +
              "<td>" + spotNumber.val() + "</td>" +
              "<td>" + password.val() + "</td>" +
            "</tr>" );
            $( this ).dialog( "close" );
          }   
        },
        Cancel: function() {
          $( this ).dialog( "close" );
        }
      },
      close: function() {
        allFields.val( "" ).removeClass( "ui-state-error" );
      }
    });

    $( "#dialog-form" ).dialog( "option", "width", 250 );
 
    $( "#edit-spot" )
      .button()
      .click(function() {
        $( "#dialog-form" ).dialog( "open" );
      });
  });
  </script>
<body>

<p style="color:#CC0000">{{message}}</p>
		<p style="font-size:small;"> *required field </p>
	<div id="formcontent">
	<form method="post" id="reservations">

		Spot Number:*<p style="font-size:small; color:#4775ff"><input type="text" name="spotNumber" maxlength="3" required> 
		ex. 24 
		</p>
		
		Headline:*<p style="font-size:small; color:#4775ff"><input type="text" name="headline" maxlength="40" value = "{{hl}}" required> 
		ex. Free Cats!!!
		</p>
		
		Organization:*<p style="font-size:small; color:#4775ff"><input type="text" name="organization" maxlength="40"  value = "{{org}}" required>
		ex. Cat Lovers Anonymous
		</p>
		
		Upload image
		<p style="font-size:small; color:#4775ff"><input type="file" name="image_url">
		</p>
		
		Description:<p style="font-size:small; color:#4775ff"><textarea rows="4" cols="50" name="description" form="reservations" maxlength="300">{{desc}}</textarea> 
		<!-- enter example -->
		</p>
		
		Password:<p style="font-size:small; color:#4775ff"><input type="text" name="password" value="{{pw}}" maxlength="15">
		<!-- enter example -->
		</p>

		<div style="width:25%">
			<input type="submit"> 
			<div id="dialog-form" title="Edit Spot Form">
			  <form>
			  <fieldset>
			    <label for="spotNumber">Spot Number</label>
			    <input type="text" name="spotNumber" id="spotNumber" class="text ui-widget-content ui-corner-all">
			    <label for="password">Password</label>
			    <input type="password" name="password" id="password" value="" class="text ui-widget-content ui-corner-all">
			  </fieldset>
			  </form>
			</div>
			<div>
				<button id="edit-spot">Edit Spot</button>
			</div>
		</div>

	<form>
	</div>
</div>
<style>

#form{
    padding-left: 20px;
    padding-right: 20px;
    margin: 0;
}

input[type=submit] {padding:5px 15px; background:#3366FF; color: #ffffff; border:0 none;
    cursor:pointer;
    -webkit-border-radius: 5px;
    border-radius: 5px; 
	float:left;
	margin-right: 15px;}

input.text { 
	margin-bottom:12px; width:92%; padding: 3px; 
}
    
fieldset { 
	padding:10px; border:0; margin-top:10px; 
}

div#users-contain { 
	width: 350px; margin: 20px 0; 
}

div#users-contain table { 
	margin: 1em 0; border-collapse: collapse; width: 100%; 
}

div#users-contain table td, div#users-contain table th { 
	border: 1px solid #eee; padding: .6em 10px; text-align: left;
}

.ui-dialog .ui-state-error { 
	padding: .3em; 
}

.validateTips { 
	border: 1px solid transparent; padding: 0.3em; 
}

.ui-dialog-titlebar-close {
	visibility: hidden;
}

.ui-dialog-titlebar {
	background-color: #3366FF; color: #ffffff; padding: 5px;
}

.ui-dialog-title {
	padding: 5px;
}

.ui-dialog-content {
	adding-left: 5px; padding-right: 6px; padding-bottom: 5px;
}

.ui-dialog {
	border-style:solid; border-width:1px; border-color: #3366FF;
}

.ui-dialog-buttonpane {
	padding-left: 10px; padding-bottom: 10px;
}

button {
	padding:5px 15px; background:#3366FF; color: #ffffff; border:0 none; cursor:pointer; -webkit-border-radius: 5px; border-radius: 5px; margin-right: 15px;
}
</style>

