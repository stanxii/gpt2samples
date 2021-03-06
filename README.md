
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gpt2samples

The goal of gpt2samples is to help users explore the various sample
texts as generated by Open AI’s new GPT2 transformer based language
model.

An original implementation of a smaller version of GPT-2 can be found
[here](https://github.com/openai/gpt-2), and the original sample text
files can be found
[here](https://github.com/openai/gpt-2/tree/master/gpt-2-samples).

## Data

This package contains the following data, stored as
tibbles:

| tibble               | description                                                                                                                           |
| :------------------- | :------------------------------------------------------------------------------------------------------------------------------------ |
| conditional-t07      | Conditionally generated samples, with context prompts from `WebText` test corpus, default settings (temperature 1 and no truncation). |
| conditional-topk40   | Conditionally generated samples, with context prompts from `WebText` test corpus, with temperature 0.7                                |
| conditional          | Conditionally generated samples, with context prompts from `WebText` test corpus, with truncation and top\_k 40.                      |
| unconditional        | Unconditionally generated samples, default settings.                                                                                  |
| unconditional-t07    | Unconditionally generated samples, with temperature 0.7                                                                               |
| unconditional-topk40 | Unconditionally generated samples, with truncation and top\_k 40.                                                                     |

Additionally, all the generated samples (conditional and unconditional)
can be explored by calling
`all_samples()`.

## Installation

<!-- You can install the released version of gpt2samples from [CRAN](https://CRAN.R-project.org) with:-->

You can install the released version of gpt2samples from GitHub with:

``` r
# install.packages("gpt2samples")
# install.packages("devtools")
devtools::install_github("kanishkamisra/gpt2samples")
```

## Example

This is a basic example to explore the data using dplyr verbs

``` r
library(dplyr)
library(gpt2samples)

conditional %>%
  filter(id == 100)
#> # A tibble: 2 x 4
#>   file         id type     text                                            
#>   <chr>     <int> <chr>    <chr>                                           
#> 1 conditio…   100 sample   the waterbody that you are managing, getting pr…
#> 2 conditio…   100 complet… Permit, WDFW ensures that nonconventional child…

unconditional_t07 %>%
  filter(id == 250)
#> # A tibble: 213 x 3
#>    file              id text                                               
#>    <chr>          <int> <chr>                                              
#>  1 unconditional…   250 This question already has an answer here: How do I…
#>  2 unconditional…   250 ""                                                 
#>  3 unconditional…   250 This is a basic question regarding text editing. T…
#>  4 unconditional…   250 ""                                                 
#>  5 unconditional…   250 (A)                                                
#>  6 unconditional…   250 ""                                                 
#>  7 unconditional…   250 (B)                                                
#>  8 unconditional…   250 ""                                                 
#>  9 unconditional…   250 (A)                                                
#> 10 unconditional…   250 ""                                                 
#> # … with 203 more rows

all_samples() %>%
  filter(file == "conditional") %>%
  tail()
#> # A tibble: 6 x 4
#>   file         id type     text                                            
#>   <chr>     <int> <chr>    <chr>                                           
#> 1 conditio…   500 complet… "BOP will be remembered for it's technically in…
#> 2 conditio…   500 complet… ""                                              
#> 3 conditio…   500 complet… There were literal lap times in running the wat…
#> 4 conditio…   500 complet… ""                                              
#> 5 conditio…   500 complet… ""                                              
#> 6 conditio…   500 complet… I was voiced by legendary actor turns down play…

all_samples() %>%
  group_by(file) %>%
  summarise(total_lines = n())
#> # A tibble: 6 x 2
#>   file                 total_lines
#>   <chr>                      <int>
#> 1 conditional                18067
#> 2 conditional-t07            24081
#> 3 conditional-topk40         20405
#> 4 unconditional              19469
#> 5 unconditional-t07          28841
#> 6 unconditional-topk40       21188
```

Additional exploration can use Julia Silge and David Robinson’s
`tidytext`
[package](https://cran.r-project.org/web/packages/tidytext/index.html),
among others to analyze the generated text as produced by GPT-2.

## Contributor Code of Conduct

Please note that the ‘gpt2samples’ project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.
