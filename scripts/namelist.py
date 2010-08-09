#! /usr/bin/env python
#
# This file is part of the OpenMSX music set for OpenTTD.
# OpenMSX is free content; you can redistribute it and/or modify it under the terms of the
# GNU General Public License as published by the Free Software Foundation, version 2.
# OpenMSX is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details. You should have received a copy of
# the GNU General Public License along with Swedish RailSet. If not, see 
# <http://www.gnu.org/licenses/>.
#

import string
import sys

while 1:
    data = sys.stdin.readline()
    if data != '':
	# leave out all comment lines (lines starting with '#')
	comment_pos = string.find(data,'#')
	if comment_pos == 0:
		continue
	# separate the single entries by ';'
        separate = string.split(data,";")
	if len(separate) != 4:
		continue
	res = "%-32s = %s\n" % (separate[1], string.strip(separate[3]))
        sys.stdout.write(res)
    else:
        sys.stdout.flush()
        break

def authorlist(mystr):
	separate = string.split()
	for str in separate:
		print string.strip(str)