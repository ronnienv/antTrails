from google.appengine.ext import ndb

class Vendor(ndb.Model):
    """Models an individual Guestbook entry with author, content, and date."""
    author = ndb.UserProperty()
    content = ndb.StringProperty(indexed=False)
    date = ndb.DateTimeProperty(auto_now_add=True)

    
class Spot(ndb.Model):
    content = ndb.StringProperty(indexed=False)
    author = ndb.UserProperty()
    author = ndb.UserProperty()
    author = ndb.UserProperty()