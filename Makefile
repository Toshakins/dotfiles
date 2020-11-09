import_vimrc:
	cp ~/.vimrc .

import_zshrc:
	cp ~/.zshrc .

import: import_vimrc import_zshrc
	echo "Imported"
