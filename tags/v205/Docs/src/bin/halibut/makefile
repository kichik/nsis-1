OBJS = biblio.o bk_xhtml.o contents.o error.o help.o index.o input.o keywords.o licence.o main.o malloc.o misc.o style.o tree234.o ustring.o version.o
LIBS = 

CC	= gcc
RM	= rm -f
DEFINES = -DVERSION="\"1.0 (NSIS Custom Build)\""
CFLAGS	= -Wall -W $(DEFINES) -mno-cygwin
LFLAGS	= -s

all : halibut

halibut : $(OBJS)
	$(CC) $(CFLAGS) $(LFLAGS) -o ../halibut.exe $(OBJS) $(LIBS)

clean ::
	$(RM) *.o

