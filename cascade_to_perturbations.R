library(dplyr)
library(tibble)
library(readr)
library(gtools)

# CASCADE 1.0
edge_tbl = readr::read_delim(file = 'https://raw.githubusercontent.com/druglogics/cascade/master/cascade_1.0.sif', delim = "\t", col_names = c('source', 'effect', 'target'), col_types = "ccc")

sources = edge_tbl %>% pull(source)
targets = edge_tbl %>% pull(target)

nodes = unique(c(sources, targets))
drugs = paste0(nodes, "i")
inh = rep('inhibits', length(drugs)) # 77 drugs

## create combos (lexicographic ordering by default)
single = gtools::combinations(n = 77, r = 1, v = drugs)
double = gtools::combinations(n = 77, r = 2, v = drugs)
triple = gtools::combinations(n = 77, r = 3, v = drugs)

## save drugpanel
readr::write_tsv(cbind(drugs, inh, nodes) %>% as.data.frame(), file = 'drugpanel', col_names = FALSE)

## save perturbations file
readr::write_tsv(as.data.frame(single), file = 'perturbations_single')
readr::write_tsv(as.data.frame(double), file = 'perturbations_double')
readr::write_tsv(as.data.frame(triple), file = 'perturbations_triple')

# CASCADE 2.0
edge_tbl_2 = readr::read_delim(file = 'https://raw.githubusercontent.com/druglogics/cascade/master/cascade_2.0.sif', delim = " ", col_names = c('source', 'effect', 'target'), col_types = "ccc")

sources = edge_tbl_2 %>% pull(source)
targets = edge_tbl_2 %>% pull(target)

nodes = unique(c(sources, targets))
drugs = paste0(nodes, "i")
inh = rep('inhibits', length(drugs)) # 144 drugs

## save drugpanel
readr::write_tsv(cbind(drugs, inh, nodes) %>% as.data.frame(), file = 'drugpanel', col_names = FALSE)
