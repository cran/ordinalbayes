#' Subset of The Cancer Genome Atlas Cervical Cancer HTSeq Data.
#'
#' This subset includes 2,009 transcripts and four phenotypic variables for
#' 242 subjects with squamous cell cervical cancer.
#'
#' @format The format is of formal class 'DESeqTransform' (package "DESeq2") with the following extractor functions:
#' \describe{
#'   \item{assay}{includes rld transformed transcript expression data}
#'   \item{colData}{includes phenotypic data: \code{age_at_index}, \code{cigarettes_per_day}, \code{race}, and \code{Stage}}
#' }
#' @source TCGAbiolinks TCGA-CESC
#' @examples
#' \dontrun{
#' data(finalSet)
#' names(colData(finalSet))
#' head(colData(finalSet))
#' head(assay(finalSet)[,1:5])
#' }
#' @keywords datasets
"finalSet"

#' Smaller Subset of The Cancer Genome Atlas Cervical Cancer HTSeq Data.
#'
#' This subset includes 41 transcripts and four phenotypic variables for
#' 242 subjects with squamous cell cervical cancer.
#'
#' @format The format is of formal class 'DESeqTransform' (package "DESeq2") with the following extractor functions:
#' \describe{
#'   \item{assay}{includes rld transformed transcript expression data}
#'   \item{colData}{includes phenotypic data: \code{age_at_index}, \code{cigarettes_per_day}, \code{race}, and \code{Stage}}
#' }
#' @source TCGAbiolinks TCGA-CESC
#' @examples
#' \donttest{
#' library(DESeq2)
#' data(reducedSet)
#' head(colData(reducedSet))
#' }
#' @keywords datasets
"reducedSet"
