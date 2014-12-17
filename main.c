#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>

#include "textscreen.h"

static txt_window_t *window;	

static void exit_callback(TXT_UNCAST_ARG(widget), void *user_data)
{
	TXT_ExitMainLoop();
}

int main(int argc, char *argv[])
{
	if (!TXT_Init())
	{
		fprintf(stderr, "Failed to initialise GUI\n");
		return -1;
	}
	
	SDL_ShowCursor(0);
	window = TXT_NewWindow("Error");

	txt_window_action_t* act;
	TXT_SignalConnect(act = TXT_NewWindowAction(KEY_RALT, "Exit"), "pressed", exit_callback, NULL);
	TXT_SetWindowAction(window, TXT_HORIZ_CENTER, act);
	TXT_SetWindowAction(window, TXT_HORIZ_LEFT, NULL);
	TXT_SetWindowAction(window, TXT_HORIZ_RIGHT, NULL);

	int i;
	for (i=1; i<argc; i++)
	{
		txt_label_t *label = TXT_NewLabel(argv[i]);
		TXT_SetWidgetAlign(label, TXT_HORIZ_CENTER);

		TXT_AddWidget(window, label);
	}

	TXT_GUIMainLoop();
	TXT_Shutdown();

	return 0;
}
