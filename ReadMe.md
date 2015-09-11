## A comparative study of inter-primates divergence in translation levels


### Contributing guidelines

#### Creating a new anaysis

* Open Rstudio project under \primate_ribo\project\analysis\`analysis.Rproj`.
* Creat a copy of [template.Rmd].
* Change the author, title, and date at the top of the file.
* Add the analysis code.
* Use the RStudio button "Preview HTML" to view the results.
* Add the analysis to the table of content in [index.md].
* Add, commit, and push the new analysis.
```bash
git add new-analysis.Rmd index.md
git commit -m "add awesome analysis"
git push origin master
```


#### Builing the site

```bash
git checkout gh-pages
git merge master
git commit -m "Build site"
git push origin gh-pages
```


### Acknowledgements

* Thanks to Karl Broman, who provided easy-to-follow instructions on buildling a gh-pages for beginners.
* Thanks to John Blischak for the contributing guidelines.


---

