
OUTPUT_FILES = index.html scripts/index.js styles/index.css
SRC_DIR = pages
SCRIPTS_DIR = scripts
STYLES_DIR = styles
NIB_PATH = /usr/local/share/npm/lib/node_modules/nib
TEMPLATES_DIR = .

all: build test

test:

build: $(OUTPUT_FILES)

# Template *.coffee to *.html
%.html: $(SRC_DIR)/%.coffeecup
	coffeecup -o $(TEMPLATES_DIR) $<

$(SCRIPTS_DIR)/%.js: $(SRC_DIR)/%.coffee
	coffee -o $(SCRIPTS_DIR) -c $<

$(STYLES_DIR)/%.css: $(SRC_DIR)/%.styl
	stylus -o $(STYLES_DIR) -I $(NIB_PATH) $<

watch: watch_templates watch_scripts watch_styles

watch_templates:
	coffeecup -o $(TEMPLATES_DIR) -w $(SRC_DIR)/*.coffeecup

watch_scripts:
	coffee -o $(SCRIPTS_DIR) -w $(SRC_DIR)

watch_styles:
	stylus -w $(SRC_DIR) -o $(STYLES_DIR) -I $(NIB_PATH)

