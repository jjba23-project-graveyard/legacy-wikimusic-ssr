.PHONY: all test clean

fmt:
	find . -name '*.hs' -type f -exec ormolu --mode inplace {} \;
	find . -name '*.nix' -exec nixfmt {} \;
	-statix check
	-deadnix -f
dev: fmt
	ghcid --warnings --restart=./wikimusic-api.cabal --test "WikiMusic.SSR.Boot.boot"
server:
	stack --nix run -- "./resources/config/run-production.toml"
test: fmt
	LANG=C.UTF-8 stack --nix test
build: fmt
	LANG=C.UTF-8 stack --nix build
release:
	LANG=C.UTF-8 stack --nix sdist .
