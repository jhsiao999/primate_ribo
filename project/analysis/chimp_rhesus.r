s
```{r load_packages}
library(Biobase)

## Set working directories 
dir <- "../"
figdir <- file.path(dir,"figures")
rdadir <- file.path(dir,"rdas")
datadir <- file.path(dir, "data")

## Use broman package for colors
require(broman)
crayon <- brocolors("crayons")

## Load customized packages
require(devtools)
require(Humanzee)
```



> Investigate why there is only 88 genes that is sig. different
in translation efficiency between chimp and rhesus

load(fiTE_other_interspecies.rda

riboRes.Q_sub_cr <-
  testDE(eSetRRP.Q.log2,seqData="rna",species=c("chimp","rhesus"))$res
rnaRes.Q_sub_cr <-
  testDE(eSetRRP.Q.log2,seqData="rna",species=c("chimp","rhesus"))$res

riboRes.Q_sub_hr <-
  testDE(eSetRRP.Q.log2,seqData="rna",species=c("human","rhesus"))$res
rnaRes.Q_sub_hr <-
  testDE(eSetRRP.Q.log2,seqData="rna",species=c("human","rhesus"))$res


sum(res.riborna_human_rhesus$int.qval < .01)
sum(res.riborna_chimp_rhesus$int.qval < .01)




## udpated definition of enhanced/attenuated divergence


## load LRT results of Ribo vs. RNA divergence
load(file.path(rdadir,"TEnew.rda"))

## load LRT results of Ribo DE and RNA DE
load(file.path(rdadir,"DE.rda"))

## Compute fold changes based on un-normalized data
## from the object eSetRRP.log2 in eSetRRP.rda
load(file.path(rdadir,"eSetRRP.rda"))
eSet.temp = eSetRRP.log2[ ,eSetRRP.log2$species!="rhesus"]
fc.mat=lapply(seq_along(c("human","chimp")), function(i) {
  ii = eSet.temp$species==c("human","chimp")[i]
  eSet.tt = eSet.temp[,ii]
  emat = lapply(seq_along(c("ribo","rna","protein")),function(j) {
    jj = eSet.tt$seqData==c("ribo","rna","protein")[j]
    rowMeans(exprs(eSet.tt[,jj]),na.rm=TRUE)
  })
  emat=do.call(cbind,emat)
  colnames(emat)=c("ribo","rna","protein")
  return(data.frame(emat))
})
names(fc.mat)=c("human","chimp")
dmat_unnormed = data.frame(ribo=fc.mat$human$ribo-fc.mat$chimp$ribo,
                           rna=fc.mat$human$rna-fc.mat$chimp$rna,
                           pro=fc.mat$human$protein-fc.mat$chimp$protein)

xy.rnapro = data.frame(rna=dmat_unnormed$rna,
                       pro=dmat_unnormed$pro)
xy.riborna = data.frame(rna=dmat_unnormed$rna,
                        ribo=dmat_unnormed$ribo)
xy.ribopro = data.frame(ribo=dmat_unnormed$ribo,
                        pro=dmat_unnormed$pro)


## RNA-Ribo



mat_riborna <- matrix(0, 2, 2,
                      dimnames = list(attenuation = c("yes", "no"),
                                      enhancement = c("yes", "no") ) )
mat_riborna[1,1] <- sum( (ii_TE_4[ii_sig_TE]) & (ii_TE_3[ii_sig_TE]) )
mat_riborna[1,2] <- sum( (ii_TE_4[ii_sig_TE]) & !(ii_TE_3[ii_sig_TE]) )
mat_riborna[2,2] <- sum( !(ii_TE_4[ii_sig_TE]) & !(ii_TE_3[ii_sig_TE]) )
mat_riborna[2,1] <-  sum( !(ii_TE_4[ii_sig_TE]) & (ii_TE_3[ii_sig_TE]) )

mcnemar.test(mat_riborna)



par(mfrow=c(2,2))
plot(xy.riborna, cex = .8)
points(xy.riborna[which(ii_TE_1), ], 
       col = "blue", pch = 18, cex = .6)
title(main = "neither DE at RNA or Ribo")
abline(0, 1, h = 0, v = 0, col ="gray80")

plot(xy.riborna, cex = .8)
points(xy.riborna[which(ii_TE_2), ], 
       col = "red", pch = 18, cex = .6)
title(main = "non-DE at RNA, but DE Ribo")
abline(0, 1, h = 0, v = 0, col ="gray80")

plot(xy.riborna, cex = .8)
points(xy.riborna[which(ii_TE_4), ], 
       col = "green", pch = 18, cex = .6)
title(main = "DE RNA, attenuated")
abline(0, 1, h = 0, v = 0, col ="gray80")

plot(xy.riborna, cex = .8)
points(xy.riborna[which(ii_TE_3), ], 
       col = "orange", pch = 18, cex = .6)
title(main = "DE RNA, enhanced")
abline(0, 1, h = 0, v = 0, col ="gray80")




## Plot out variances of RNA & Ribo
## Compute fold changes based on un-normalized data
## from the object eSetRRP.log2 in eSetRRP.rda
require(matrixStats)
load(file.path(rdadir,"eSetRRP.rda"))
eSet.temp = eSetRRP.log2[ ,eSetRRP.log2$species!="rhesus"]
varmat_unnormed <- 
    lapply(seq_along(c("ribo", "rna")), function(i) {
    ii_eset <- eSet.temp$seqData==c("ribo","rna")[i]
    rowVars( exprs(eSet.temp[ ,ii_eset]), na.rm = TRUE )
    })
names(varmat_unnormed) <- c("ribo", "rna")
varmat_unnormed <- do.call(cbind, varmat_unnormed)



par(mfrow=c(2,2))
plot(log10(varmat_unnormed), cex = .8)
points(log10(varmat_unnormed)[which(ii_TE_1), ], 
       col = "blue", pch = 18, cex = .6)
title(main = "neither DE at RNA or Ribo")
abline(0, 1, h = 0, v = 0, col ="gray80")

plot( log10(varmat_unnormed), cex = .8)
points(log10(varmat_unnormed)[which(ii_TE_2), ], 
       col = "red", pch = 18, cex = .6)
title(main = "non-DE at RNA, but DE Ribo")
abline(0, 1, h = 0, v = 0, col ="gray80")

plot( log10(varmat_unnormed), cex = .8)
points(log10(varmat_unnormed)[which(ii_TE_4), ], 
       col = "green", pch = 18, cex = .6)
title(main = "DE RNA, attenuated")
abline(0, 1, h = 0, v = 0, col ="gray80")

plot( log10(varmat_unnormed), cex = .8)
points(log10(varmat_unnormed)[which(ii_TE_3), ], 
       col = "orange", pch = 18, cex = .6)
title(main = "DE RNA, enhanced")
abline(0, 1, h = 0, v = 0, col ="gray80")





## standard deviation divided by fold change
varmat_unnormed <- data.frame(varmat_unnormed)
xy.riborna_effect <- 
  data.frame(rna = xy.riborna$rna/sqrt(varmat_unnormed$rna),
             ribo = xy.riborna$ribo/sqrt(varmat_unnormed$ribo))

par(mfrow=c(2,2))
plot(xy.riborna_effect, cex = .8)
points(xy.riborna_effect[which(ii_TE_1), ], 
       col = "blue", pch = 18, cex = .6)
title(main = "neither DE at RNA or Ribo")
abline(0, 1, h = 0, v = 0, col ="gray80")

plot( xy.riborna_effect, cex = .8)
points(xy.riborna_effect[which(ii_TE_2), ], 
       col = "red", pch = 18, cex = .6)
title(main = "non-DE at RNA, but DE Ribo")
abline(0, 1, h = 0, v = 0, col ="gray80")

plot( xy.riborna_effect, cex = .8)
points(xy.riborna_effect[which(ii_TE_4), ], 
       col = "green", pch = 18, cex = .6)
title(main = "DE RNA, attenuated")
abline(0, 1, h = 0, v = 0, col ="gray80")

plot( xy.riborna_effect, cex = .8)
points(xy.riborna_effect[which(ii_TE_3), ], 
       col = "orange", pch = 18, cex = .6)
title(main = "DE RNA, enhanced")
abline(0, 1, h = 0, v = 0, col ="gray80")



