.PHONY: cvs devrel stem research clean

BUILD_DIR = build
OUT_DIR = cv-pdfs
LATEXMK = latexmk -xelatex -interaction=nonstopmode -halt-on-error -outdir=$(BUILD_DIR)

COMMON = cv-common.tex awesome-cv.cls $(wildcard cv-sections/shared/*.tex)

cvs: devrel stem research

devrel: $(OUT_DIR)/Tania_Allard_CV_DevRel.pdf
stem: $(OUT_DIR)/Tania_Allard_CV_STEM.pdf
research: $(OUT_DIR)/Tania_Allard_CV_Research.pdf

$(OUT_DIR)/Tania_Allard_CV_DevRel.pdf: cv-devrel.tex $(COMMON) $(wildcard cv-sections/devrel/*.tex)
$(OUT_DIR)/Tania_Allard_CV_STEM.pdf: cv-stem.tex $(COMMON) $(wildcard cv-sections/stem/*.tex)
$(OUT_DIR)/Tania_Allard_CV_Research.pdf: cv-research.tex $(COMMON) $(wildcard cv-sections/research/*.tex) $(wildcard cv-sections/stem/*.tex)

$(OUT_DIR)/Tania_Allard_CV_%.pdf:
	$(LATEXMK) -jobname=Tania_Allard_CV_$* cv-$(shell echo $* | tr A-Z a-z).tex
	@mkdir -p $(OUT_DIR)
	cp $(BUILD_DIR)/Tania_Allard_CV_$*.pdf $@
	@grep -a 'Output written' $(BUILD_DIR)/Tania_Allard_CV_$*.log | tail -1

clean:
	rm -rf $(BUILD_DIR)
