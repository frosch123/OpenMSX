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

# Name of the Makefile which contains all the settings which describe
# how to make this newgrf. It defines all the paths, the grf name,
# the files for a bundle etc.
MAKEFILE_CONFIG=Makefile.config
MAKEFILE=Makefile

# Name of the Makefile which contains the local settings. It overrides
# the global settings in Makefile.config.
MAKEFILE_LOCAL=Makefile.local
MAKEFILE_DEF=scripts/Makefile.def
MAKEFILE_BUNDLES=scripts/Makefile.bundles
MAKEFILE_COMMON=scripts/Makefile.common
MAKEFILE_IN=scripts/Makefile.in
MAKEFILE_DEP=Makefile.dep

# Include the project's configuration file
include ${MAKEFILE_CONFIG}

# this overrides definitions from above by individual settings
# (if applicable):
-include ${MAKEFILE_LOCAL}

# include the universal Makefile definitions for NewGRF Projects
include ${MAKEFILE_DEF}

# Check dependencies for building all:
all: depend
	$(_V) $(MAKE) $(MAKE_FLAGS) -f $(MAKEFILE) $(MAIN_TARGET)
	
# Include dependencies (if applicable)
-include ${MAKEFILE_DEP}

# Include repo-specific rules (if applicable)
-include ${MAKEFILE_IN}

# Include rules commonly used for NewGRFs and bundle generation
include ${MAKEFILE_COMMON}
include ${MAKEFILE_BUNDLES}
