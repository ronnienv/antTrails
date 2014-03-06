"""`main` is the top level module for your Bottle application.

Loads the Bottle framework and adds a custom error
handler.
"""

# import the Bottle framework
from bottle import Bottle,route, run, template, static_file, get, post, request, redirect, response
from antTrailsDatabase import Occupant, Spot
import datetime
import pyimgur

# Run the Bottle wsgi application. We don't need to call run() since our
# application is embedded within an App Engine WSGI application server.
bottle = Bottle()



@bottle.get('/')
def home():
  tmp_list = [{'headline':'AntTrails','description':'Awesome','products':[['a',1.99],['b',2.99]],'spotID':1,'Organization':'Anteater','latitude':33.643384,'longitude':-117.842071},{'headline':'AntTrails2','description':'More awesome','products':[['c',3.99],['d',4.99]],'spotID':2,'Organization':'Anteater2','latitude':33.644072,'longitude':-117.845236}]    
  vendors = {'vendors':tmp_list}
  header = template('header', home="active", vendor="", about="")
  content = template('buyer', vendors)
  footer = template('footer',"")
  confirmation = """
  <script>
    alert("Your reservation is complete! Please note that official reservations must be made through the Student Center and not through antTrails.                                                                 Thank you!");
  </script>"""

  if request.get_cookie("submittedForm") == "yes":
    response.set_cookie("submittedForm", "no")
    content = template('buyer', vendors)
    return header + content + footer + confirmation
  else:
    return header + content + footer 

# @bottle.get('/database')
# def home():
#   t1 = Test(test_property = 10)
#   t1.test_property = 11
#   t1.put()
#   t = Test.all()
#   print t.get().test_property
#   return "Database test"

@bottle.get('/imgur')
def home():
  CLIENT_ID = "14e82498fa58f55"
  CLIENT_SECRET = "a6272598109f505833e1ea69d3c67bb387e7a92d"
  im = pyimgur.Imgur(CLIENT_ID, CLIENT_SECRET)
  image = im.get_image('S1jmapR')
  print image.title # Cat Ying & Yang
  print image.link # http://imgur.com/S1jmapR.jpg
  return "imgur"


# @bottle.get('/fakebuyer')
# def home():
  
#   o1 = Occupant.query()

#   test = ""
#   for t in o1:
#   	test += t.headline

#   return test

def vendor_to_longlat(spreadsheet):
  '''Making a dictionary from Tech Beckas spreadsheet'''
  sheet = open(spreadsheet, 'r')
  sheet = sheet.readlines()
  vendor_longlat = {}
  for item in range(len(sheet)):
    sheet[item]=sheet[item].split(',')
  for item in sheet:
    try:
      item[2] = item[2].strip('\n')
      vendor_longlat.update({item[0]:(item[1],item[2])})
    except:
      pass


@bottle.get('/vendor')
def home():
  header = template('header', home="", vendor="active", about="")
  content = template('vendor', message = "", hl = "" , org = "", pl = "", desc = "", pw = "")
  footer = template('footer',"")
  return header + content + footer



@bottle.post('/vendor')
def home():

  sn = request.forms.get('spotNumber')
  pl = request.forms.get('productList')
  hl = request.forms.get('headline')
  org = request.forms.get('organization')
  pl = request.forms.get('productList')
  desc = request.forms.get('description')
  pw = request.forms.get('password')

  

  snDatabase = Occupant.get_by_id(sn)

  if snDatabase == None:
    occupant = Occupant(id = sn, headline = hl, description = desc, product_list = pl, date_time = datetime.datetime.now(), spot_id = int(sn), organization = org, spot_image = "spot_image", password = pw, report = 0)
    occupantKey = occupant.put()
    o = Occupant.get_by_id(sn)

    response.set_cookie("submittedForm", "yes")
    redirect('/')

  else:
    header = template('header', home="", vendor="active", about="")
    content = template('vendor', message = "*Sorry, the Spot Number entered has already been taken.*", hl = hl, org = org, pl = pl, desc = desc, pw = pw)
    footer = template('footer',"")

    return header + content + footer
    
@bottle.error(404)
def error_404(error):
  """Return a custom 404 error."""
  return 'Sorry, Nothing at this URL.'


