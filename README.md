# Tania Allard — CV

LaTeX source for my CV, built on the [Awesome CV](https://github.com/posquit0/Awesome-CV) template.

Since I wear a lot of hats 🎩 the CV comes in three variants that share most of their content:

| Variant | Focus | Main file | Output |
| --- | --- | --- | --- |
| DevRel | Community/leadership-forward: communities, advocacy, ecosystem growth | `cv-devrel.tex` | `cv-pdfs/Tania_Allard_CV_DevRel.pdf` |
| SWE | Builder-forward: software engineering, scientific computing and research tools | `cv-swe.tex` | `cv-pdfs/Tania_Allard_CV_SWE.pdf` |
| Research | Research-forward: PhD and technical leadership first | `cv-research.tex` | `cv-pdfs/Tania_Allard_CV_Research.pdf` |

## Building

Requires a TeX distribution with XeLaTeX and `latexmk` (for example MacTeX or TeX Live).

```bash
make cvs        # build all three variants
make devrel     # or build one: devrel, swe, research
make letter     # build the cover letter (see below)
make clean      # remove the build/ folder
```

PDFs are written to `cv-pdfs/`, and `make` prints the page count for each build. Every variant should stay at **two pages**: cut words rather than shrinking the type.

## Cover letter

`cover-letter.tex` is the frame: it shares the header and contact details with the CVs. The letter's content (recipient, title, opening and body) lives in a separate file:

1. Copy `letters/example.tex` to `letters/letter.tex` and edit it.
2. Run `make letter`. The PDF is written to `letters/Tania_Allard_Cover_Letter.pdf`.

Everything in `letters/` except `example.tex` is ignored by git, so letters for specific applications never end up in this public repository. Without a `letters/letter.tex`, `make letter` builds the example.

## Where the content lives

```text
cv-common.tex          layout, colours, contact details, footer (all variants)
cv-devrel.tex          headline and section order for each variant
cv-swe.tex
cv-research.tex
cv-sections/
  shared/              identical in every variant
    oss.tex              Open Source
    education.tex        Education
    skills.tex           Technical Skills
    experience-*.tex     Hello Soda, Consultant and USC entries
  devrel/              summary, speaking, experience (DevRel only)
  swe/                 summary, experience (SWE; experience also used by Research)
  research/            summary (Research only)
cv-pdfs/               built PDFs, plus older archived CVs
cover-letter.tex       cover letter frame
letters/               letter content; only example.tex is tracked
```

## Making changes

- **A fact that appears in every CV** (download figures, governance roles, education, skills, older jobs): edit the file in `cv-sections/shared/` once, then run `make cvs`.
- **Wording that differs between variants** (summary, the CEO, Director, Microsoft and Sheffield entries): edit that variant's file in `cv-sections/<variant>/`. If the same fact changes, update it in `devrel/experience.tex` and `swe/experience.tex`.
- **Research variant**: reuses `swe/experience.tex`. Give it its own `research/experience.tex` only if its wording needs to diverge.
- **Headline under the name**: the `\position{...}` line in each main file.
- **Contact details or layout**: `cv-common.tex`.
- **Adding a variant**: copy a main file (for example `cv-swe.tex`), add a folder under `cv-sections/`, and add a target to the `Makefile`.

## Writing style

British English; first-person summary; present tense for current roles and past tense for earlier ones; evidence (project, people, number) before adjectives; only figures that can be defended in an interview.

## Credit

Template: [Awesome CV](https://github.com/posquit0/Awesome-CV) by Claud D. Park, licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/). Fonts: [Roboto](https://github.com/google/roboto), [Source Sans Pro](https://github.com/adobe-fonts/source-sans-pro) and [FontAwesome](https://github.com/furl/latex-fontawesome).

Please don't reuse my CV content without permission.
