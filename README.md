# Biomechanics Projects

Welcome to my portfolio. This repository highlights the practical projects in computational bioengineering, bioimage processing, and mechanical modeling.

---

## Project 1: Fluorescent Cell Morphometric Analysis

### Overview
This project establishes an automated image analysis to quantify cell morphology metrics, specifically area and circularity, from fluorescence microscopy data. 

### Tools Used
* **ImageJ / Fiji:** Image segmentation, thresholding, watershedding, and feature extraction.
* **MATLAB:** Statistical processing and automated histogram generation.

###  Results & Visualization
Below is the statistical distribution of cell area and circularity extracted via [Analyze_Cells.m]([url](https://github.com/Isaac-M-L/Biomechanics-Projects/blob/main/01-Cell%20Morphology/Analyze_Cells.m)):

![Cell Morphometry Analysis](https://github.com/Isaac-M-L/Biomechanics-Projects/blob/main/01-Cell%20Morphology/matlab_cell_analysis.png)

###  Repository Structure
* `01-cell-morphology/Cell Measurements.csv`: Morphometric features exported from ImageJ.
* `01-cell-morphology/Drawing of C3-FluorescentCells.png`: Subject figure of analysis from ImageJ.
* `01-cell-morphology/Analyze_Cells.m`: MATLAB script for parsing CSV data and rendering summary figures.
* `01-cell-morphology/matlab_cell_analysis.png`: Output figure.
