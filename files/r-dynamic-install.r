#!/usr/bin/env Rscript

# thanks stackoverflow
# http://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them

p <- commandArgs(TRUE)
r <- 'http://cran.rstudio.com/'

install_package <- function(pack) {
  if(!(pack %in% row.names(installed.packages()))) {
    update.packages(ask=F, repos=r)
    install.packages(pack,dependencies=T, repos=r)
  }
  require(pack, character.only=TRUE)
}

for(pack in p) { install_package(pack) }

completeFun <- function(data, desiredCols) {
  completeVec <- complete.cases(data[, desiredCols])
  return(data[completeVec, ])
}
