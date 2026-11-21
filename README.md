# Tania Allard — CV

LaTeX source for my CV, built on the [Awesome CV](https://github.com/posquit0/Awesome-CV) template.

The CV comes in three variants that share most of their content:

| Variant | Focus | Main file | Output |
| --- | --- | --- | --- |
| DevRel | Leadership-forward: communities, advocacy, ecosystem growth | `cv-devrel.tex` | `cv-pdfs/Tania_Allard_CV_DevRel.pdf` |
| STEM | Builder-forward: scientific computing and research tools | `cv-stem.tex` | `cv-pdfs/Tania_Allard_CV_STEM.pdf` |
| Research | Research-forward: PhD and technical leadership first | `cv-research.tex` | `cv-pdfs/Tania_Allard_CV_Research.pdf` |

## Building

Requires a TeX distribution with XeLaTeX and `latexmk` (for example MacTeX or TeX Live).

```bash
make cvs        # build all three variants
make devrel     # or build one: devrel, stem, research
make clean      # remove the build/ folder
```

PDFs are written to `cv-pdfs/`, and `make` prints the page count for each build. Every variant should stay at **two pages**: cut words rather than shrinking the type.

## Where the content lives

```
cv-common.tex          layout, colours, contact details, footer (all variants)
cv-devrel.tex          headline and section order for each variant
cv-stem.tex
cv-research.tex
cv-sections/
  shared/              identical in every variant
    oss.tex              Open Source
    education.tex        Education
    skills.tex           Technical Skills
    experience-*.tex     Hello Soda, Consultant and USC entries
  devrel/              summary, speaking, experience (DevRel only)
  stem/                summary, experience (STEM; experience also used by Research)
  research/            summary (Research only)
cv-pdfs/               built PDFs, plus older archived CVs
```

## Making changes

- **A fact that appears in every CV** (download figures, governance roles, education, skills, older jobs): edit the file in `cv-sections/shared/` once, then run `make cvs`.
- **Wording that differs between variants** (summary, the CEO, Director, Microsoft and Sheffield entries): edit that variant's file in `cv-sections/<variant>/`. If the same fact changes, update it in `devrel/experience.tex` and `stem/experience.tex`.
- **Research variant**: reuses `stem/experience.tex`. Give it its own `research/experience.tex` only if its wording needs to diverge.
- **Headline under the name**: the `\position{...}` line in each main file.
- **Contact details or layout**: `cv-common.tex`.
- **Adding a variant**: copy a main file (for example `cv-stem.tex`), add a folder under `cv-sections/`, and add a target to the `Makefile`.

## Writing style

British English; first-person summary; present tense for current roles and past tense for earlier ones; evidence (project, people, number) before adjectives; only figures that can be defended in an interview.

## Credit

Template: [Awesome CV](https://github.com/posquit0/Awesome-CV) by Claud D. Park, licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/). Fonts: [Roboto](https://github.com/google/roboto), [Source Sans Pro](https://github.com/adobe-fonts/source-sans-pro) and [FontAwesome](https://github.com/furl/latex-fontawesome).

Please don't reuse my CV content without permission.
