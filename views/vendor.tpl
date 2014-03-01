<<<<<<< HEAD
<h1>Spot Occupant Form</h1>
=======
<div id="form">

<br><div id=title><h1>Spot Occupant Form</h1></div></br>
	<div id="formcontent">
>>>>>>> FETCH_HEAD
	<form method="POST" id="reservations">
	
		Spot Number:<p style="font-size:small; color:#4775ff"><input type="text" name="spotNumber" maxlength="3" required> 
		ex. 24 
		</p>
		
		Headline:<p style="font-size:small; color:#4775ff"><input type="text" name="headline" maxlength="40" required> 
		ex. Free Cats!!!
		</p>
		
		Organization:<p style="font-size:small; color:#4775ff"><input type="text" name="organization" maxlength="40" required>
		ex. Cat Lovers Anonymous
		</p>
		
		[Product List]:<p style="font-size:small; color:#4775ff"><textarea rows="4" cols="50" name="description" form="reservations" maxlength="300"></textarea>
		<!-- enter example -->
		</p>
		
		[Upload image...]
		<p></p>
		
		Description:<p style="font-size:small; color:#4775ff"><textarea rows="4" cols="50" name="description" form="reservations" maxlength="300"></textarea> 
		<!-- enter example -->
		</p>
		
		Password:<p style="font-size:small; color:#4775ff"><input type="text" name="password" maxlength="15">
		<!-- enter example -->
		</p>
		
		<input type="submit"> 
		<p></p>
	<form>
	</div>
</div>
<style>

#form{
    padding: 20px;
    margin: 0;
}

#title{
	float: left;
	clear: right;
}

#formcontent{
	float: left;
	clear: right;
	}
</style>
		
	
