
<!-- README.md is generated from README.Rmd. Please edit that file -->

# qraLm <a href='https://github.com/WorldHealthOrganization/qraLm/docs/'><img src='man/figures/hex-qraLm.png' align="right" height="80" /></a>

A R package to develop quantitative risk assessment for *L.
monocytogenes* in Frozen Vegetables, Diced RTE Cantaloupe and
Cold-smoked RTE Fish.

- Version developed under the scope of the [Joint
  FAO/WHO](https://www.who.int/publications/m/item/jemra-of-listeria-monocytogenes-in-foods)
  Expert meeting on microbiological risk assessment of Listeria
  monocytogenes in foods.

## Installation

- You can install `qraLm` from [GitHub:
  https://github.com/WorldHealthOrganization/qraLm](https://github.com/WorldHealthOrganization/qraLm)
  using the `devtools` package, with the R code below.

- You must first install the `doseresponsemodels` package from [github:
  https://github.com/vcadavez/doseresponsemodels](https://github.com/vcadavez/doseresponsemodels),
  which implements the dose-response models for Listeria monocytogenes.

- For Windows users it is recommended to install [Rtools:
  https://cran.r-project.org/bin/windows/Rtools/](https://cran.r-project.org/bin/windows/Rtools/)
  before.

- The packages on which `qraLm` depends are: `Hmisc`, `extraDistr`,
  `mc2d`, `matrixStats`, `DT`, `dplyr`, `ggplot2`, `plotly`,
  `doseresponsemodels` and `BH`; you should install them before
  installing `qraLm`.

``` r

if (!require("devtools")) install.packages("devtools")
devtools::install_github("rpouillot/doseresponsemodels")
devtools::install_github("https://github.com/WorldHealthOrganization/qraLm")
```

## Using qraLm

You can find the vignettes at the `qraLm` website:
<https://github.com/WorldHealthOrganization/qraLm/>.

## Reporting bugs

You can report bugs at:
<https://github.com/WorldHealthOrganization/qraLm/issues>.
