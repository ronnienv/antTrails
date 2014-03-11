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
  vendor_to_longlat('LongituteLatitutde.txt')


@bottle.get('/')
def home():
  query = Occupant.query()
  tmp_list = convertQuery(query)
  vendors = {'vendors':tmp_list}

  header = template('header', home="active", vendor="", edit="", about="")
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
  #ndb.delete_multi(Occupant.query().fetch(keys_only=True))
  ndb.delete_multi(Occupant.query().fetch(keys_only=True))
  #ndb.delete_multi(Spot.query().fetch(keys_only=True))

@bottle.get('/imgur')
def home():
  CLIENT_ID = "023b858ecdb2d0c"
  CLIENT_SECRET = "83234b0ff6b2fce855205f69594811b671448848"
  im = pyimgur.Imgur(CLIENT_ID, CLIENT_SECRET)
  image = im.get_image('S1jmapR')
  link = "<img src="+image.link_medium_thumbnail+">"
  header = template('header',  home="active", vendor="", edit="", about="") 
  footer = template('footer',"")
  return header + link + footer


def uploadImage(img_url): 
  CLIENT_ID = "023b858ecdb2d0c"
  CLIENT_SECRET = "83234b0ff6b2fce855205f69594811b671448848"
  im = pyimgur.Imgur(CLIENT_ID, CLIENT_SECRET)
  image = im.upload_image(path = img_url, title= "Test upload")
  return image.link


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
      s = Spot(id = item[0], latitude = item[1], longitude = item[2], location_image = "", spot_id =item[0], general_area ="")
      s.put()
    except:
      pass
vendor_to_longlat('LongituteLatitutde.txt')


@bottle.get('/vendor')
def home():
  header = template('header', home="", vendor="active", edit="", about="")
  content = template('vendor', message = "", sn = "", hl = "" , org = "", desc = "", pw = "")
  footer = template('footer',"")
  return header + content + footer




@bottle.post('/vendor')
def home():

  sn = request.forms.get('spotNumber')
  hl = request.forms.get('headline')
  org = request.forms.get('organization')
  desc = request.forms.get('description')
  pw = request.forms.get('password')
  img_url = request.forms.get('image_url')
  #img = uploadImage(img_url)

  if isValidSpot(sn):
    snInt = int(sn)
    snInt = str(snInt)
    snDatabase = Occupant.get_by_id(snInt)
    if snDatabase == None:
      occupant = Occupant(id = snInt, headline = hl, description = desc, date_time = datetime.datetime.now(), spot_id = snInt, organization = org, spot_image = img_url, password = pw, report = 0)
      occupant.put()
     
      time.sleep(1)
      response.set_cookie("submittedForm", "yes")
      redirect('/')

    else:
      header = template('header', home="", vendor="active", edit="", about="")
      content = template('vendor', message = "*Sorry, the Spot Number entered has already been taken.*", sn = "", hl = hl, org = org, desc = desc, pw = pw)
      footer = template('footer',"")

      return header + content + footer

  else:
    header = template('header', home="", vendor="active", edit="", about="")
    content = template('vendor', message = "*Sorry, the Spot Number must be a number value.*", sn = "", hl = hl, org = org, desc = desc, pw = pw)
    footer = template('footer',"")

    return header + content + footer

@bottle.get('/edit')
def home():
  header = template('header', home="", vendor="", edit="active", about="")
  content = template('edit', message="")
  footer = template('footer',"")
  response.set_cookie("edittingForm", "no")
  return header + content + footer

@bottle.post('/edit')
def home():
  #if the user has not submitted the new editted form, it will enter this branch
  if request.get_cookie("edittingForm") == "no":
    sn = request.forms.get('spotNumber')
    pw = request.forms.get('password')

    if isValidSpot(sn):
      snInt = int(sn)
      snInt = str(snInt)
      snDatabase = Occupant.get_by_id(snInt)

      if snDatabase == None:
        header = template('header', home="", vendor="", edit="active", about="")
        content = template('edit', message="*The entered Spot Number has not been reserved yet.")
        footer = template('footer',"")
        return header + content + footer
        
      else:
        if snDatabase.password == pw:
          response.set_cookie("edittingForm", "yes")
          snInt = int(sn)
          snInt = str(snInt)
          response.set_cookie("originalSN", snInt)
          hl = snDatabase.headline
          org = snDatabase.organization
          desc = snDatabase.description

          header = template('header', home="", vendor="", edit="active", about="")
          content = template('vendor', message = "Spot Information has been loaded!", sn = sn, hl = hl, org = org, desc = desc, pw = pw)
          footer = template('footer',"")
          return header + content + footer

        else:
          header = template('header', home="", vendor="", edit="active", about="")
          content = template('edit', message="*Invalid Password")
          footer = template('footer',"")
          return header + content + footer

    else:
      header = template('header', home="", vendor="", edit="active", about="")
      content = template('edit', message = "*Sorry, the Spot Number must be a number value.*")
      footer = template('footer',"")
      return header + content + footer

  #if the user has submitted a new editted spot form it will enter this branch
  #this branch is basically the check in vnedor that validates input
  else:
    sn = request.forms.get('spotNumber')
    hl = request.forms.get('headline')
    org = request.forms.get('organization')
    desc = request.forms.get('description')
    pw = request.forms.get('password')
    img_url = request.forms.get('image_url')

    if isValidSpot(sn):
      snInt = int(sn)
      snInt = str(snInt)
      snDatabase = Occupant.get_by_id(snInt)

      if snDatabase == None or snInt == str(request.get_cookie("originalSN")):
        occupant = Occupant(id = snInt, headline = hl, description = desc, date_time = datetime.datetime.now(), spot_id = snInt, organization = org, spot_image = img_url, password = pw, report = 0)
        occupant.put()

        #if the new spot number does not exist that means that changed the spot number
        #so the old can be deleted because it is being replaced
        if snDatabase == None:
          oldSpot = Occupant.get_by_id(str(request.get_cookie("originalSN")))
          oldSpot.key.delete()

        response.set_cookie("edittingForm", "no")
        response.set_cookie("originalSN", "no")

        time.sleep(1)
        response.set_cookie("submittedForm", "yes")
        redirect('/')

      else:
        header = template('header', home="", vendor="", edit="active", about="")
        content = template('vendor', message = "*Sorry, the Spot Number entered has already been taken.*", sn = "", hl = hl, org = org, desc = desc, pw = pw)
        footer = template('footer',"")

        return header + content + footer

    else:
      header = template('header', home="", vendor="", edit="active", about="")
      content = template('vendor', message = "*Sorry, the Spot Number must be a number value.*", sn = "", hl = hl, org = org, desc = desc, pw = pw)
      footer = template('footer',"")

      return header + content + footer
      
  

@bottle.get('/about')
def home():
  header = template('header', home="", vendor="", edit="", about="active")
  content = template('about',"")
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


def convertQuery(vendors):
  returner = []
  for v in vendors:
    returner.append({
        'headline' : v.headline, 
        'description' : v.description,
        'date_time' : v.date_time,
        'spot_id' : v.spot_id,
        'organization' : v.organization,
        'spot_image' : v.spot_image,
        'password' : v.password,
        'report' : v.report
      })

  return returner
