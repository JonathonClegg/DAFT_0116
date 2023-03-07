
![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Project | Module 3


## Introduction

The goal of this project is to practise in supervised learning using provided data. We need to create the model for the prediction/classification. 
We will need to research and implement the defined supervised machine learning methods.


## Getting Started

1. EDA and data cleaning.

- Check for missing data
- Check feature types
- Clean feature headers
- Check for high collinearity
- Check for low variance
- Balance data using SMOTE


2.Research about your models.

- BernoulliNB 


- AdaBoostClassifier

Adaboost (Adaptive Boosting) is a meta-algorithm that can be used with a variety of base classifiers, but not all types of classifiers are suitable for use with Adaboost.

Adaboost works by iteratively training a series of base classifiers on a weighted subset of the training data. The algorithm then combines the output of these base classifiers to produce a final prediction. The weights of the training data are adjusted after each iteration to focus on the samples that were misclassified by the previous classifiers.

Adaboost works best with weak learners, which are classifiers that have an error rate that is only slightly better than random guessing. Examples of weak learners include decision trees with limited depth or simple linear classifiers.

In general, any classifier that can be trained on weighted data can be used as a base classifier for Adaboost. Some commonly used classifiers with Adaboost include decision trees, linear models such as logistic regression, and support vector machines.

However, some classifiers may not be suitable for use with Adaboost. For example, ensemble classifiers such as Random Forest and Gradient Boosting already combine multiple weak learners and may not benefit from the additional boosting provided by Adaboost. Also, some complex classifiers such as neural networks may not be well suited for use with Adaboost due to their high computational cost.

In summary, Adaboost can be used with a variety of classifiers, but it works best with weak learners that can be trained on weighted data.

- HistGradientBoostingClassifier 


- Linear Discriminant Analysis


4. Feature selection (if needed)

5. Implement models on the data

6. Do not forget about Hyperparameters tuning

7. Implement AutoML (TPOT)

8. Compare the results using metrics:
- accuracy
- recall
- precision
- ROC_AUC score
- plot ROC_AUC curve

## Deliverables

- '1. data.csv with clean and encoded data
- '2. project7.ipynb' with all code concerning data cleaning and modelling
- '3. Slides/dashboard/notebook with must-have EDA, each model description (how it works, what the parameters are, what exectly you used) and results (for each model and final table with models comparison).
- '4. Please state the conclusion about usability of each model.
- '5. Trello board with logged time.
