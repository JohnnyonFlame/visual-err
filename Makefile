TARGET=visual_err
CFLAGS=-I/usr/include/SDL -I. -I./textscreen/ -Wno-write-strings -Og -ggdb
CXXFLAGS=-I/usr/include/SDL -I. -I./textscreen/ -fpermissive -Wno-write-strings -Og -ggdb
LDFLAGS=
LIBS=-lSDL -lpthread -lm

CC=gcc
CXX=g++

SRC= 	main.c
		
SRC2=	textscreen/txt_radiobutton.c \
		textscreen/txt_window_action.c \
		textscreen/txt_io.c \
		textscreen/txt_strut.c \
		textscreen/txt_inputbox.c \
		textscreen/txt_table.c \
		textscreen/txt_dropdown.c \
		textscreen/txt_desktop.c \
		textscreen/txt_widget.c \
		textscreen/txt_window.c \
		textscreen/txt_scrollpane.c \
		textscreen/txt_spinctrl.c \
		textscreen/txt_separator.c \
		textscreen/txt_button.c \
		textscreen/txt_utf8.c \
		textscreen/txt_sdl.c \
		textscreen/txt_checkbox.c \
		textscreen/txt_gui.c \
		textscreen/txt_label.c

	 
OBJ= $(patsubst %.c,%.o,$(SRC))
OBJ2= $(patsubst %.c,%.o,$(SRC2))

all: $(OBJ) $(OBJ2)
	$(CC) $(LDFLAGS) -o $(TARGET) $(OBJ) $(OBJ2) $(LIBS)
	
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@
	
clean:
	rm -rf $(TARGET) $(OBJ) $(OBJ2)
