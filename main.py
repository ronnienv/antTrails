"""`main` is the top level module for your Bottle application.

Loads the Bottle framework and adds a custom error
handler.
"""

# import the Bottle framework
from bottle import Bottle,route, run, template, static_file, get, post, request, redirect, response
from antTrailsDatabase import Occupant, Spot
from google.appengine.ext import ndb
import datetime, pyimgur, time

# Run the Bottle wsgi application. We don't need to call run() since our
# application is embedded within an App Engine WSGI application server.
bottle = Bottle()


@bottle.get('/adddata')
def home():
  o = Occupant(id = '123', headline = 'hl', description = 'desc', date_time = datetime.datetime.now(), spot_id = '123', organization = 'org', spot_image = "spot_image", password = 'pass', report = 0)
  o1 = Occupant(id = '12', headline = 'hl', description = 'desc', date_time = datetime.datetime.now(), spot_id = '12', organization = 'org', spot_image = "spot_image", password = 'pass', report = 0)
  o2 = Occupant(id = '13', headline = 'hl', description = 'desc', date_time = datetime.datetime.now(), spot_id = '13', organization = 'org', spot_image = "spot_image", password = 'pass', report = 0)
  o3 = Occupant(id = '23', headline = 'hl', description = 'desc', date_time = datetime.datetime.now(), spot_id = '23', organization = 'org', spot_image = "spot_image", password = 'pass', report = 0)
  o.put()
  o1.put()
  o2.put()
  o3.put()


@bottle.get('/')
def home():
  query = Occupant.query()
  tmp_list = convertQuery(query)
  vendors = {'vendors':tmp_list}

  header = template('header', home="active", vendor="", about="")
  content = template('buyer', vendors)
  footer = template('footer',"")
  confirmation = """
  <script>
    alert("Your reservation is complete! Please note that official reservations must be made through the Student Center and not through antTrails. Also, please note that the spots reset at 12am everyday. \\n\\nThank you!");
  </script>"""

  if request.get_cookie("submittedForm") == "yes":
    response.set_cookie("submittedForm", "no")
    content = template('buyer', vendors)
    return header + content + footer + confirmation
  else:
    return header + content + footer 

@bottle.get('/clear')
def home():
  ndb.delete_multi(Occupant.query().fetch(keys_only=True))

@bottle.get('/imgur')
def home():
  chooseFile()
  CLIENT_ID = "023b858ecdb2d0c"
  CLIENT_SECRET = "83234b0ff6b2fce855205f69594811b671448848"
  im = pyimgur.Imgur(CLIENT_ID, CLIENT_SECRET)
  image = im.get_image('S1jmapR')
  link = "<img src="+image.link_medium_thumbnail+">"
  header = template('header',  home="active", vendor="", about="") 
  footer = template('footer',"")
  return header + link + footer


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
vendor_to_longlat('LongituteLatitutde.txt')


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

  if isValidSpot(sn):
    snInt = int(sn)
    snInt = str(snInt)
    snDatabase = Occupant.get_by_id(snInt)
    if snDatabase == None:
      occupant = Occupant(id = snInt, headline = hl, description = desc, product_list = pl, date_time = datetime.datetime.now(), spot_id = snInt, organization = org, spot_image = "spot_image", password = pw, report = 0)
      occupant.put()
     
      time.sleep(1)
      response.set_cookie("submittedForm", "yes")
      redirect('/')

    else:
      header = template('header', home="", vendor="active", about="")
      content = template('vendor', message = "*Sorry, the Spot Number entered has already been taken.*", hl = hl, org = org, pl = pl, desc = desc, pw = pw)
      footer = template('footer',"")

      return header + content + footer

  else:
    header = template('header', home="", vendor="active", about="")
    content = template('vendor', message = "*Sorry, the Spot Number must be a number value.*", hl = hl, org = org, pl = pl, desc = desc, pw = pw)
    footer = template('footer',"")

    return header + content + footer
    
@bottle.error(404)
def error_404(error):
  """Return a custom 404 error."""
  return 'Sorry, Nothing at this URL.'

def isValidSpot(s):
  try:
    int(s)
    if s > 0 or s < 314:
      return True
    else:
      return False
  except ValueError:
      return False

def chooseFile():
  """<script>
    window.open(www.google.com);
  </script>"""

def convertQuery(vendors):
  returner = []
  for v in vendors:
    returner.append({
        'headline' : v.headline, 
        'description' : v.description,
        'product_list' : v.product_list,
        'date_time' : v.date_time,
        'spot_id' : v.spot_id,
        'organization' : v.organization,
        'spot_image' : v.spot_image,
        'password' : v.password,
        'report' : v.report
      })

  return returner











