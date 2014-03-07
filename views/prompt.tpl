<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">

  <script src="//code.jquery.com/jquery-1.9.1.js"></script>
  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <style>
    body { font-size: 12px; }
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left;}
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
    .ui-dialog-titlebar-close {visibility: hidden;}
    .ui-dialog-titlebar {background-color: #3366FF; color: #ffffff; padding: 5px;}
    .ui-dialog-title .ui-dialog-buttonpane{padding: 5px;}
    .ui-dialog-content {padding-left: 5px; padding-right: 6px; padding-bottom: 5px;}
    .ui-dialog {border-style:solid; border-width:1px; border-color: #3366FF; width: 200px;}
  </style>
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
 
    $( "#edit-spot" )
      .button()
      .click(function() {
        $( "#dialog-form" ).dialog( "open" );
      });
  });
  </script>
</head>
<body>
 
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

<button id="edit-spot">Edit Spot</button>
 
</body>
</html>