from google.appengine.ext import ndb


class Occupant(db.Model):
	headline = db.StringProperty(required=True)
	description = db.StringProperty()
	product_list = db.StringProperty()
	date_timeime = db.StringProperty(required=True)
	spot_id = db.IntegerProperty(required=True)
	organization = db.StringProperty()
	unique_id = db.datetime.datetime(required=True)
	spot_image = db.Link()
	password = db.StringProperty(required=True)
	report = db.IntegerProperty()

class Spot(db.Model):
	location = db.GeoPt(required=True)
	spot_id = db.IntegerProperty(required=True)
	location_image = db.Link(required=True)
	general_area = db.StringProperty(required=True)

occupant = Occupant("headline", "description",
					"product_list", )