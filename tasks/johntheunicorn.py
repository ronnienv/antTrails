    from google.appengine.ext import ndb
    from antTrailsDatabase import Occupant

    ndb.delete_multi(Occupant.query().fetch(keys_only=True))