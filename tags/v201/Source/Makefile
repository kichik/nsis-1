#
# This makefile for mingw32 by Nels. Thanks, Nels
#
# Generalized for building on POSIX systems by Bas Mevissen
#

# -- Objects and source files --
SRCS = zlib/deflate.c zlib/trees.c bzip2/blocksort.c bzip2/bzlib.c bzip2/compress.c bzip2/huffman.c 7zip/7zGuids.cpp 7zip/Common/CRC.cpp 7zip/7zip/Compress/LZ/LZInWindow.cpp 7zip/7zip/Compress/LZMA/LZMAEncoder.cpp 7zip/7zip/Common/OutBuffer.cpp 7zip/7zip/Compress/RangeCoder/RangeCoderBit.cpp 7zip/Common/Alloc.cpp build.cpp crc32.c DialogTemplate.cpp exedata.cpp lang.cpp makenssi.cpp Plugins.cpp ResourceEditor.cpp ResourceVersionInfo.cpp script.cpp tokens.cpp util.cpp
OBJS = 7zGuids.o blocksort.o build.o bzlib.o compress.o CRC.o crc32.o deflate.o DialogTemplate.o exedata.o huffman.o lang.o LZInWindow.o LZMAEncoder.o Alloc.o makenssi.o OutBuffer.o Plugins.o RangeCoderBit.o ResourceEditor.o ResourceVersionInfo.o script.o tokens.o trees.o util.o
ifeq "$(strip $(findstring i386pe,$(shell ld -V)))" ""
LIBS = -lstdc++ -lpthread
EXESUFF =
else
LIBS = -lgdi32 -lversion -lstdc++
EXESUFF = .exe
endif

# -- Programs --
MAKE = make
CC = gcc
CXX = g++
RM = rm

# -- Compilers and linker flags --
DEFINES = -DCOMPRESS_MF_BT
CFLAGS = -Wall -O3
CXXFLAGS = -Wall -O3
CPPFLAGS = $(DEFINES)
ifneq ($(EXESUFF),)
  LDFLAGS = -s -Wl,-Map,$(subst $(EXESUFF),.map,$@)
else
  LDFLAGS = -s -Wl,-Map,$@.map
endif

all : exehead makensis

exehead :
	$(MAKE) -C exehead

cs = zlib bzip2 lzma
rs = bitmap1.h icon.h unicon.h
deps = $(foreach c,$(cs),exehead/Release-$(c)/exehead_$(c).h) $(foreach r,$(rs),exehead/Release-zlib/$(r))
$(deps) : exehead

makensis : ../makensis$(EXESUFF)

exedata.o : $(deps)

../makensis$(EXESUFF) : $(SRCS) $(OBJS)
	$(CC) -Wall $(LDFLAGS) -o ../makensis$(EXESUFF) $(OBJS) $(LIBS)

VPATH=zlib:bzip2:7zip:7zip/Common:7zip/7zip:7zip/7zip/Compress/LZ:7zip/7zip/Compress/LZMA:7zip/7zip/Common:7zip/7zip/Compress/RangeCoder

# -- Some dependencies --
$(OBJS) : Platform.h exehead/config.h
build.o : czlib.h cbzip2.h clzma.h exehead/fileform.h
script.o : exehead/fileform.h tokens.h

# -- Clean script --
clean : clean_makensis
	$(MAKE) -C exehead clean

clean_makensis :
	$(RM) -f *.o
	$(RM) -f ../makensis$(EXESUFF) ../makensis.map

# -- Phony targets --
.PHONY : exehead makensis clean clean_makensis
