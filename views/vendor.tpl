<div id="title"><a href="/";> <img src="/assets/spotocform.jpg" alt="Edit Form"> </a> </div>
<div id="form">

<body>

<p style="color:#CC0000">{{message}}</p>
		<p style="font-size:small;"> *required field </p>
	<div id="formcontent">
	<form method="post" id="reservations">

		Spot Number:*<p style="font-size:small; color:#4775ff"><input type="text" name="spotNumber" maxlength="3" value = "{{sn}}" required> 
		ex. 24 
		</p>
		
		Headline:*<p style="font-size:small; color:#4775ff"><input type="text" name="headline" maxlength="40" value = "{{hl}}" required> 
		ex. Free Cats!!!
		</p>
		
		Organization:*<p style="font-size:small; color:#4775ff"><input type="text" name="organization" maxlength="40"  value = "{{org}}" required>
		ex. Cat Lovers Anonymous
		</p>
		
<!-- 		Upload image
		<p style="font-size:small; color:#4775ff"><input type="file" name="image_url">
		</p> -->
		
		Description:<p style="font-size:small; color:#4775ff"><textarea rows="4" cols="50" name="description" form="reservations" maxlength="300">{{desc}}</textarea> 
		<!-- enter example -->
		</p>
		
		Password:<p style="font-size:small; color:#4775ff"><input type="text" name="password" value="{{pw}}" maxlength="15">
		<!-- enter example -->
		</p>


		<input type="submit"> 

	<form>
	</div>
</div>
<style>

body{
	height:600px;
}

#form{
    padding-left: 20px;
    padding-right: 20px;
    margin: 0;
}

input[type=submit] {padding:5px 15px; background:#428bca; color: #ffffff; border:0 none;
    cursor:pointer;
    -webkit-border-radius: 5px;
    border-radius: 5px; 
}

input.text { 
	margin-bottom:12px; width:92%; padding: 3px; 
}
    
fieldset { 
	padding:10px; border:0; margin-top:10px; 
}

button {
	padding:5px 15px; background:#428bca; color: #ffffff; border:0 none; cursor:pointer; -webkit-border-radius: 5px; border-radius: 5px; margin-right: 15px;
}
</style>

