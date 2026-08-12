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
