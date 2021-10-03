.PHONY=test
test:
	helm upgrade --install -n media-server -f values.local.yaml --dry-run --debug media-server .

install:
	helm upgrade --install -n media-server -f values.local.yaml media-server .
