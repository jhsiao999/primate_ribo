# Load data
rdadir <- "./"

library(Biobase)
library(Humanzee)

# Generate 1000 sets of permutation labels
# for Ribo and protein data
n_permute <- 10
n_genes <- 3188

permute_labels <- lapply(1:n_permute, function(per_null){
  data.frame(rna = sample(1:n_genes, replace = FALSE),
             ribo = sample(1:n_genes, replace = FALSE),
             pro = sample(1:n_genes, replace = FALSE))
})


# RNA vs. Ribo
load(file.path(rdadir, "eSetRRP.rda"))
res_null_rna_ribo <- permute_interact(eset_full = eSetRRP.RP.Q.log2, 
                                      datatypes = c("rna", "ribo"), 
                                      permute_labels = permute_labels[1])


# RNA vs. Protein
load(file.path(rdadir, "rnapro.rda"))
res_null_rna_pro <- permute_interact(eset_full = eSetRRP.log2.Qmed, 
                                      datatypes = c("rna", "protein"), 
                                      permute_labels = permute_labels[1])


# Ribo vs. Protein
load(file.path(rdadir, "ribopro.rda"))
res_null_ribo_pro <- permute_interact(eset_full = eSetRRP.log2.Qmed, 
                                     datatypes = c("ribo", "protein"), 
                                     permute_labels = permute_labels[1])




