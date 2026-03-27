#  Clustering Methods & Numerical Linear Algebra 

This project explores several fundamental clustering techniques, **K-Means**, **K-Medoids**, and **Hierarchical Clustering**, with an emphasis on their mathematical foundations and their connection to **Numerical Linear Algebra**, a core component of modern AI methods.


### Why Numerical Linear Algebra?

Numerical Linear Algebra provides the tools to efficiently represent and manipulate data in vector and matrix form. Since most datasets in machine learning are naturally expressed as matrices, clustering algorithms heavily rely on linear algebra operations such as:

- Vector norms (e.g., Euclidean distance)  
- Matrix operations (multiplication, factorization)  
- Eigenvalues and eigenvectors (in advanced methods)  
- Optimization techniques  

These tools allow clustering algorithms to scale to large datasets while maintaining computational efficiency.


### Clustering Methods Overview

#### 1. K-Means

K-Means partitions data into \(k\) clusters by minimizing the within-cluster variance. It iteratively:

- Assigns points to the nearest centroid (using distance computations)  
- Updates centroids as the mean of assigned points  

** Linear Algebra Connection:**

- Centroids are computed as vector averages  
- Distance calculations rely on vector norms  
- Efficient implementations use matrix operations  

#### 2. K-Medoids

K-Medoids is similar to K-Means but uses actual data points (medoids) as cluster centers, making it more robust to outliers.

** Linear Algebra Connection:**

- Pairwise distance matrices are central  
- Optimization involves minimizing total dissimilarity  
- Often relies on matrix-based distance computations  


#### 3. Hierarchical Clustering

This method builds a tree (dendrogram) of clusters using either:

- Agglomerative (bottom-up)  
- Divisive (top-down) strategies  

** Linear Algebra Connection:**

- Distance matrices are iteratively updated  
- Linkage criteria (single, complete, average) depend on matrix operations  
- Efficient storage and updates of pairwise distances are key  


### Connection to AI

Clustering is a form of **unsupervised learning**, widely used in:

- Pattern recognition  
- Data compression  
- Anomaly detection  
- Preprocessing for supervised learning

Numerical Linear Algebra ensures these methods remain computationally feasible, especially for high-dimensional datasets common in AI.



Some **real-life examples** are provided in this [PDF document](https://github.com/AminAPNA/Mathematics-for-AI-or-data-science-Clustering-methods/blob/main/Example_Projects.pdf), and the corresponding **MATLAB codes** are available [here](https://github.com/AminAPNA/Mathematics-for-AI-or-data-science-Clustering-methods/tree/main/my-code-folder).

