<<<<<<< HEAD
## primate_ribo : A comparative study of inter-primates divergence in translation levels


View our results [here](https://jhsiao999.github.io/primate_ribo).

See the [contributing guidelines](contrib) to add a new analysis.
=======
## A comparative study of inter-primates divergence in translation levels

View our website [here](https://jhsiao999.github.io/singleCell-method).

## Outline

*  [Creating a new analysis](#creating-a-new-analysis)
*  [Site organization](#site-organization)
*  [Style guide](#style-guide)
*  [Building the site](#building-the-site)
*  [Acknowledgements](#acknowledgements)


## Creating a new anaysis

*  Go to the local repository. 
*  Switch to `master` branch.
*  Open Rstudio project `project/analysis/analysis.Rproj`.
*  Creat a copy of [template.Rmd][].
*  Chnage the author, title, and date at the top of the file.
*  Add the analysis code.
*  Use the RStudio button "Preview HTML" to view the results.
*  Add the analysis to the table of content in [index.md][].
*  Add, commit, and push the new analysis.

```bash
git add new-analysis.Rmd index.md
git commit -m "add awesome analysis"
git push origin master
```


## Site organization

For consistency, we structure the content as follows:

*  Add new analysis (Rmd and html) to `project/analysis`.
*  Add input data (e.g., count matrix and phenotypes) to `project/data`.
*  Add output files (e.g., Admixture proportions and Structure plots)
   to `project/output/name-of-the-html-page/`.
*  Add `rda` files (e.g., results) to `project/rdas`.
*  Add word documents (e.g., method summary) to `project/notes`.
*  Add figures (pdfs or pngs) to `project/figures`


## Style guide

We will follow the useful Style Guide created by John Blischak for a
related [single cell project]()

*  Name variables using snakecase, e.g. `gene_exp_mat`.
*  Name files with dashes, e.g. `this-is-a-long-filename.txt`.
*  Name directories with camelCase, e.g `data`, `rawData`.
*  Use `<-` for assignment.
*  Surround binary operators with spaces, e.g. `1 + 1`, not `1+1`.
*  Use two spaces for indentation.
*  Lines should not be longer than 80 characters.

When in doubt, use the style indicated either in [Google's R Style Guide][google-style] or [Ha$

When writing text, aim to write one sentence per line.
This makes it easier to understand edits when reviewing the version control log.
The limit of 80 characters for code described above does not need to be applied to text.

[google-style]: https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml
[hadley-style]: http://r-pkgs.had.co.nz/style.html



## Builing the site

```bash
git checkout gh-pages
git merge master
git push origin gh-pages
```


## Acknowledgements

*  Thanks to Karl Broman for maintaining publically accessible 
   instructions of building a github website.
*  Thanks to John Blischat for sharing his contributing guidelines.


>>>>>>> master


