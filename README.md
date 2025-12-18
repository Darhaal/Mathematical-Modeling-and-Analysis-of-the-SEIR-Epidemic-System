# Mathematical Modeling and Analysis of the SEIR Epidemic System

[cite_start]This repository contains the final project for the course **MTH4201: Models in Applied Mathematics** (Florida Tech, Fall 2025)[cite: 1, 3, 4].

[cite_start]The project focuses on the mathematical modeling and analysis of infectious disease spread using the **SEIR** (Susceptible-Exposed-Infectious-Recovered) framework, which incorporates a latent period and vital dynamics (births and deaths) [cite: 63-65].

## 📋 Project Description

[cite_start]The objective of this study is to analyze the dynamic behavior of an infectious disease within a closed population, determine the epidemic threshold ($R_0$), and investigate the stability of equilibrium states [cite: 33-34].

Unlike the standard SIR model, this model includes an **Exposed (E)** compartment—representing individuals who have contracted the pathogen but are not yet infectious. [cite_start]This introduces a delay in transmission, resulting in more complex dynamics such as damped oscillations [cite: 64, 93-94].

### Key Features
* [cite_start]**Mathematical Formulation:** A system of 4 nonlinear Ordinary Differential Equations (ODEs)[cite: 42].
* [cite_start]**Stability Analysis:** Linearization, Jacobian matrix evaluation, and eigenvalue computation to classify stability types (e.g., stable spiral sink)[cite: 43, 89].
* [cite_start]**Numerical Simulation:** Implementation in MATLAB using the `ode45` solver[cite: 44].
* [cite_start]**Visualization:** Time-series population dynamics, 3D phase portraits, and bifurcation diagrams[cite: 99].

## 🧮 Mathematical Model

[cite_start]The model is defined by the following system of differential equations [cite: 66-67]:

$$
\begin{cases}
\frac{dS}{dt} = \mu - \beta SI - \mu S \\
\frac{dE}{dt} = \beta SI - (\sigma + \mu)E \\
\frac{dI}{dt} = \sigma E - (\gamma + \mu)I \\
\frac{dR}{dt} = \gamma I - \mu R
\end{cases}
$$

[cite_start]**Parameters** [cite: 69-72]:
* $\beta$: Transmission rate.
* $\sigma$: Incubation rate ($1/\sigma$ is the average latent period).
* $\gamma$: Recovery rate.
* $\mu$: Natural birth/death rate.

[cite_start]The **Basic Reproduction Number ($R_0$)** is derived as[cite: 82]:
$$R_0 = \frac{\beta \sigma}{(\sigma + \mu)(\gamma + \mu)}$$

## 📂 Repository Structure

The repository consists of the following MATLAB scripts:

### 1. `core.m`
[cite_start]The main simulation file that [cite: 153-219]:
* [cite_start]Solves the ODE system over the time span $t=[0, 300]$ [cite: 165-166].
* [cite_start]Calculates and displays $R_0$ [cite: 158-159].
* [cite_start]**Figure 1:** Plots time-series dynamics for S, E, I, and R populations [cite: 171-176].
* [cite_start]**Figure 2:** Plots the 3D Phase Space Trajectory ($S$ vs $E$ vs $I$) to visualize the spiral approach to equilibrium [cite: 181-186].
* [cite_start]**Figure 3:** Generates a Transcritical Bifurcation Diagram showing the endemic infection level ($I^*$) as a function of $\beta$ [cite: 204-210].

### 2. `eigenvalues.m`
[cite_start]A script for analytical verification of stability [cite: 220-229].
* [cite_start]Calculates the endemic equilibrium point ($S^*, E^*, I^*$) [cite: 223-225].
* [cite_start]Constructs the Jacobian matrix ($J_{EE}$) at this equilibrium [cite: 226-228].
* [cite_start]Computes eigenvalues to mathematically confirm the nature of the stability (negative real parts with imaginary components indicate a stable spiral)[cite: 229, 91].

## 🚀 How to Run

Ensure you have MATLAB installed.

1.  **Run Simulation:**
    Open `core.m` and run it. [cite_start]The script will output the calculated $R_0$ in the command window and generate three figures visualizing the system's behavior [cite: 96-99].

2.  **Verify Stability:**
    [cite_start]Run `eigenvalues.m` to see the computed eigenvalues for the Jacobian matrix at the endemic equilibrium[cite: 90].

## 📊 Results

[cite_start]Using the parameters $\beta=0.5, \sigma=0.1, \gamma=0.1, \mu=0.01$ [cite: 103-106, 221]:
* [cite_start]**$R_0 \approx 4.1322$**: The system is in a super-critical state, indicating a severe epidemic[cite: 107].
* [cite_start]**Dynamics:** The system exhibits damped oscillations, converging to an endemic equilibrium[cite: 114].
* **Stability:** The phase portrait reveals a **stable spiral sink**. [cite_start]This is confirmed by the eigenvalues $\lambda \approx -0.0173 \pm 0.0389i$, where the negative real part ensures asymptotic stability and the imaginary part explains the spiraling behavior [cite: 91-92, 121].
* [cite_start]**Bifurcation:** The analysis confirms a transcritical bifurcation at $R_0=1$, where the disease-free equilibrium loses stability and an endemic state emerges [cite: 134-135].

## 👤 Author

[cite_start]**Artem Okhten** [cite: 2]
* [cite_start]Department of Mathematics and Systems Engineering [cite: 4]
* [cite_start]Florida Institute of Technology [cite: 4]
* [cite_start]December 2025 [cite: 6]


## 📚 References
[cite_start]This project is based on foundational work in mathematical biology[cite: 146]:
* [cite_start]Kermack & McKendrick (1927)[cite: 148].
* [cite_start]J.D. Murray, *Mathematical Biology*[cite: 151].
* [cite_start]Hethcote, H. W. (2000)[cite: 147].
