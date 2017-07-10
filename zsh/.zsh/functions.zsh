function npm-upgrade() {
	f=$1
	shift
	npm rm $* $f && npm i $* $f;
}
