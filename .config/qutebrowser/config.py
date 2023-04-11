config.load_autoconfig()

palette = {
    'background': '#0D1017',
    'background-alt': '#0D1017',
    'background-attention': '#181920',
    'border': '#0D1017',
    'current-line': '#44475a',
    'selection': '#44475a',
    'foreground': '#f8f8f2',
    'foreground-alt': '#e0e0e0',
    'foreground-attention': '#ffffff',
    'comment': '#6272a4',
    'cyan': '#2bbac5',
    'green': '#89ca78',
    'orange': '#d19a66',
    'pink': '#ff79c6',
    'purple': '#d55fd3',
    'red': '#ef596f',
    'yellow': '#f1fa8c'
}

## Background color of the completion widget category headers.
c.colors.completion.category.bg = palette['background']

## Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = palette['border']

## Top border color of the completion widget category headers.
c.colors.completion.category.border.top = palette['border']

## Foreground color of completion widget category headers.
c.colors.completion.category.fg = palette['foreground']

## Background color of the completion widget for even rows.
c.colors.completion.even.bg = palette['background']

## Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = palette['background-alt']

## Text color of the completion widget.
c.colors.completion.fg = palette['foreground']

## Background color of the selected completion item.
c.colors.completion.item.selected.bg = palette['selection']

## Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = palette['selection']

## Top border color of the completion widget category headers.
c.colors.completion.item.selected.border.top = palette['selection']

## Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = palette['foreground']

## Foreground color of the matched text in the completion.
c.colors.completion.match.fg = palette['orange']

## Color of the scrollbar in completion view
c.colors.completion.scrollbar.bg = palette['background']

## Color of the scrollbar handle in completion view.
c.colors.completion.scrollbar.fg = palette['foreground']

## Background color for the download bar.
c.colors.downloads.bar.bg = palette['background']

## Background color for downloads with errors.
c.colors.downloads.error.bg = palette['background']

## Foreground color for downloads with errors.
c.colors.downloads.error.fg = palette['red']

## Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = palette['background']

## Color gradient interpolation system for download backgrounds.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
c.colors.downloads.system.bg = 'none'

## Background color for hints. Note that you can use a `rgba(...)` value
## for transparency.
c.colors.hints.bg = palette['background']

## Font color for hints.
c.colors.hints.fg = palette['orange']

## Hints
c.hints.border = '1px solid ' + palette['background-alt']

## Font color for the matched part of hints.
c.colors.hints.match.fg = palette['foreground-alt']

## Background color of the keyhint widget.
c.colors.keyhint.bg = palette['background']

## Text color for the keyhint widget.
c.colors.keyhint.fg = palette['orange']

## Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = palette['selection']

## Background color of an error message.
c.colors.messages.error.bg = palette['background']

## Border color of an error message.
c.colors.messages.error.border = palette['background-alt']

## Foreground color of an error message.
c.colors.messages.error.fg = palette['red']

## Background color of an info message.
c.colors.messages.info.bg = palette['background']

## Border color of an info message.
c.colors.messages.info.border = palette['background-alt']

## Foreground color an info message.
c.colors.messages.info.fg = palette['comment']

## Background color of a warning message.
c.colors.messages.warning.bg = palette['background']

## Border color of a warning message.
c.colors.messages.warning.border = palette['background-alt']

## Foreground color a warning message.
c.colors.messages.warning.fg = palette['red']

## Background color for prompts.
c.colors.prompts.bg = palette['background']

# ## Border used around UI elements in prompts.
c.colors.prompts.border = '1px solid ' + palette['background-alt']

## Foreground color for prompts.
c.colors.prompts.fg = palette['cyan']

## Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = palette['selection']

## Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = palette['background']

## Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = palette['orange']

## Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = palette['background']

## Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = palette['orange']

## Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = palette['background']

## Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = palette['pink']

## Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = palette['background']

## Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = palette['foreground-alt']

## Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = palette['background-attention']

## Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = palette['foreground-attention']

## Background color of the statusbar.
c.colors.statusbar.normal.bg = palette['background']

## Foreground color of the statusbar.
c.colors.statusbar.normal.fg = palette['foreground']

## Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = palette['background']

## Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = palette['orange']

## Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = palette['background-alt']

## Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = palette['foreground-alt']

## Background color of the progress bar.
c.colors.statusbar.progress.bg = palette['background']

## Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = palette['red']

## Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = palette['foreground']

## Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = palette['cyan']

## Foreground color of the URL in the statusbar on successful load
c.colors.statusbar.url.success.http.fg = palette['green']

## Foreground color of the URL in the statusbar on successful load
c.colors.statusbar.url.success.https.fg = palette['green']

## Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = palette['yellow']

## Background color of the tab bar.
## Type: QtColor
c.colors.tabs.bar.bg = palette['selection']

## Background color of unselected even tabs.
## Type: QtColor
c.colors.tabs.even.bg = palette['selection']

## Foreground color of unselected even tabs.
## Type: QtColor
c.colors.tabs.even.fg = palette['foreground']

## Color for the tab indicator on errors.
## Type: QtColor
c.colors.tabs.indicator.error = palette['red']

## Color gradient start for the tab indicator.
## Type: QtColor
c.colors.tabs.indicator.start = palette['orange']

## Color gradient end for the tab indicator.
## Type: QtColor
c.colors.tabs.indicator.stop = palette['green']

## Color gradient interpolation system for the tab indicator.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
c.colors.tabs.indicator.system = 'none'

## Background color of unselected odd tabs.
## Type: QtColor
c.colors.tabs.odd.bg = palette['selection']

## Foreground color of unselected odd tabs.
## Type: QtColor
c.colors.tabs.odd.fg = palette['foreground']

# ## Background color of selected even tabs.
# ## Type: QtColor
c.colors.tabs.selected.even.bg = palette['background']

# ## Foreground color of selected even tabs.
# ## Type: QtColor
c.colors.tabs.selected.even.fg = palette['foreground']

# ## Background color of selected odd tabs.
# ## Type: QtColor
c.colors.tabs.selected.odd.bg = palette['background']

# ## Foreground color of selected odd tabs.
# ## Type: QtColor
c.colors.tabs.selected.odd.fg = palette['foreground']

c.tabs.indicator.width = 1
c.tabs.favicons.scale = 1

# NOTE: config.py is intended for advanced users who are comfortable
# with manually migrating the config file on qutebrowser upgrades. If
# you prefer, you can also configure qutebrowser using the
# :set/:bind/:config-* commands without having to write a config.py
# file.
#
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Always restore open sites when qutebrowser is reopened. Without this
# option set, `:wq` (`:quit --save`) needs to be used to save open tabs
# (and restore them), while quitting qutebrowser in any other way will
# not save/restore the session. By default, this will save to the
# session which was last loaded. This behavior can be customized via the
# `session.default_name` setting.
# Type: Bool
c.auto_save.session = True

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL. With QtWebEngine 5.15.0+, paths will be stripped
# from URLs, so URL patterns using paths will not match. With
# QtWebEngine 5.15.2+, subdomains are additionally stripped as well, so
# you will typically need to set this setting for `example.com` when the
# cookie is set on `somesubdomain.example.com` for it to work properly.
# To debug issues with this setting, start qutebrowser with `--debug
# --logfilter network --debug-flag log-cookies` which will show all
# cookies being set.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'devtools://*')

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
# Type: String
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Height (in pixels or as percentage of the window) of the completion.
# Type: PercOrInt
c.completion.height = '25%'

# Shrink the completion to be smaller than the configured size if there
# are no scrollbars.
# Type: Bool
c.completion.shrink = True

# Characters used for hint strings.
# Type: UniqueCharString
c.hints.chars = 'asdfjkl'

# Quickmarks
c.url.searchengines = {
    "DEFAULT": "https://paulgo.io/search?q={}&language=en-US&time_range=&safesearch=0&categories=general",
    "ai": "https://you.com/search?q={}%3F&fromSearchBar=true&tbm=youchat&cid=c0_f2040148-c6f0-4846-8580-917933a1e4c3",
    "ddg": "https://duckduckgo.com/?q={}",
    "yt": "https://piped.garudalinux.org/results?search_query={}",
    "YT": "https://www.youtube.com/results?search_query={}"
}
