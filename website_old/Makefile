
OUTPUT_FILES = public/index.html public/scripts/index.js public/styles/index.css
OUTPUT_PAGES = index
SRC_DIR = src
SCRIPTS_DIR = public/scripts
STYLES_DIR = public/styles
TEMPLATES_DIR = public

all: build test

test:

build: $(OUTPUT_FILES)

# Template *.coffee to *.html
%.html: $(SRC_DIR)/%.coffeecup
	coffeecup -o $(TEMPLATES_DIR) $<

$(SCRIPTS_DIR)/%.js: $(SRC_DIR)/%.coffee
	coffee -o $(SCRIPTS_DIR) -c $<

$(STYLES_DIR)/%.css: $(SRC_DIR)/%.styl
	stylus -o $(STYLES_DIR) $<

watch: watch1 watch2 watch3

watch1: watch_templates

watch2: watch_scripts

watch3: watch_styles

watch_templates:
	coffeecup -o $(TEMPLATES_DIR) -w $(SRC_DIR)/*.coffeecup

watch_scripts:
	coffee -o $(SCRIPTS_DIR) -w $(SRC_DIR)

watch_styles:
	stylus -w $(SRC_DIR) -o $(STYLES_DIR)
