# Galois.tar - Fast Galois Field Arithmetic Library in C/C++
# Copright (C) 2007 James S. Plank
# 
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
# 
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# James S. Plank
# Department of Computer Science
# University of Tennessee
# Knoxville, TN 37996
# plank@cs.utk.edu

CC = gcc  
CFLAGS = -O3
DESTDIR=

LIBS =  libgalois.so.1.0.0 libgalois.so.1 libgalois.so
INCLUDES = galois.h

ALL =   $(LIBS)
all: $(ALL)

install: $(ALL)
	mkdir -p $(DESTDIR)/usr/bin $(DESTDIR)/usr/include $(DESTDIR)/usr/lib
	cp -a $(LIBS) $(DESTDIR)/usr/lib/
	cp $(INCLUDES) $(DESTDIR)/usr/include/

.PHONY: install

libgalois.so.1.0.0: galois.c galois.h
	$(CC) $(CFLAGS) $(LDFLAGS) -fPIC -shared -Wl,-soname,libgf.so.1 -o $@ $<

libgalois.so.1: libgalois.so.1.0.0
	$(RM) $@
	ln -s $< $@

libgalois.so: libgalois.so.1
	$(RM) $@
	ln -s $< $@

clean:
	rm -f core *.o $(ALL) a.out

.SUFFIXES: .c .o
.c.o:
	$(CC) $(CFLAGS) -c $*.c


galois.o: galois.h

