#!/bin/bash

declare -a repos=(
	"morhetz/gruvbox"
	"preservim/nerdtree"
	"vim-airline/vim-airline"
	"kien/ctrlp.vim"
	"prettier/vim-prettier"
)

vimdir=~/.vim
vimrc=~/.vimrc
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "WARNING: The existing .vimrc will be overwritten. Do you want to continue? (Y/n)"
read sure

if [ $sure != "y" ] && [ $sure != "Y" ]; then
	exit 1
fi

echo -n "Create empty folders for pathogen... "

if [ -d "$vimdir" ]; then
	rm -rf "$vimdir"
fi

mkdir -p ~/.vim/autoload ~/.vim/bundle
echo "Done"

echo -n "Downloading pathogen... "
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo "Done"

for repo in "${repos[@]}"
do 
	echo "Cloning $repo..."
	git clone "https://github.com/$repo" "$vimdir/bundle/$(basename "$repo")"
done

if [ -f "$vimrc" ]; then
	rm -f "$vimrc"
fi

echo -n "Copying .vimrc... "
cp "$DIR/.vimrc" ~/.vimrc
echo "Done"
