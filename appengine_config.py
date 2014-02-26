"""This file is loaded when starting a new application instance."""
import sys
# loads third party libraries
sys.path.insert(0, 'libs')
import os.path

# add `lib` subdirectory to `sys.path`, so our `main` module can load
# third-party libraries.
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'lib'))

