# Config based on https://github.com/rahulsend89/dotfile/blob/b829763ffaad928399b1234eb71e4a6dfa25f546/.qutebrowser/config.py

# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Load bindings settings
config.source("bindings.py")

# Load fonts settings
config.source("search_engines.py")

# Load search engines setting.
config.source("fonts.py")

# Load theme.
config.source("themes/nord.py")

#Setting dark mode
#config.set("colors.webpage.darkmode.enabled", True)
c.colors.webpage.darkmode.enabled = True

# Which cookies to accept. See https://qutebrowser.org/doc/help/settings.html#content.cookies.accept
# Type: String
# Valid values:
#   - all: Accept all cookies. (default)
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
# config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
# config.set('content.cookies.accept', 'all', 'devtools://*')
c.content.cookies.accept = "never"
## We can set cookies options for particular sites.
config.set('content.cookies.accept', 'all', '*.github.com/*')
config.set('content.cookies.accept', 'all', '*.youtube.com/*')

# User agent to send. See https://qutebrowser.org/doc/help/settings.html#content.headers.user_agent
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101 Firefox/68.0', 'https://*.pokerstars.es/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version} Edg/{upstream_browser_version}', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')


import os.path

# c.qt.force_platform = "minimal"
c.completion.web_history.max_items = 10000
c.content.default_encoding = "utf-8"
c.content.javascript.enabled = True
c.content.pdfjs = True
c.downloads.location.directory = os.path.expanduser("~/Baixades")
c.downloads.location.prompt = False
c.downloads.remove_finished = 10000
c.editor.command = ["em", "{}"]
c.hints.uppercase = True
c.keyhint.delay = 100
c.scrolling.smooth = True
# c.tabs.background = True
c.tabs.title.format = "{perc}{current_title}"
#page to open if :open -t/-b/-w is used without URL. Default: start.duckduckgo.com
c.url.default_page = "https://news.ycombinator.com/"
#c.url.start_pages = ""
