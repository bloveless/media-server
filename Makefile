.PHONY=test
test:
	helm upgrade --install -n media-server -f values.local.yaml --dry-run --debug media-server .

.PHONY=install
install:
	helm upgrade --install -n media-server -f values.local.yaml media-server .

.PHONY=clean
clean:
	helm -n media-server uninstall media-server
