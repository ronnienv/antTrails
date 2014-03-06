"""`main` is the top level module for your Bottle application.

Loads the Bottle framework and adds a custom error
handler.
"""

# import the Bottle framework
from bottle import Bottle,route, run, template, static_file, get, post, request
from antTrailsDatabase import Occupant, Spot, Test
import datetime
import pyimgur

# Run the Bottle wsgi application. We don't need to call run() since our
# application is embedded within an App Engine WSGI application server.
bottle = Bottle()



@bottle.get('/')
def home():
  tmp_list = [{'headline':'AntTrails','description':'Awesome','products':[['a',1.99],['b',2.99]],'spotID':1,'Organization':'Anteater','latitude':33.643384,'longitude':-117.842071},{'headline':'AntTrails2','description':'More awesome','products':[['c',3.99],['d',4.99]],'spotID':2,'Organization':'Anteater2','latitude':33.644072,'longitude':-117.845236}]    
  vendors = {'vendors':tmp_list}
  header = template('header', "")
  content = template('buyer', vendors)
  footer = template('footer',"")
  return header + content + footer

@bottle.get('/database')
def home():
  t1 = Test(test_property = 10)
  t1.test_property = 11
  t1.put()
  t = Test.all()
  print t.get().test_property
  return "Database test"

@bottle.get('/imgur')
def home():
  CLIENT_ID = "14e82498fa58f55"
  CLIENT_SECRET = "a6272598109f505833e1ea69d3c67bb387e7a92d"
  im = pyimgur.Imgur(CLIENT_ID, CLIENT_SECRET)
  image = im.get_image('S1jmapR')
  print image.title # Cat Ying & Yang
  print image.link # http://imgur.com/S1jmapR.jpg
  return "imgur"


@bottle.get('/fakebuyer')
def home():
  
  o1 = Occupant.query()

  test = ""
  for t in o1:
  	test += t.headline

  return test

@bottle.get('/vendor')
def home():
  header = template('header', "")
  content = template('vendor',"")
  footer = template('footer',"")
  return header + content + footer

  @bottle.get('/testdatabase')
  def home():
    header = template('header', "")


@bottle.post('/vendor')
def home():
  # header = template('header', "")
  # content = template('vendor',"")
  # footer = template('footer',"")
  thankYou = "Form Submitted! Thank you!" 
  sn = request.forms.get('spotNumber')
  hl = request.forms.get('headline')
  org = request.forms.get('organization')
  pl = request.forms.get('productList')
  desc = request.forms.get('description')
  pw = request.forms.get('password')


  occupant = Occupant(id = sn, headline = hl, description = desc, product_list = pl, date_time = datetime.datetime.now(), spot_id = int(sn), organization = org, spot_image = "spot_image", password = pw, report = 0)
  occupantKey = occupant.put()

  o = Occupant.get_by_id(sn)
  
  return o.headline 
    
@bottle.error(404)
def error_404(error):
  """Return a custom 404 error."""
  return 'Sorry, Nothing at this URL.'

