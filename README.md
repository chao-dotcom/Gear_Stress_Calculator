# 🧮 Gear Contact Stress Calculator

![Gear Stress Calculator Interface](screenshot.png)

A MATLAB-based calculator for evaluating **gear contact (Hertzian) stress** and **allowable contact stress** according to ISO/AGMA-style formulas.

---

## 📘 Table of Contents

1. [Overview](#overview)
2. [Input Parameters](#input-parameters)
3. [Core Formulas](#core-formulas)
   * [Geometry](#geometry)
   * [Load Calculations](#load-calculations)
   * [Contact Stress](#contact-stress)
   * [Allowable Contact Stress](#allowable-contact-stress)
4. [Output Parameters](#output-parameters)
5. [Assumptions](#assumptions)
6. [Usage](#usage)
7. [References](#references)

---

## 🔹 Overview

This tool computes:

* **Calculated contact stress (σH)** — the actual Hertzian stress under load.
* **Allowable contact stress (σH,allow)** — the permissible stress based on material and operating conditions.

It supports **spur and helical gears**, and adjusts for application, dynamic, and alignment factors.

---

## ⚙️ Input Parameters

| Symbol             | Description                             | Unit |
| ------------------ | --------------------------------------- | ---- |
| ( m_n )            | Normal module                           | mm   |
| ( z_1, z_2 )       | Number of teeth (pinion / gear)         | —    |
| ( b )              | Face width                              | mm   |
| ( P )              | Power                                   | kW   |
| ( n )              | Rotational speed                        | rpm  |
| ( \beta )          | Helix angle                             | °    |
| ( \alpha_t )       | Transverse pressure angle (usually 20°) | °    |
| ( x_1, x_2 )       | Profile shift coefficients              | —    |
| ( H_{\text{lim}} ) | Material contact stress limit           | MPa  |
| ( N )              | Stress cycle count                      | —    |

---

## 🧩 Core Formulas

### 1️⃣ Geometry

\[
u = \frac{z_2}{z_1}
\]

\[
d_1 = m_n \cdot z_1, \quad d_2 = m_n \cdot z_2
\]

\[
v = \frac{\pi \cdot d_1 \cdot n}{60 \times 1000}
\]

---

### 2️⃣ Load Calculations

#### (a) Tangential Force

\[
F_t = \frac{60000000 \cdot P_{\text{kW}}}{\pi \cdot n \cdot d_1}
\]

* ( P_{\text{kW}} ): power in kW
* ( d_1 ): pitch diameter in mm

#### (b) Equivalent Load Factor

\[
K = K_A \cdot K_V \cdot K_{H\alpha} \cdot K_{H\beta}
\]

Where:

* ( K_A ): Application factor
* ( K_V ): Dynamic factor
* ( K_{H\alpha} ): Transverse load distribution factor
* ( K_{H\beta} ): Face load distribution factor

---

### 3️⃣ Contact Stress

\[
\sigma_H = Z_E \cdot Z_H \cdot Z_\varepsilon \cdot Z_\beta \cdot \sqrt{ \frac{F_t \cdot K_A \cdot K_V \cdot K_{H\alpha} \cdot K_{H\beta} \cdot (u + 1)/u}{b \cdot d_1} }
\]

For **internal gearing** replace ((u+1)/u) with ((u-1)/u)).

**Where:**

| Symbol            | Meaning              | Typical value / formula                                                                    |
| ----------------- | -------------------- | ------------------------------------------------------------------------------------------ |
| ( Z_E )           | Elastic coefficient  | ( \sqrt{ \dfrac{1}{\pi \left( \dfrac{1-\nu_1^2}{E_1} + \dfrac{1-\nu_2^2}{E_2} \right) }} ) |
| ( Z_H )           | Zone factor          | ( \sqrt{ \dfrac{2 \cos \beta}{\sin \alpha_t} \cdot \dfrac{u}{u+1} } )                      |
| ( Z_\varepsilon ) | Contact ratio factor | ( 0.25 + 0.75 \dfrac{\varepsilon_\alpha}{\varepsilon_\alpha + \varepsilon_\beta} )         |
| ( Z_\beta )       | Helix angle factor   | ( \sqrt{\cos \beta} ) (≈1 for spur gears)                                                  |

#### (a) Contact ratios

\[
\varepsilon_\alpha = \frac{a_w \cos \alpha_t}{\pi m_n} (\tan \alpha_a - \tan \alpha_t)
\]

\[
\varepsilon_\beta = \frac{b \sin \beta}{\pi m_n}
\]

---

### 4️⃣ Allowable Contact Stress

\[
\sigma_{H,\text{allow}} = H_{\text{lim}} \cdot Z_{NT} \cdot Z_{LVR} \cdot Z_W \cdot Z_X \cdot Z_R / S_F
\]

Where:

| Symbol             | Meaning                     | Typical Value                      |
| ------------------ | --------------------------- | ---------------------------------- |
| ( H_{\text{lim}} ) | Material limit stress       | 580 MPa (40Cr), 500 MPa (45 steel) |
| ( Z_{NT} )         | Life factor                 | 1 (for ( N = 4\times10^9 ))        |
| ( Z_{LVR} )        | Lubrication/velocity factor | 1                                  |
| ( Z_W )            | Work condition factor       | 1                                  |
| ( Z_X )            | Size factor                 | 1                                  |
| ( Z_R )            | Reliability factor          | 0.8                                |
| ( S_F )            | Safety factor               | 1.0                                |

For a gear pair:
\[
HP_1 = H_{\text{lim1}} \times Z_{NT} \times Z_{LVR} \times Z_W \times Z_X \times Z_R / S_F
\]
\[
HP_2 = H_{\text{lim2}} \times Z_{NT} \times Z_{LVR} \times Z_W \times Z_X \times Z_R / S_F
\]
\[
HP = \min(HP_1, HP_2)
\]

---

## 📊 Output Parameters

| Symbol                                | Description               | Unit |
| ------------------------------------- | ------------------------- | ---- |
| ( \sigma_H )                          | Calculated contact stress | MPa  |
| ( \sigma_{H,\text{allow}} )           | Allowable contact stress  | MPa  |
| ( F_t )                               | Tangential load           | N    |
| ( v )                                 | Pitch-line velocity       | m/s  |
| ( K_A, K_V, K_{H\alpha}, K_{H\beta} ) | Load factors              | —    |

---

## 📌 Assumptions

* Pressure angle ( \alpha_t = 20° )
* Poisson's ratio ( \nu = 0.3 )
* Modulus of elasticity ( E = 2.06 \times 10^5 , \text{MPa} )
* Units: mm, MPa, rpm, kW, N
* External spur gear by default; internal or helical supported

---

## 💻 Usage

1. Open MATLAB and navigate to the project directory
2. Run the calculator by calling:
   ```matlab
   chineseMachineryPanel()
   ```
3. Fill in the input parameters in the left panel:
   - Module (m)
   - Number of teeth (z1, z2)
   - Face width (b)
   - Power (kW)
   - Speed (rpm)
   - Other geometric and operating parameters

4. Configure working conditions in the middle panel:
   - Select prime mover and working machine types
   - Choose meshing type (internal/external)
   - Select gear type (straight/helical)
   - Set layout and support conditions

5. Select materials in the right panel:
   - Choose materials for pinion and gear
   - Configure heat treatment options
   - Set reliability requirements

6. Click the calculation buttons:
   - **计算接触应力** (Calculate Contact Stress) - Computes actual contact stress
   - **计算许用接触应力** (Calculate Allowable Contact Stress) - Computes allowable stress

### Requirements

- MATLAB R2016b or later (for App Designer/uifigure support)
- No additional toolboxes required

---

## 📚 References

* ISO 6336-2:2019 — *Calculation of load capacity of spur and helical gears — Part 2: Calculation of surface durability (pitting)*
* AGMA 2101-D04 — *Fundamental Rating Factors and Calculation Methods for Involute Spur and Helical Gear Teeth*
* 《机械设计手册》, 第四版, 机械工业出版社

---
