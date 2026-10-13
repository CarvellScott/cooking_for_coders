.PHONY: clean all
OUTPUT_FILE_STEM := cooking_for_coders

help: ## You are here
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'

$(OUTPUT_FILE_STEM).html: $(OUTPUT_FILE_STEM)/* Makefile ## Make .html output, intended for display on touch screens in the kitchen
	@./$(OUTPUT_FILE_STEM)/pandoc.yaml --css ./$(OUTPUT_FILE_STEM)/_css/style.css ./$(OUTPUT_FILE_STEM)/_posts/foreword.md ./$(OUTPUT_FILE_STEM)/_posts/*.recipe.md ./$(OUTPUT_FILE_STEM)/_posts/ingredients.md -o $@

$(OUTPUT_FILE_STEM).epub: $(OUTPUT_FILE_STEM)/* Makefile ## Make .epub output, intended as a kindle-compatible e-book
	@./$(OUTPUT_FILE_STEM)/pandoc.yaml --css ./$(OUTPUT_FILE_STEM)/_css/epub.css ./$(OUTPUT_FILE_STEM)/_posts/foreword.md ./$(OUTPUT_FILE_STEM)/_posts/*.recipe.md ./$(OUTPUT_FILE_STEM)/_posts/ingredients.md -o $@

all: $(OUTPUT_FILE_STEM).html $(OUTPUT_FILE_STEM).epub

clean:
	rm -f $(OUTPUT_FILE_STEM).html
	rm -f $(OUTPUT_FILE_STEM).epub

