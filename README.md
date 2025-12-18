# Mathematical Modeling and Analysis of the SEIR Epidemic System

This repository contains the final project for the course **MTH4201: Models in Applied Mathematics** (Florida Tech, Fall 2025)

The project focuses on the mathematical modeling and analysis of infectious disease spread using the **SEIR** (Susceptible-Exposed-Infectious-Recovered) framework, which incorporates a latent period and vital dynamics (births and deaths)

## 📋 Project Description

The objective of this study is to analyze the dynamic behavior of an infectious disease within a closed population, determine the epidemic threshold ($R_0$), and investigate the stability of equilibrium states

Unlike the standard SIR model, this model includes an **Exposed (E)** compartment—representing individuals who have contracted the pathogen but are not yet infectious. This introduces a delay in transmission, resulting in more complex dynamics such as damped oscillations.

### Key Features
**Mathematical Formulation:** A system of 4 nonlinear Ordinary Differential Equations (ODEs)
**Stability Analysis:** Linearization, Jacobian matrix evaluation, and eigenvalue computation to classify stability types (e.g., stable spiral sink)
**Numerical Simulation:** Implementation in MATLAB using the `ode45` solver
**Visualization:** Time-series population dynamics, 3D phase portraits, and bifurcation diagrams

## 🧮 Mathematical Model

The model is defined by the following system of differential equations
$$
\begin{cases}
\frac{dS}{dt} = \mu - \beta SI - \mu S \\
\frac{dE}{dt} = \beta SI - (\sigma + \mu)E \\
\frac{dI}{dt} = \sigma E - (\gamma + \mu)I \\
\frac{dR}{dt} = \gamma I - \mu R
\end{cases}
$$

**Parameters**
* $\beta$: Transmission rate.
* $\sigma$: Incubation rate ($1/\sigma$ is the average latent period).
* $\gamma$: Recovery rate.
* $\mu$: Natural birth/death rate.

The **Basic Reproduction Number ($R_0$)** is derived as
$$R_0 = \frac{\beta \sigma}{(\sigma + \mu)(\gamma + \mu)}$$

## 📂 Repository Structure

The repository consists of the following MATLAB scripts:

### 1. `core.m`
The main simulation file that
Solves the ODE system over the time span $t=[0, 300]$
Calculates and displays $R_0$
**Figure 1:** Plots time-series dynamics for S, E, I, and R populations
**Figure 2:** Plots the 3D Phase Space Trajectory ($S$ vs $E$ vs $I$) to visualize the spiral approach to equilibrium
**Figure 3:** Generates a Transcritical Bifurcation Diagram showing the endemic infection level ($I^*$) as a function of $\beta$

### 2. `eigenvalues.m`
A script for analytical verification of stability
Calculates the endemic equilibrium point ($S^*, E^*, I^*$)
Constructs the Jacobian matrix ($J_{EE}$) at this equilibrium
Computes eigenvalues to mathematically confirm the nature of the stability (negative real parts with imaginary components indicate a stable spiral)

## 🚀 How to Run

Ensure you have MATLAB installed.

1.  **Run Simulation:**
    Open `core.m` and run it. The script will output the calculated $R_0$ in the command window and generate three figures visualizing the system's behavior

2.  **Verify Stability:**
Run `eigenvalues.m` to see the computed eigenvalues for the Jacobian matrix at the endemic equilibrium

## 📊 Results

Using the parameters $\beta=0.5, \sigma=0.1, \gamma=0.1, \mu=0.01$
**$R_0 \approx 4.1322$**: The system is in a super-critical state, indicating a severe epidemic
**Dynamics:** The system exhibits damped oscillations, converging to an endemic equilibrium
* **Stability:** The phase portrait reveals a **stable spiral sink**. This is confirmed by the eigenvalues $\lambda \approx -0.0173 \pm 0.0389i$, where the negative real part ensures asymptotic stability and the imaginary part explains the spiraling behavior
**Bifurcation:** The analysis confirms a transcritical bifurcation at $R_0=1$, where the disease-free equilibrium loses stability and an endemic state emerges

## 👤 Author

**Artem Okhten**
Department of Mathematics and Systems Engineering
Florida Institute of Technology
December 2025


## 📚 References
This project is based on foundational work in mathematical biology
Kermack & McKendrick (1927)
J.D. Murray, *Mathematical Biology*
Hethcote, H. W. (2000)
