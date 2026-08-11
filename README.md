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
[3D Effective Stress Contour](https://github.com/Isaac-M-L/Biomechanics-Projects/blob/main/02-Cartilage-fea/Media%3A/Stress_Contour.png)
*Figure 1: Deformed mesh displaying effective (von Mises) stress distribution at 10% nominal strain.*

### 2. Quantitative Stress Response
[Summary of Effective Stress](https://github.com/Isaac-M-L/Biomechanics-Projects/blob/main/02-Cartilage-fea/Media%3A/Stress_vs_Time_Summary.png)
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

[Sarcomere Force-Length Relationship](https://github.com/Isaac-M-L/Biomechanics-Projects/blob/main/03-sarcomere-kinematics/Sarcomere_Force_Length.png)

### Key Observations:
1. **Isometric Plateau ($2.00 - 2.25\ \mu\text{m}$):** Peak normalized active force ($F/F_0 = 1.0$) is sustained across a $0.25\ \mu\text{m}$ range corresponding to the width of the central myosin bare zone.
2. **Linear Force Reduction:** On the descending limb, every $0.10\ \mu\text{m}$ increase in length reduces active capacity by $\approx 7.1\%$.
3. **Passive Transition:** Passive resistance becomes significant beyond $L = 2.50\ \mu\text{m}$, compensating for the loss of active contractile force at high muscle extensions.

---

## How to Run
1. Open MATLAB.
2. Run [Sarcomere_model.m](https://github.com/Isaac-M-L/Biomechanics-Projects/blob/main/03-sarcomere-kinematics/Sarcomere_model.m).
3. The script automatically computes all 500 length steps and exports the high-resolution visualization `sarcomere_force_length.png`.
