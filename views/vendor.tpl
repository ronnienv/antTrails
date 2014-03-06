<div id="form">

<div id="title"><h1>Spot Occupant Form</h1></div>
<p style="color:#CC0000">{{message}}</p>
	<div id="formcontent">
	<form method="post" id="reservations">

		Spot Number:<p style="font-size:small; color:#4775ff"><input type="text" name="spotNumber" maxlength="3" required> 
		ex. 24 
		</p>
		
		Headline:<p style="font-size:small; color:#4775ff"><input type="text" name="headline" maxlength="40" value = "{{hl}}" required> 
		ex. Free Cats!!!
		</p>
		
		Organization:<p style="font-size:small; color:#4775ff"><input type="text" name="organization" maxlength="40"  value = "{{org}}" required>
		ex. Cat Lovers Anonymous
		</p>
		
		[Product List]:<p style="font-size:small; color:#4775ff"><textarea rows="4" cols="50" name="productList" form="reservations" maxlength="300">{{pl}}</textarea>
		<!-- enter example -->
		</p>
		
		[Upload image...]
		<p></p>
		
		Description:<p style="font-size:small; color:#4775ff"><textarea rows="4" cols="50" name="description" form="reservations" maxlength="300">{{desc}}</textarea> 
		<!-- enter example -->
		</p>
		
		Password:<p style="font-size:small; color:#4775ff"><input type="text" name="password" value="{{pw}}" maxlength="15">
		<!-- enter example -->
		</p>
		
		<input type="submit"> 
		<p></p>
	<form>
	</div>
</div>
<style>

#form{
    padding-left: 20px;
    padding-right: 20px;
    padding-bottom: 20px;
    margin: 0;
}
</style>
	
