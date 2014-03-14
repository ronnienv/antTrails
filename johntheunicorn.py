from bottle import Bottle,route, run, template, static_file, get, post, request, redirect, response
from antTrailsDatabase import Occupant, Spot
from google.appengine.ext import ndb
import datetime, pyimgur, time

ndb.delete_multi(Occupant.query().fetch(keys_only=True))
return 250