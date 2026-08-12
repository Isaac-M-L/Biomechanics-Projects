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

---

## Project 1: Fluorescent Cell Morphometric Analysis

### Overview
Quantifying morphological alterations in cell populations is fundamental to cellular biomechanics and mechanobiology. Variations in cellular surface area and circularity serve as direct phenotypic indicators of mechanical cytoskeletal remodeling, adhesion dynamics, cell cycle progression, and external substrate stiffness sensing.

This project implements an end-to-end quantitative image processing and statistical pipeline. Using **ImageJ**, raw multi-channel fluorescence microscopy images are pre-processed, binarized, and segmented into discrete cellular boundaries. Extracted shape descriptors are then parsed by an automated **MATLAB** script (`Analyze_Cells.m`) to perform statistical filtering, distribution fitting, and multi-parameter visualization. 

### Tools Used
* **ImageJ:** Image segmentation, thresholding, watershedding, and feature extraction.
* **MATLAB:** Statistical processing and automated histogram generation.

###  Results & Visualization
Below is the statistical distribution of cell area and circularity extracted via [Analyze_Cells.m]([url](https://github.com/Isaac-M-L/Biomechanics-Projects/blob/main/01-Cell%20Morphology/Analyze_Cells.m)):

![Cell Morphometry Analysis](https://github.com/Isaac-M-L/Biomechanics-Projects/blob/main/01-Cell%20Morphology/matlab_cell_analysis.png)

## Discussion & Biomechanical Significance

### 1. Translating Images into Mechanical Insights
In cellular biomechanics, how a cell looks tells us how it mechanically interacts with its environment:
* **Cell Area (Spreading):** A larger surface area indicates that the cell is actively adhering to its substrate, forming focal adhesions, and generating internal cytoskeletal tension.
* **Circularity (Polarization):** Lower circularity values ($C < 0.70$) reveal elongated, branched cells with active protrusions (lamellipodia/filopodia), characteristic of healthy, migrating, or mechanically loaded cells. Highly circular cells ($C \to 1.0$) often represent rounded, non-adherent, or dividing cells.

### 2. Real-World Engineering Applications
* **Biomaterial Testing:** Rapidly screens how well cells adhere, spread, and survive on new implant coatings or tissue engineering hydrogels.
* **Drug Discovery:** Identifies whether drug treatments disrupt cytoskeletal integrity (causing cells to detach or shrink) without relying on expensive, destructive operations.
* **Tissue Regeneration:** Quantifies cell alignment and migration during processes such as wound healing.

### 3. Pipeline Strengths & Limitations
* **Automation:** Coupling ImageJ for segmentation with MATLAB for statistical modeling eliminates user bias and enables high-throughput processing across hundreds of cells.
* **Limitations:** 2D thresholding and watershed segmentation can struggle with heavily clustered or overlapping cell monolayers. Future iterations could integrate deep-learning segmentation (such as Cellpose) and multi-channel nuclear-to-cytoplasm ($N:C$) ratio tracking.

---

## Project 2: FEA Simulation: Cartilage Plug Unconfined Compression

### Overview
This project evaluates the distribution of effective stress during the compression of a 3D object under an **unconfined axial compression test** in order to replicate a $2 \times 2 \times 2 \text{ mm}$ cartilage tissue plug undergoing up to **10% nominal strain** using 3D non-linear Finite Element Analysis (FEBio Studio).

## Objectives & Key Highlights
* Model elastic material behavior using a **Neo-Hookean strain energy formulation**.
* Evaluate the stress distribution and verify the theoretical linear elastic response ($\sigma = E \cdot \varepsilon$).
* Analyze the effect of idealized frictionless boundary conditions versus experimental boundary conditions.

---

## Technical Specifications

| Parameter | Value / Setting |
| :--- | :--- |
| **Software** | FEBio Studio 3.1.0 |
| **Material Model** | Neo-Hookean ($E = 1.0 \text{ MPa}$, $\nu = 0.3$) |
| **Mesh Geometry** | $2 \times 2 \times 2 \text{ mm}$ Cube ($10 \times 10 \times 10$ Hex8 elements) |
| **Top Surface BC** | Prescribed Displacement | $u_z = -0.2 \text{ mm}$ ($10\%$ axial compression) |
| **Bottom Surface BC** | Fixed Displacement | $u_x = 0, u_y = 0, u_z = 0$ (Bonded / full platen friction constraint) |

## Results and Analysis

### 1. 3D Effective Stress Contour Map
![3D Effective Stress Contour](https://github.com/Isaac-M-L/Biomechanics-Projects/blob/main/02-Cartilage-fea/Media%3A/Stress_Contour.png)
*Figure 1: Deformed mesh displaying effective (von Mises) stress distribution at 10% nominal strain.*

### 2. Quantitative Stress Response
![Summary of Effective Stress](https://github.com/Isaac-M-L/Biomechanics-Projects/blob/main/02-Cartilage-fea/Media%3A/Stress_vs_Time_Summary.png)
*Figure 2: Statistical summary (Max, Avg, Min) of effective stress across the loading surface over time/strain steps.*

#### Quantitative Findings:
* **Peak Average Stress at 10% Strain:** $\approx 0.106 \text{ MPa}$
* **Max Stress:** $0.109 \text{ MPa}$ | **Min Stress:** $0.103 \text{ MPa}$
* **Theoretical Comparison:** Under standard linear elasticity ($\sigma = E \cdot \varepsilon$), a $10\%$ strain ($\varepsilon = 0.10$) with $E = 1.0 \text{ MPa}$ yields a theoretical stress of $0.100 \text{ MPa}$. The FEA result of $\approx 0.106 \text{ MPa}$ closely matches expectations, with slight deviation attributable to geometric non-linearities and transverse compression restraints.

---

## Discussion: Boundary Conditions & Numerical Stability

1. **Kinematic Restraint ($u_x = u_y = u_z = 0$):**
   * Fully constraining the bottom face in all three principal axes ($X, Y, Z$) prevents unconstrained rigid body translation/rotation during solving, providing matrix stability and enabling normal simulation termination.
2. **Physical Interpretation (High Friction / Bonded Support):**
   * Constraining $u_x = 0$ and $u_y = 0$ at the base models a high-friction or glued interface with the lower testing platen, restricting lateral expansion at the bottom while allowing free lateral strain throughout the upper layers.

## Project 3: Sarcomere Kinematics

### Overview
Through the use of **matlab** programming software, this project simulates the active, passive, and total isometric force production of a skeletal muscle sarcomere across varying lengths ($1.00\ \mu\text{m} \le L \le 4.00\ \mu\text{m}$).

The model describes the cross-bridge availability governed by the **sliding filament theory** and the elasticity of the structural protein **titin** through the plotting of macroscopic normalized tension curves.

---

## Biomechanical Formulation

### 1. Active Force Production ($F_{\text{Active}}$)
The production of active force depends on the geometric overlap of thick myosin filament heads with the thin actin filaments and their ability to initiate cross-bridge binding. 

Sarcomere Length ($L$) | Kinematic State | Mathematical Model ($F / F_0$) | Biomechanical Mechanism |
| :--- | :--- | :--- | :--- |
| **$L < 1.27\ \mu\text{m}$** | Extreme Collision | $0$ | Myosin collides with Z-discs; actin filaments buckle and crumple. |
| **$1.27 \le L < 1.67\ \mu\text{m}$** | Ascending Limb 1 | $\frac{L - 1.27}{1.67 - 1.27} \times 0.70$ | Myosin deforms against Z-discs, restricting cross-bridge formation. |
| **$1.67 \le L < 2.00\ \mu\text{m}$** | Ascending Limb 2 | $0.70 + 0.30 \times \frac{L - 1.67}{2.00 - 1.67}$ | Opposite thin filaments double-overlap in the central bare zone. |
| **$2.00 \le L \le 2.25\ \mu\text{m}$** | Optimal Plateau ($L_0$) | $1.00$ | Maximum cross-bridge binding capacity across all active myosin heads. |
| **$2.25 < L \le 3.65\ \mu\text{m}$** | Descending Limb | $1.00 - \frac{L - 2.25}{3.65 - 2.25}$ | Linear reduction in overlap area as actin is pulled away from myosin heads. |
| **$L > 3.65\ \mu\text{m}$** | Zero Overlap | $0$ | Total filament detachment; zero active cross-bridge formation possible. |

---

### 2. Passive Elastic Force ($F_{\text{Passive}}$)
Passive tension resists excessive sarcomere stretch to prevent structural tearing. It is modelled as an exponential spring representing the elasticity of **titin**:

$$\text{Strain } (\varepsilon) = \frac{L - L_{\text{opt,max}}}{L_{\text{opt,max}}} \quad \text{for } L > L_{\text{opt,max}}$$

$$F_{\text{Passive}} = 0.05 \times \left(e^{k \cdot \varepsilon} - 1\right) \quad \text{where } k = 3.5$$

---

### 3. Total Force ($F_{\text{Total}}$)
Total force generated by the muscle fiber is the combination of the active and passive mechanical components:

$$F_{\text{Total}} = F_{\text{Active}} + F_{\text{Passive}}$$

---

## Results & Visualization

![Sarcomere Force-Length Relationship](https://github.com/Isaac-M-L/Biomechanics-Projects/blob/main/03-sarcomere-kinematics/Sarcomere_Force_Length.png)

### Key Observations:
1. **Isometric Plateau ($2.00 - 2.25\ \mu\text{m}$):** Peak normalized active force ($F/F_0 = 1.0$) is sustained across a $0.25\ \mu\text{m}$ range corresponding to the width of the central myosin bare zone.
2. **Linear Force Reduction:** On the descending limb, every $0.10\ \mu\text{m}$ increase in length reduces active capacity by $\approx 7.1\%$.
3. **Passive Transition:** Passive resistance becomes significant beyond $L = 2.50\ \mu\text{m}$, compensating for the loss of active contractile force at high muscle extensions.

---

## How to Run
1. Open MATLAB.
2. Run [Sarcomere_model.m](https://github.com/Isaac-M-L/Biomechanics-Projects/blob/main/03-sarcomere-kinematics/Sarcomere_model.m).
3. The script automatically computes all 500 length steps and exports the high-resolution visualization `sarcomere_force_length.png`.
