# 📊 Clustering Methods & Numerical Linear Algebra — Why This Session Matters

## 🧠 Overview

Clustering is a fundamental concept in **unsupervised learning**, where the goal is to group data points based on similarity without predefined labels. In this session, we explored three major clustering methods:

- **K-Means**
- **K-Medoids**
- **Hierarchical Clustering**

Understanding these methods is essential for many real-world AI applications, including customer segmentation, anomaly detection, image compression, and bioinformatics.

---

## 🚀 Why Clustering Is Important

Clustering allows us to:

- Discover **hidden structures** in data
- Simplify complex datasets into meaningful groups
- Serve as a **preprocessing step** for other machine learning tasks
- Identify patterns without labeled data

Each method has its strengths:

| Method              | Key Idea                                      | Strengths                                  |
|--------------------|----------------------------------------------|--------------------------------------------|
| K-Means            | Uses centroids (mean of clusters)             | Fast, scalable                             |
| K-Medoids          | Uses actual data points as centers            | Robust to outliers                         |
| Hierarchical       | Builds a tree of clusters (dendrogram)        | No need to predefine number of clusters     |

---

## 🔢 Role of Numerical Linear Algebra

Clustering methods rely heavily on **numerical linear algebra (NLA)** techniques. These provide the computational backbone for handling high-dimensional data efficiently.

### 1. Vector Representation of Data

- Data points are represented as **vectors** in ℝⁿ
- Entire datasets are stored as **matrices**
- Distance computations rely on vector norms (e.g., Euclidean distance)

👉 Example:
```math
\|x - y\|_2 = \sqrt{(x - y)^T (x - y)}
