"""`main` is the top level module for your Bottle application.

Loads the Bottle framework and adds a custom error
handler.
"""
# import the Bottle framework
from bottle import Bottle,route, run, template, static_file, get, post, request
from antTrailsDatabase import Occupant, Spot

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
  t1 = Test()
  t1.put()
  return header + content + footer

@bottle.get('/fakebuyer')
def home():
  vendors = {'vendors':tmp_list}
  header = template('header', "")
  content = template('buyer', vendors)
  footer = template('footer',"")
  return header + content + footer



@bottle.get('/vendor')
def home():
  header = template('header', "")
  content = template('vendor',"")
  footer = template('footer',"")
  return header + content + footer

@bottle.post('/vendor')
def home():
  header = template('header', "")
  content = template('vendor',"")
  footer = template('footer',"")
  return header + content + footer
    
@bottle.error(404)
def error_404(error):
  """Return a custom 404 error."""
  return 'Sorry, Nothing at this URL.'

