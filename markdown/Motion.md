---
title: "Kinematics --- Motion Without Force"
author: "Lecture Notes"
date: "2026"
lang: en
fontsize: 11pt
geometry: margin=2.5cm
colorlinks: true
---

# Introduction

Kinematics is the geometry of motion. It describes *how* objects move ---
position, velocity, acceleration --- without asking *why*. It is the
foundation of all mechanics: every dynamics problem begins with a kinematic
description.

::: {.callout type="note"}
Kinematics contributes 3--4 questions in JEE Main and 2--3 in NEET every year.
Master the vector algebra here and the rest of mechanics follows naturally.
:::

---

# 1. Scalars and Vectors

A **scalar** has magnitude only: speed $v$, distance $d$, time $t$.

A **vector** has magnitude and direction: velocity $\vec{v}$, displacement
$\vec{s}$, acceleration $\vec{a}$.

## Vector Addition

For two vectors $\vec{A}$ and $\vec{B}$ at angle $\theta$:

$$|\vec{R}| = \sqrt{A^2 + B^2 + 2AB\cos\theta}$$

$$\tan\alpha = \frac{B\sin\theta}{A + B\cos\theta}$$

where $\alpha$ is the angle $\vec{R}$ makes with $\vec{A}$.

## Vector Diagram --- Parallelogram Law

```tikz
% Parallelogram law of vector addition
\draw[->, thick] (0,0) -- (3,0) node[midway, below] {$\vec{A}$};
\draw[->, thick] (0,0) -- (1.5,2) node[midway, left] {$\vec{B}$};
\draw[->, thick, blue] (0,0) -- (4.5,2) node[midway, above] {$\vec{R} = \vec{A}+\vec{B}$};
\draw[dashed] (3,0) -- (4.5,2);
\draw[dashed] (1.5,2) -- (4.5,2);
\draw (0.4,0) arc (0:53:0.4) node[right, xshift=2pt] {\small $\theta$};
\draw (0.6,0) arc (0:24:0.6) node[right, xshift=2pt, yshift=-2pt] {\small $\alpha$};
```

::: {.callout type="tip"}
Special cases: $\theta=0^\circ$ gives $R = A+B$ (max); $\theta=180^\circ$ gives $R = |A-B|$ (min);
$\theta=90^\circ$ gives $R = \sqrt{A^2+B^2}$.
:::

---

# 2. Motion in One Dimension

## Definitions

| Quantity | Symbol | Definition | Unit |
|:---|:---|:---|:---|
| Displacement | $\vec{s}$ | Change in position vector | m |
| Velocity | $\vec{v}$ | $d\vec{s}/dt$ | m/s |
| Speed | $v$ | $|d\vec{s}/dt|$ or distance/time | m/s |
| Acceleration | $\vec{a}$ | $d\vec{v}/dt$ | m/s$^2$ |

::: {.callout type="warning"}
**Distance $\neq$ Displacement.** Distance is always positive (scalar path length).
Displacement can be zero even if distance is non-zero --- e.g. a full circle.
:::

## Equations of Motion (constant $\vec{a}$)

$$v = u + at$$

$$s = ut + \tfrac{1}{2}at^2$$

$$v^2 = u^2 + 2as$$

$$s_n = u + \tfrac{a}{2}(2n-1) \quad \text{(distance in }n\text{th second)}$$

where $u$ = initial velocity, $v$ = final velocity, $a$ = acceleration, $s$ = displacement.

---

# 3. Motion Under Gravity

Free fall: $\vec{a} = -g\hat{j}$, $g = 9.8 \approx 10\ \text{m/s}^2$ downward.

$$v = u - gt, \qquad h = ut - \tfrac{1}{2}gt^2, \qquad v^2 = u^2 - 2gh$$

Time to reach max height: $t_{top} = u/g$. Max height: $H = u^2/2g$.

---

# 4. Projectile Motion

A projectile has **horizontal uniform motion** and **vertical free fall** simultaneously.

Launch speed $u$ at angle $\theta$ above horizontal:

$$u_x = u\cos\theta, \qquad u_y = u\sin\theta$$

| Quantity | Formula |
|:---|:---|
| Time of flight | $T = \dfrac{2u\sin\theta}{g}$ |
| Maximum height | $H = \dfrac{u^2\sin^2\theta}{2g}$ |
| Range | $R = \dfrac{u^2\sin 2\theta}{g}$ |
| Max range | $R_{max} = \dfrac{u^2}{g}$ at $\theta = 45^\circ$ |

Trajectory equation (path is a parabola):

$$y = x\tan\theta - \frac{gx^2}{2u^2\cos^2\theta}$$

::: {.callout type="tip"}
Complementary angles give the same range: $\theta$ and $(90^\circ-\theta)$ both give
$R = u^2\sin2\theta/g$. JEE loves this symmetry.
:::

---

# 5. Relative Motion

Velocity of A relative to B: $\vec{v}_{AB} = \vec{v}_A - \vec{v}_B$

::: {.callout type="note"}
Rain-man, river-boat, and aircraft-wind problems all reduce to vector subtraction.
Draw the triangle, apply the parallelogram law.
:::

---

# 6. Angular Kinematics (Vectors Only)

For a particle moving in a circle of radius $r$:

| Quantity | Symbol | Relation |
|:---|:---|:---|
| Angular displacement | $\theta$ | arc/radius |
| Angular velocity | $\vec{\omega}$ | $d\theta/dt$ |
| Angular acceleration | $\vec{\alpha}$ | $d\omega/dt$ |
| Linear $\leftrightarrow$ Angular | | $v = r\omega$,\ $a_t = r\alpha$ |

Centripetal acceleration (directed inward):

$$a_c = \frac{v^2}{r} = r\omega^2$$

Angular momentum of a particle about point O:

$$\vec{L} = \vec{r} \times m\vec{v} = mr^2\vec{\omega}$$

::: {.callout type="warning"}
This is the *particle* angular momentum --- not to be confused with rigid body
rotation, which requires the moment of inertia tensor. Rotation is excluded here.
:::

---

# Key Formula Sheet

$$v = u + at \qquad s = ut + \tfrac{1}{2}at^2 \qquad v^2 = u^2 + 2as$$

$$R = \frac{u^2\sin2\theta}{g} \qquad H = \frac{u^2\sin^2\theta}{2g} \qquad T = \frac{2u\sin\theta}{g}$$

$$\vec{L} = \vec{r} \times m\vec{v} \qquad a_c = \frac{v^2}{r} \qquad v = r\omega$$
