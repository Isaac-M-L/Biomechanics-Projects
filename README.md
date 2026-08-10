# Biomechanics Projects

Welcome to my portfolio. This repository highlights the practical projects in computational bioengineering, bioimage processing, and mechanical modeling.

---

## Project 1: Fluorescent Cell Morphometric Analysis

### Overview
This project establishes an automated image analysis to quantify cell morphology metrics, specifically area and circularity, from fluorescence microscopy data. 

### Tools Used
* **ImageJ:** Image segmentation, thresholding, watershedding, and feature extraction.
* **MATLAB:** Statistical processing and automated histogram generation.

###  Results & Visualization
Below is the statistical distribution of cell area and circularity extracted via [Analyze_Cells.m]([url](https://github.com/Isaac-M-L/Biomechanics-Projects/blob/main/01-Cell%20Morphology/Analyze_Cells.m)):

![Cell Morphometry Analysis](https://github.com/Isaac-M-L/Biomechanics-Projects/blob/main/01-Cell%20Morphology/matlab_cell_analysis.png)

###  Repository Structure
* `01-cell Morphology/Cell_Measurements.csv`: Morphometric features exported from ImageJ.
* `01-cell Morphology/Drawing of C3-FluorescentCells.png`: Subject figure of analysis from ImageJ.
* `01-cell Morphology/Analyze_Cells.m`: MATLAB script for parsing CSV data and rendering summary figures.
* `01-cell Morphology/matlab_cell_analysis.png`: Output figure.

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
![3D Effective Stress Contour](media/Stress_Contour.bmp)
*Figure 1: Deformed mesh displaying effective (von Mises) stress distribution at 10% nominal strain.*

### 2. Quantitative Stress Response
![Summary of Effective Stress](media/Stress_vs_Time_Summary.png.bmp)
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
