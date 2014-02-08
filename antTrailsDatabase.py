from google.appengine.ext import ndb

class Occupant(ndb.Model):
	headline = ndb.StringProperty(required=True)
	description = ndb.StringProperty()
	product_list = ndb.StringProperty()
	date_timeime = ndb.StringProperty(required=True)
	spot_id = ndb.IntegerProperty(required=True)
	organization = ndb.StringProperty()
	unique_id = ndb.DateTimeProperty(required=True)
	spot_image = ndb.StringProperty()
	password = ndb.StringProperty(required=True)
	report = ndb.IntegerProperty()

class Spot(ndb.Model):
	location = ndb.GeoPtProperty(required=True)
	spot_id = ndb.IntegerProperty(required=True)
	location_image = ndb.StringProperty(required=True)
	general_area = ndb.StringProperty(required=True)

