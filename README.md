# The Statistical Difference based Grouping (SD-G) test
The SD-G test [Han et al., (2022) <https://doi.org/10.1145/3576041>] was developed based on the Scott-Knott ESD [Tantithamthavorn et al., (2018) <https://doi.org/10.1109/TSE.2018.2794977>], which fixs the limitation in the non-parametric Scott-Knott ESD by proposing a novel grouping algorithm that finds the partition where all the treatment pairs that fall in the same group are statistically similar. 




### Usage
```r
install.packages("devtools")
devtools::install_github("Liping-Han/SDG", ref = "main")
library(SDG)
# example usage
data <- read.csv("/Users/hlp/R Project/SDG/example.csv", encoding = "UTF-8")
sdg <- SD_G(data)
print(sdg)
plot(sdg)
```

### Referencing SDG
SDG can be referenced as:
```tex
@article{han2022uncertainty,
  title={Uncertainty-aware Robustness Assessment of Industrial Elevator Systems},
  author={Han, Liping and Ali, Shaukat and Yue, Tao and Arrieta, Aitor and Arratibel, Maite},
  journal={ACM Transactions on Software Engineering and Methodology},
  publisher={ACM New York, NY}
}
```
