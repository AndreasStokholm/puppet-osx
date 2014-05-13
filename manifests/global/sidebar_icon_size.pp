# Public: Set the size of sidebar icons.
# size - Size for icons in sidebar. Defaults to 1, other possible values are 2 and 3.
#
# Examples
#
#   # set the icon size to 1 (the default)...
#   include osx::global::sidebar_icon_size
#
#   # ...or pick your own size!
#   class { 'osx::global::sidebar_icon_size':
#     size => 2
#   }

class osx::global::sidebar_icon_size($size = 1) {
  boxen::osx_defaults { 'sidebar icon size':
	domain => 'NSGlobalDomain',
	type   => 'int',
	key    => 'NSTableViewDefaultSizeMode',
	value  => $size,
	user   => $::boxen_user;
  }
}
