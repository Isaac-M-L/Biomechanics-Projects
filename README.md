# Biomechanics & Computational Bioengineering Portfolio

[![MATLAB](https://img.shields.io/badge/MATLAB-R2023b-orange.svg)](https://www.mathworks.com/products/matlab.html)
[![FEBio](https://img.shields.io/badge/FEBio%20Studio-v3.1.0-blue.svg)](https://febio.org/)
[![ImageJ](https://img.shields.io/badge/ImageJ%20%2F%20Fiji-v1.53c-brightgreen.svg)](https://imagej.net/software/fiji/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A curated collection of computational biomechanics projects covering **bioimage segmentation**, **non-linear finite element analysis (FEA)**, and **numerical sarcomere force-length modeling**.

---

## Featured Projects

| Project | Domain | Tools & Languages | Key Deliverable |
| :--- | :--- | :--- | :--- |
| [**01. Fluorescent Cell Morphometry**](https://github.com/Isaac-M-L/Biomechanics-Projects/tree/main/01-Cell%20Morphology) | Bioimaging | ImageJ / Fiji, MATLAB | Automated cell segmentation pipeline, circularity & area distribution modeling |
| [**02. Cartilage Compression FEA**](./02-Cartilage-fea) | Non-Linear Solid Mechanics | FEBio Studio, PostView | 3D hyperelastic (Neo-Hookean) axial compression simulation under fixed platen restraints |
| [**03. Sarcomere Kinematics**](./03-sarcomere-kinematics) | Muscle Mechanics & Modeling | MATLAB | Piecewise sliding filament theory & non-linear titin elasticity force curves |

---

## Technical Competencies

### Computational & Solid Mechanics
* **Non-Linear Finite Element Analysis:** Hyperelastic constitutive modeling (compressible Neo-Hookean), multi-axial boundary conditions, and reaction force convergence.
* **Biomechanical Modeling:** Cross-bridge sliding filament theory, non-linear titin spring dynamics, and vector superposition of active/passive muscle tension.

### Bioimage Analysis & Computer Vision
* **Image Processing Pipeline:** 8-bit conversion, intensity thresholding (Otsu), morphological binary watershedding, and hole-filling.
* **Morphological Profiling:** Quantitative extraction of surface area, perimeter, circularity index ($C$), aspect ratio ($AR$), and equivalent circular diameter ($ECD$).

### Programming & Scientific Computing
* **MATLAB:** Vectorized mathematical operations, descriptive population statistics (mean, median, IQR, KDE), automated batch data visualization, and figure export.
* **Data Automation:** Bridging CSV datasets from ImageJ into parameterized MATLAB statistical scripts.

---

## Repository Structure

```text
.
├── 01-cell-morphology/
│   ├── Analyze_Cells.m                       # MATLAB parsing & statistical script
│   ├── Drawing of C3-FluorescentCells.png    # Raw Image Used for Analysis
│   ├── Cell_Measurements.csv                 # Segmented morphological data from ImageJ
│   ├── matlab_cell_analysis.png              # Output distribution figure
│   └── README.md                             # Project 1 documentation
│
├── 02-cartilage-fea/
│   ├── model/                                # FEBio model files
│   ├── media/                                # 3D stress contours & reaction graphs
|   ├── data/                                 # Stress Summary Data
│   └── README.md                             # Project 2 documentation
│
├── 03-sarcomere-kinematics/
│   ├── Sarcomere_model.m                     # MATLAB force-length numerical solver
│   ├── Sarcomere_Force_Length.png            # Output force-length figure
│   └── README.md                             # Project 3 documentation
│
└── README.md                                 # Main portfolio landing page
```
---
