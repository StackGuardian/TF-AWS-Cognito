import hcl2
import json
import os
from hcl2 import load
from hcl2.parser import hcl2
from hcl2.version import __version__
import sys



import hcl2
with open('variables.tf', 'r') as file:
    blah = hcl2.parser(file)
    dict = hcl2.load(file)

print(dict)





    