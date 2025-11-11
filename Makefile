.PHONY: sass serve

serve:
	python3 -m http.server

sass:
	sass --watch ./scss/custom.scss ./css/custom.css

fmt:
	dprint fmt index.html

install:
	pnpm install
