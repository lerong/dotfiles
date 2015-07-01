#!/bin/tcsh

#-------------------------------------------------------------
# set paths
set path = ($path $HOME)

#-------------------------------------------------------------
# set filename completion options
set autolist 
set color 
set colorcat
set autocorrect			# fix my mistakes.
set history = 5000		# history buffer
set watch=(0 any any)		# who's here?
unset autologout		# idle.
unset noglob			# 

#-------------------------------------------------------------
# set some env variables
setenv PHOME "~/projects/lli11/Projects/"
setenv TERM xterm

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls 'ls -h --color'
alias lx 'ls -lXB'         #  Sort by extension.
alias lk 'ls -lSr'         #  Sort by size, biggest last.
alias lt 'ls -ltr'         #  Sort by date, most recent last.
alias lc 'ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu 'ls -ltur'        #  Sort by/show access time,most recent last.
#-------------------------------------------------------------
# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll "ls -lv --group-directories-first"
alias lm 'll |more'        #  Pipe through 'more'
alias lr 'll -R'           #  Recursive ls.
alias la 'll -A'           #  Show hidden files.
#-------------------------------------------------------------
# Quicker navigation
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."

#-------------------------------------------------------------
# shortcuts for source files
alias res  "source  ~/.cshrc "
#alias esource "env emacs ~/,cshrc -nw"

#-------------------------------------------------------------
# load modules 
module load R/3.2.0
module load pandoc/1.12.4.2
module load git