/* See LICENSE file for copyright and license details. */

#include <X11/XF86keysym.h>
/* appearance */
static const unsigned int borderpx       = 2;        /* border pixel of windows */
static const unsigned int gappx          = 8;        /* gaps between windows */
static const unsigned int snap           = 32;       /* snap pixel */
static const int showbar                 = 1;        /* 0 means no bar */
static const int topbar                  = 1;        /* 0 means bottom bar */
static const char *fonts[]               = { "JetBrainsMono Nerd Font:size=14" };
static const char col_inactive[]         = "#54546D";
static const char col_accent[]           = "#f1eedc";
static const char col_black[]            = "#000000";
static const unsigned int baralpha       = 0xDD;
static const unsigned int borderalpha    = OPAQUE;

static const unsigned int alphas[][3] = {
  /*               fg      bg        border*/
  [SchemeNorm] = { baralpha, baralpha, borderalpha },
	[SchemeSel]  = { baralpha, baralpha, borderalpha },
};
static const char *colors[][3] = {
	/*               fg          bg           border   */
	[SchemeNorm] = { col_accent, col_black,   col_inactive },
	[SchemeSel]  = { col_black,  col_accent,  col_accent  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class                   instance          title      tags mask           isfloating   monitor */
	{ "LibreWolf",            "Navigator",       NULL,       1 << 1,            0,           -1 },
	{ "thunderbird-default",  "Mail",            NULL,       1 << 3,            0,           -1 },
};

/* layout(s) */
static const float mfact          = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster          = 1;    /* number of clients in master area */
static const int resizehints      = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen   = 1;    /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *termcmd[]            =   { "st", NULL };

static const char *rofirun[]            =   { "/home/sumer/shellScripts/rofi.sh", "-r", NULL };
static const char *rofidrun[]           =   { "/home/sumer/shellScripts/rofi.sh", "-d", NULL };
static const char *rofipower[]          =   { "/home/sumer/shellScripts/rofi.sh", "-q", NULL };
static const char *rofiwifi[]           =   { "/home/sumer/shellScripts/rofi.sh", "-n",  NULL };
static const char *rofipass[]           =   { "/home/sumer/shellScripts/rofi.sh", "-p",  NULL };

static const char *vol_up[]             =   { "/home/sumer/shellScripts/volumeNotification.sh", "up",   NULL };
static const char *vol_down[]           =   { "/home/sumer/shellScripts/volumeNotification.sh", "down", NULL };
static const char *vol_mute[]           =   { "/home/sumer/shellScripts/volumeNotification.sh", "mute", NULL };

static const char *brightness_up[]      =   { "/home/sumer/shellScripts/brightnessNotification.sh", "up", NULL };
static const char *brightness_down[]    =   { "/home/sumer/shellScripts/brightnessNotification.sh", "down", NULL };

static const char *emailcmd[]           =   { "thunderbird", NULL };

static const char *browsercmd[]         =   { "librewolf", NULL };
static const char *browserprivatecmd[]  =   { "librewolf", "--private-window", NULL };

static const char *top_cmd[]            =   { "st", "-g", "124x27", "-i", "-e", "top", NULL };
static const char *wavemon_cmd[]        =   { "st", "-g", "124x27", "-i", "-e", "wavemon", NULL };
static const char *qalc_cmd[]          =   { "st", "-g", "70x14",  "-i", "-e", "qalc", NULL };

static const Key keys[] = {
	/* modifier                     key                          function               argument */
	{ MODKEY,                       XK_Return,                   spawn,                 {.v = termcmd } },
	{ MODKEY,                       XK_b,                        spawn,                 {.v = browsercmd } },
	{ MODKEY | ShiftMask,           XK_b,                        spawn,                 {.v = browserprivatecmd } },
	{ MODKEY,                       XK_s,                        spawn,                 {.v = top_cmd } },
	{ MODKEY,                       XK_a,                        spawn,                 {.v = wavemon_cmd } },
	{ MODKEY,                       XK_equal,                    spawn,                 {.v = qalc_cmd } },
	{ MODKEY,                       XK_e,                        spawn,                 {.v = emailcmd } },
	{ MODKEY,                       XK_r,                        spawn,                 {.v = rofirun } },
	{ MODKEY | ShiftMask,           XK_r,                        spawn,                 {.v = rofidrun } },
	{ MODKEY,                       XK_n,                        spawn,                 {.v = rofiwifi } },
	{ MODKEY,                       XK_q,                        spawn,                 {.v = rofipower } },
	{ MODKEY,                       XK_p,                        spawn,                 {.v = rofipass } },
	{ MODKEY,                       XK_f,                        togglebar,             {0} },
	{ MODKEY,                       XK_j,                        focusstack,            {.i = +1 } },
	{ MODKEY,                       XK_k,                        focusstack,            {.i = -1 } },
	{ MODKEY,                       XK_i,                        incnmaster,            {.i = +1 } },
	{ MODKEY,                       XK_d,                        incnmaster,            {.i = -1 } },
	{ MODKEY,                       XK_h,                        setmfact,              {.f = -0.05} },
	{ MODKEY,                       XK_l,                        setmfact,              {.f = +0.05} },
	{ MODKEY,                       XK_Tab,                      view,                  {0} },
	{ MODKEY | ShiftMask,           XK_c,                        killclient,            {0} },
	{ MODKEY,                       XK_t,                        setlayout,             {.v = &layouts[0]} },
	{ MODKEY,                       XK_m,                        setlayout,             {.v = &layouts[1]} },
	{ MODKEY,                       XK_space,                    setlayout,             {0} },
	{ MODKEY | ShiftMask,           XK_space,                    togglefloating,        {0} },
	{ MODKEY,                       XK_0,                        view,                  {.ui = ~0 } },
	{ MODKEY | ShiftMask,           XK_0,                        tag,                   {.ui = ~0 } },
	{ MODKEY,                       XK_comma,                    focusmon,              {.i = -1 } },
	{ MODKEY,                       XK_period,                   focusmon,              {.i = +1 } },
	{ MODKEY | ShiftMask,           XK_comma,                    tagmon,                {.i = -1 } },
	{ MODKEY | ShiftMask,           XK_period,                   tagmon,                {.i = +1 } },
	{ MODKEY | ShiftMask,           XK_q,                        quit,                  {0} },
  { 0,                            XF86XK_AudioRaiseVolume,     spawn,                 {.v = vol_up} },
  { 0,                            XF86XK_AudioLowerVolume,     spawn,                 {.v = vol_down} },
  { 0,                            XF86XK_AudioMute,            spawn,                 {.v = vol_mute} },
	{ 0,				                    XF86XK_MonBrightnessUp,		   spawn,	                {.v = brightness_up} },
	{ 0,				                    XF86XK_MonBrightnessDown,	   spawn,	                {.v = brightness_down} },
	TAGKEYS(                        XK_1,                             0)
	TAGKEYS(                        XK_2,                             1)
	TAGKEYS(                        XK_3,                             2)
	TAGKEYS(                        XK_4,                             3)
	TAGKEYS(                        XK_5,                             4)
	TAGKEYS(                        XK_6,                             5)
	TAGKEYS(                        XK_7,                             6)
	TAGKEYS(                        XK_8,                             7)
	TAGKEYS(                        XK_9,                             8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
