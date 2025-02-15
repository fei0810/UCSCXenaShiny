% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vis_identifier.R
\name{vis_identifier_grp_comparison}
\alias{vis_identifier_grp_comparison}
\title{Visualize Comparison of an Molecule Identifier between Groups}
\usage{
vis_identifier_grp_comparison(
  dataset = NULL,
  id = NULL,
  grp_df,
  samples = NULL,
  fun_type = c("betweenstats", "withinstats"),
  type = c("parametric", "nonparametric", "robust", "bayes"),
  pairwise.comparisons = TRUE,
  p.adjust.method = c("holm", "hochberg", "hommel", "bonferroni", "BH", "BY", "fdr",
    "none"),
  ggtheme = cowplot::theme_cowplot(),
  ...
)
}
\arguments{
\item{dataset}{the dataset to obtain identifiers.}

\item{id}{the molecule identifier.}

\item{grp_df}{When \code{dataset} and \code{id} are all not \code{NULL}, it should be a \code{data.frame} with 2 or 3 columns.
\itemize{
\item The first column refers to sample ID.
\item The second column refers to groups indicated in axis X.
\item The third column is optional, which indicates facet variable.
When any of \code{dataset} and \code{id} is \code{NULL}, it should be a \code{data.frame} with 3 or 4 columns.
\item The first column refers to sample ID.
\item The second column refers to values indicated in axis Y.
\item The third column refers to groups indicated in axis X.
\item The fourth column is optional, which indicates facet variable.
}}

\item{samples}{default is \code{NULL}, can be common sample names for two datasets.}

\item{fun_type}{select the function to compare groups.}

\item{type}{A character specifying the type of statistical approach.
Four possible options:

\itemize{
\item \code{"parametric"}
\item \code{"nonparametric"}
\item \code{"robust"}
\item \code{"bayes"}
}

Corresponding abbreviations are also accepted: \code{"p"} (for parametric),
\code{"np"} (for nonparametric), \code{"r"} (for robust), or \code{"bf"} (for Bayesian).}

\item{pairwise.comparisons}{Logical that decides whether pairwise comparisons
are to be displayed (default: \code{TRUE}). Please note that only
\strong{significant} comparisons will be shown by default. To change this
behavior, select appropriate option with \code{pairwise.display} argument. The
pairwise comparison dataframes are prepared using the
\code{pairwiseComparisons::pairwise_comparisons} function. For more details
about pairwise comparisons, see the documentation for that function.}

\item{p.adjust.method}{Adjustment method for \emph{p}-values for multiple
comparisons. Possible methods are: \code{"holm"} (default), \code{"hochberg"},
\code{"hommel"}, \code{"bonferroni"}, \code{"BH"}, \code{"BY"}, \code{"fdr"}, \code{"none"}.}

\item{ggtheme}{A function, \code{ggplot2} theme name. Default value is
\code{ggplot2::theme_bw()}. Any of the \code{ggplot2} themes, or themes from
extension packages are allowed (e.g., \code{ggthemes::theme_fivethirtyeight()},
\code{hrbrthemes::theme_ipsum_ps()}, etc.).}

\item{...}{other parameters passing to \link[ggstatsplot:ggbetweenstats]{ggstatsplot::ggbetweenstats} or \link[ggstatsplot:ggwithinstats]{ggstatsplot::ggwithinstats}.}
}
\value{
a (gg)plot object.
}
\description{
NOTE: the dataset must be dense matrix in UCSC Xena data hubs.
}
\examples{
\dontrun{
library(UCSCXenaTools)
expr_dataset <- "TCGA.LUAD.sampleMap/HiSeqV2_percentile"
cli_dataset <- "TCGA.LUAD.sampleMap/LUAD_clinicalMatrix"
id <- "TP53"
cli_df <- XenaGenerate(
  subset = XenaDatasets == "TCGA.LUAD.sampleMap/LUAD_clinicalMatrix"
) \%>\%
  XenaQuery() \%>\%
  XenaDownload() \%>\%
  XenaPrepare()

# group data.frame with 2 columns
vis_identifier_grp_comparison(expr_dataset, id, cli_df[, c("sampleID", "gender")])
# group data.frame with 3 columns
vis_identifier_grp_comparison(
  expr_dataset, id,
  cli_df[, c("sampleID", "pathologic_M", "gender")] \%>\%
    dplyr::filter(pathologic_M \%in\% c("M0", "MX"))
)

# When not use the value of `identifier` from `dataset`
vis_identifier_grp_comparison(grp_df = cli_df[, c(1, 2, 71)])
vis_identifier_grp_comparison(grp_df = cli_df[, c(1, 2, 71, 111)])
}

}
