#!/usr/bin/env zsh
# Strip away 30 years of cruft to decrease size.
# modified: 2021-02-21 01:00:50 -0700



keepers=(
alacritty
ansi
dtterm
dumb
eterm
iterm{,2}
kitty
konsole
linux
mintty
nsterm
putty
rxvt{,-unicode}
screen{,2}
st
termite
tmux
vscode
vt{52,100,102,{2..5}20}
vte
xterm{,-new}
)


# $destRoot = "$1"
# $prefix   = "$2"
cd "${1}/${2}/share/terminfo"

for i ($keepers)
do
  j=(./??/${i}{,-256color,-direct,+common}(N))
  for e ($j)
  do
	d="$(dirname ${e})"
	l="../lite/${d}"
    install -d "${l}"
    cp  -cv $e "${l}"
  done
done

cd ..
rm -rf terminfo
mv lite terminfo
