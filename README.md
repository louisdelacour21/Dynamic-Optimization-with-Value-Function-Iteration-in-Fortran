# Dynamic Optimization with Value Function Iteration in Fortran

## Overview

This Fortran program implements a dynamic optimization model using value function iteration. It simulates a representative agent’s decision-making over capital and consumption, aiming to maximize utility across time under a basic economic model. The project was completed as part of the *Financial Econometrics* course at Universität Regensburg.

## Objective

To determine the optimal consumption strategy by solving a discrete-time, finite-horizon dynamic programming problem using:
- A logarithmic utility function
- A capital grid based on Chebyshev nodes for enhanced numerical stability
- Backward value function iteration

## Features

- Construction of a non-uniform grid using Chebyshev polynomials
- Logarithmic utility function and recursive optimization
- Outputs capital levels, corresponding value function values, and optimal consumption

## Files

- `dynamic_optimization.f90`: Main source file with all subroutines and value function logic

## Requirements

- Fortran compiler (e.g. `gfortran`)

## How to Run

1. **Compile the program:**

   ```bash
   gfortran -o optimize dynamic_optimization.f90
