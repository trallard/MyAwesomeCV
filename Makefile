.PHONY: cvs devrel swe research letter clean

BUILD_DIR = build
OUT_DIR = cv-pdfs
LATEXMK = latexmk -xelatex -interaction=nonstopmode -halt-on-error -outdir=$(BUILD_DIR)

COMMON = cv-common.tex awesome-cv.cls $(wildcard cv-sections/shared/*.tex)

cvs: devrel swe research

devrel: $(OUT_DIR)/Tania_Allard_CV_DevRel.pdf
swe: $(OUT_DIR)/Tania_Allard_CV_SWE.pdf
research: $(OUT_DIR)/Tania_Allard_CV_Research.pdf

$(OUT_DIR)/Tania_Allard_CV_DevRel.pdf: cv-devrel.tex $(COMMON) $(wildcard cv-sections/devrel/*.tex)
$(OUT_DIR)/Tania_Allard_CV_SWE.pdf: cv-swe.tex $(COMMON) $(wildcard cv-sections/swe/*.tex)
$(OUT_DIR)/Tania_Allard_CV_Research.pdf: cv-research.tex $(COMMON) $(wildcard cv-sections/research/*.tex) $(wildcard cv-sections/swe/*.tex)

$(OUT_DIR)/Tania_Allard_CV_%.pdf:
	$(LATEXMK) -jobname=Tania_Allard_CV_$* cv-$(shell echo $* | tr A-Z a-z).tex
	@mkdir -p $(OUT_DIR)
	cp $(BUILD_DIR)/Tania_Allard_CV_$*.pdf $@
	@grep -a 'Output written' $(BUILD_DIR)/Tania_Allard_CV_$*.log | tail -1

# Cover letter: content from letters/letter.tex (git-ignored), else letters/example.tex
letter:
	$(LATEXMK) -g -jobname=Tania_Allard_Cover_Letter cover-letter.tex
	cp $(BUILD_DIR)/Tania_Allard_Cover_Letter.pdf letters/
	@grep -a 'Output written' $(BUILD_DIR)/Tania_Allard_Cover_Letter.log | tail -1

clean:
	rm -rf $(BUILD_DIR)
