/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 0;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "JetBrainsMono:style=Bold:size=15" };
static const char col_bg[]         = "#0D1017";
static const char col_fg[]         = "#BFBDB6";
static const char col_main[]       = "#BFBDB6";
static const char *colors[][3]      = {
  /*               fg         bg         border   */
  [SchemeNorm] = { col_fg, col_bg, col_bg },
  [SchemeSel]  = { col_bg, col_fg, col_main },
};

/* tagging */
static const char *tags[] = { "U", "I", "O", "P" };
static const Rule rules[] = {
  /* xprop(1):
   *	WM_CLASS(STRING) = instance, class
   *	WM_NAME(STRING) = title
   */
  /* class      instance    title       tags mask     isfloating   monitor */
  { "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.60; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
  /* symbol     arrange function */
  { "TLE",      tile },    /* first entry is default */
  { "STK",      monocle },
  { "FLT",      NULL },    /* no layout function means floating behavior */
};

/* key definitions */
#define MODKEY Mod1Mask // Alt Key
#define TAGKEYS(KEY,TAG) \
{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *termcmd[]  = { "st", NULL };

#include "movestack.c"
static Key keys[] = {
  /* modifier                     key        function        argument */

  { MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
  { MODKEY,                       XK_slash,  killclient,     {0} },

  { MODKEY,                       XK_q,      setlayout,      {.v = &layouts[0]} },
  { MODKEY,                       XK_w,      setlayout,      {.v = &layouts[1]} },
  { MODKEY,                       XK_e,      setlayout,      {.v = &layouts[2]} },
  { MODKEY,                       XK_a,      setlayout,      {0} },

  { MODKEY,                       XK_d,      togglebar,      {0} },

  { MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
  { MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
  { MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
  { MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
  { MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
  { MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
  { MODKEY,                       XK_n,      zoom,           {0} },

  { MODKEY,                       XK_Tab,    view,           {0} },
  { MODKEY,                       XK_m,      view,           {0} },
  { MODKEY,                       XK_0,      view,           {.ui = ~0 } },

  { MODKEY,                       XK_comma,  incnmaster,     {.i = +1 } },
  { MODKEY,                       XK_period, incnmaster,     {.i = -1 } },

  //{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
  //{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
  //{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
  //{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
  //{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },

  TAGKEYS(                        XK_u,                      0)
  TAGKEYS(                        XK_i,                      1)
  TAGKEYS(                        XK_o,                      2)
  TAGKEYS(                        XK_p,                      3)

  { MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
  /* click                event mask      button          function        argument */
  { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
  { ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
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

