.PHONY: sass serve fmt install compress deploy

serve:
	cp index.html public/
	python3 -m http.server -d public

scss:
	sass  ./scss/custom.scss ./public/css/custom.css

watch:
	sass --watch ./scss/custom.scss ./public/css/custom.css

fmt:
	dprint fmt public/index.html public/scss/custom.scss

install:
	pnpm install

compress:
	find public/ -type f \
                \( -name *.html -o -name *.css -o -name *.js -o -name *.txt -o -name *.svg \) \
                -exec gzip -kf {} \;

deploy: compress
	cp index.html public/
	openrsync -av public/ ${SRV}:/var/www/htdocs/css.ijanc.org/
