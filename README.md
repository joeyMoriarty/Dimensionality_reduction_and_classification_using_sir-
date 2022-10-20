# Dimensionality_reduction_and_classification_using_sir-
Here we try to classify image data from colonoscopy of patients and predict the seviority of the gastrointestinal lesions in the patient.

This project contains first classification of two data set via a machine learning classifier which tries to reduce the dimensions of the feature space as the
data is having more dimensions than required. This makes the processing
and analysis of the data difficult computationally and intuitively. Therefore
the dimensionality reduction method should be such that the information
contained in the data set is intact plus we get lesser dimensions to work
with. This result can be obtained by various classifiers used in the field but
we need to chose the one which suits our data set. As both our data sets
are sparse and of higher dimensions therefore we need a method which can
account for both of these attributes.
Therefore we use Sliced Inverse Regression for dimensionality reduction
of our data sets and obtain our reduced feature space. Sirface produces wellseparated classes in a low-dimensional subspace, even under severe variation
in lighting and facial expression. Sirface can be shown to be equivalent to the
well known Fisherface algorithm in the subspace sense. However, Sirface is
shown to produce the optimal reduced subspace (with the fewest dimensions)
resulting in a lower error rate and reduced computational expense.

The data set has the features extracted from clolonoscopy videos showing
gastrointestinal lesions. The .xlsx file has the ground truth collected from
both expert image inspection and histology. There are features vectors for 76
lesions, and there are 3 types of lesion: hyperplasic, adenoma and serrated
adenoma. we considered this classification problem as a binary by combining adenoma and serrated adenoma in the same class. So, hyperplasic lesions
would belong to the class ’benign’ while the other two types of gastrointestinal lesions would go to the ’malignant’ class.


The method which we have selected is SIR or Sliced Inverse Regression. This
method being similar to fisherface is a better alternative to the same as this
method is proved to be insensitive to large variation in lighting directions on
the subject. Taking a pattern classification approach, we consider each pixel
in an image as coordinate in a high dimensional space. However, since faces
are not truly Lambertian surfaces and indeed produce self-shadowing, images
will deviate from this linear subspace. Rather than explicitly modeling this
deviation, we linearly project the image into a subspace in a manner which
discounts those regions of the face with large deviation using Sliced Inverse
Regression .
