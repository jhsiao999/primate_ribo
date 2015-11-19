## A comparative study of inter-primates divergence in translation levels


View our results [here](https://jhsiao999.github.io/primate_ribo).

## Outline

*  [Site organization](#site-organization)
*  [Creating a new analysis](#creating-a-new-analysis)
*  [Compare local versus remote branch]()
*  [Collaborating on the project](#collaborating-on-the-project)
*  [Building the site](#building-the-site)
*  [Style guide](#style-guide)
*  [Acknowledgements](#acknowledgements)



## Site organization

For consistency, we structure the content as follows:

*  Add new analysis (Rmd and html) to `project/analysis`.
*  Add input data (e.g., count matrix and phenotypes) to `project/data`.
*  Add output files (e.g., Admixture proportions and Structure plots)
   to `project/output/name-of-the-html-page/`.
*  Add `rda` files (e.g., results) to `project/rdas`.
*  Add word documents (e.g., method summary) to `project/notes`.
*  Add figures (pdfs or pngs) to `project/figures`



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


## Compare local versus remote branch

```bash
git checkout master  ## go to the local master branch
git fetch  ## grab a copy of the remote branch
git diff remotes/origin master ## compare the local master to the remote master

### At this point, you shoud see a list of files that are changed in the remote repository
```



## Collaborating on the project

Person A makes changes in the local branch and attemps to merge these changes into the remote master and update the remote master.

```bash
git checkout work-branch  ## move the pointer to local work branch
git add new_edits
git commit -m "new_edits" 
git push origin work-branch  ## push edits to remove work branch

### At this point, you can make a merge and a pull request to review the edits 

git checkout master  ## move the pointer to local master
git pull origin master  ## fetch and merge remote master to local master
git merge work-branch  ## merge local work-branch into master and update master 
git checkout work-branch  ## move to local work-branch
git merge master  ## merge remote master to local work-branch
git push origin work-branch  ## move the pointer back to local work-branch

### At this point, the commit numbers of your work-branch and master should be the same!!!!!!!!!!!!!!!!!!!
```



## Builing the site

```bash
git checkout gh-pages
git merge master
git push origin gh-pages
```



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




## Acknowledgements

*  Thanks to Karl Broman for maintaining publically accessible 
   instructions of building a github website.
*  Thanks to John Blischat for sharing his contributing guidelines.

