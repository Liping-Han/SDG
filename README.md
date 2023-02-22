# The Statistical Difference based Grouping (SD-G) test
The SD-G test is developed based on the Scott-Knott ESD with the aim of fixing the limitation in the non-parametric Scott-Knott ESD by proposing a novel partition algorithm, which finds the partition where all the treatment pairs that fall in the same group are statistically similar. 




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
