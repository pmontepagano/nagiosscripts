CC=gcc
prefix=/usr/local/nagios
exec_prefix=${prefix}
INSTALL=/usr/bin/install -c
DESTDIR=${exec_prefix}/libexec
OBJS=snmp_bulkget.o utils.o
TARGET=check_interfaces


CPPFLAGS=
LDFLAGS= -lrt
CFLAGS=-g -O2 -DNETSNMP_ENABLE_IPV6 -fno-strict-aliasing -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -DNETSNMP_USE_INLINE -Ulinux -Dlinux=linux -D_REENTRANT -D_GNU_SOURCE -DDEBIAN -fwrapv -fno-strict-aliasing -pipe -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/lib/x86_64-linux-gnu/perl/5.20/CORE -D_FORTIFY_SOURCE=2 -I. -I/usr/include -DPACKAGE_NAME=\"check_interfaces\" -DPACKAGE_TARNAME=\"check_interfaces\" -DPACKAGE_VERSION=\"1.4\" -DPACKAGE_STRING=\"check_interfaces\ 1.4\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_NET_SNMP_NET_SNMP_CONFIG_H=1 -DHAVE_LIBNETSNMP=1 -DHAVE_POW=1 -DHAVE_GETADDRINFO=1
# shared library flags (assumes gcc)
# DLFLAGS=-fPIC -shared
BUILDLIBS=-Wl,-z,relro -Wl,-z,now -L/usr/lib/x86_64-linux-gnu -lnetsnmp -lcrypto -lm -lm -lnetsnmp 

.PHONY: debug clean all install
all: build strip
build: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) -o $(TARGET) $(OBJS) $(LDFLAGS) $(BUILDLIBS)

strip:
	strip $(TARGET)

debug: CFLAGS += -DDEBUG -g -O0
debug: LDFLAGS += -g -O0
debug: build


clean:
	rm $(OBJS) $(TARGET)


install: all
	$(INSTALL) -t $(DESTDIR) $(TARGET)


