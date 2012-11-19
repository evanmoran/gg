SRC_DIR = src
STYLES_DIR = .

all: build install

build: gg.css

install: www/styles/gg.css

gg.css: $(SRC_DIR)/gg.styl
	stylus -c -o $(STYLES_DIR) $<
	mv gg.css gg.small.css
	stylus -o $(STYLES_DIR) $<
	cat gg.css | pbcopy
	sub gg.min.css
	open http://www.csscompressor.com/

www/styles/gg.css: gg.css
	cp gg.css www/styles/gg.css
	cp gg.min.css www/styles/gg.min.css