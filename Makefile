.PHONY: sass serve fmt install deploy

serve:
	python3 -m http.server

sass:
	sass --watch ./scss/custom.scss ./css/custom.css

fmt:
	dprint fmt index.html scss/custom.scss

install:
	pnpm install

deploy:
	openrsync -av index.html css ${SRV}:/var/www/htdocs/css.ijanc.org/
