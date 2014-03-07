from google.appengine.ext import ndb


class Occupant(ndb.Model):
  headline = ndb.StringProperty(required=True)
  description = ndb.StringProperty()
  date_time = ndb.DateTimeProperty(required=True)
  spot_id = ndb.StringProperty(required=True)
  organization = ndb.StringProperty()
  spot_image = ndb.StringProperty()
  password = ndb.StringProperty(required=True)
  report = ndb.IntegerProperty()

class Spot(ndb.Model):
  longitude = ndb.StringProperty(required=True)
  latitude = ndb.StringProperty(required=True)
  spot_id = ndb.StringProperty(required=True)
  location_image = ndb.StringProperty(required=True)
  general_area = ndb.StringProperty(required=True)


