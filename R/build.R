build_one = function(io) {
  message("* knitting ", io[1])
  if (xfun::Rscript(shQuote(c("R/build_one.R", io))) !=
      0) {
    unlink(io[2])
    stop("Failed to compile ", io[1], " to ", io[2])
  }
}

# Rmd files under the _episodes directory
rmds = list.files("_rmarkdown", "[.]Rmd$", recursive = T, full.names = T)
files = cbind(rmds, gsub("_rmarkdown", "_episodes", xfun::with_ext(rmds, ".md")))

for (i in seq_len(nrow(files))) build_one(files[i, ])

system2("jekyll", c("exe", "build"))
