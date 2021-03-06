# $FreeBSD: src/etc/root/dot.cshrc,v 1.29 2004/04/01 19:28:00 krion Exp $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

alias h		history 25
alias j		jobs -l
alias la	ls -a
alias lf	ls -FA
alias ll	ls -lA
alias pcheck  'pkg_version -v |grep -v up-to-date |less'
alias pbuild  'make package-recursive'
alias pupdate 'portupgrade -ap'
alias connect 'ifconfig acx0 ssid YOUR_LAN_NAME wepmode on wepkey YOUR_LAN_WEP_KEY channel 6 up'

# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin /usr/X11R6/bin $HOME/bin)

setenv	EDITOR	vi
setenv	PAGER	more
setenv	BLOCKSIZE	K

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set prompt = "%m %B[%@]%b [%/] # "
	set filec
	set history = 100
	set savehist = 100
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
endif
