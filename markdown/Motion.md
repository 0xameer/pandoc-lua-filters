---
title: "Kinematics --- Motion, Vectors and Limits"
author: "Lecture Notes"
date: "2026"
lang: en
fontsize: 11pt
geometry: margin=2.5cm
colorlinks: true
---

# Introduction

Kinematics is the geometry of motion --- it describes *how* objects move without
asking *why*. The language is calculus: velocity is the derivative of position,
acceleration is the derivative of velocity. Algebra gives you the results;
calculus tells you why they are true.

::: {.callout type="note"}
Reference: Halliday, Resnick & Krane, *Physics* Vol. 1, Chapters 2--4.
All formulas here follow from two definitions: $\vec{v} = d\vec{r}/dt$ and
$\vec{a} = d\vec{v}/dt$.
:::

---

# 1. Frame of Reference

All motion is measured relative to a chosen **inertial frame** --- a coordinate
system at rest or moving at constant velocity. The same event has different
descriptions in different frames; the laws of motion hold in all inertial frames.

::: {.callout type="warning"}
There is no absolute rest. When you say a ball moves at 10 m/s, you mean
relative to Earth. A passenger on a train sees a different velocity. Fix your
frame before writing any equation.
:::

---

# 2. Scalars and Vectors

A **scalar** has magnitude only: speed $v$, distance $d$, time $t$.

A **vector** has magnitude and direction: position $\vec{r}$, velocity
$\vec{v}$, acceleration $\vec{a}$.

## Vector Addition --- Parallelogram Law

For $\vec{A}$ and $\vec{B}$ at angle $\theta$:

$$|\vec{R}| = \sqrt{A^2 + B^2 + 2AB\cos\theta}
\qquad
\tan\alpha = \frac{B\sin\theta}{A + B\cos\theta}$$

```tikz
\draw[->, thick] (0,0) -- (3,0) node[midway, below] {$\vec{A}$};
\draw[->, thick] (0,0) -- (1.5,2) node[midway, left] {$\vec{B}$};
\draw[->, thick, blue] (0,0) -- (4.5,2)
  node[midway, above] {$\vec{R}=\vec{A}+\vec{B}$};
\draw[dashed] (3,0) -- (4.5,2);
\draw[dashed] (1.5,2) -- (4.5,2);
\draw (0.5,0) arc (0:53:0.5) node[right, xshift=2pt] {\small $\theta$};
\draw (0.7,0) arc (0:24:0.7) node[right, xshift=2pt] {\small $\alpha$};
```

::: {.callout type="tip"}
Special cases: $\theta=0^\circ \Rightarrow R=A+B$; $\theta=180^\circ \Rightarrow R=|A-B|$;
$\theta=90^\circ \Rightarrow R=\sqrt{A^2+B^2}$.
:::

---

# 3. Equations of Motion (Constant Acceleration)

Starting from $\vec{a} = d\vec{v}/dt = \text{const}$, integrating once gives
$\vec{v}$, integrating again gives $\vec{r}$:

$$\frac{dv}{dt} = a
\xrightarrow{\int_0^t dt}
v = u + at$$

*Velocity changes linearly with time; the slope is acceleration.*

$$v = \frac{ds}{dt} = u + at
\xrightarrow{\int_0^t dt}
s = ut + \frac{1}{2}at^2$$

*Displacement is the area under the $v$--$t$ graph --- a trapezoid, hence the
$\tfrac{1}{2}$ factor.*

$$v^2 = u^2 + 2as$$

*Eliminate $t$: energy-like relation between velocity and displacement.*

$$s_n = u + \frac{a}{2}(2n-1)$$

*Distance in the $n$th second: the difference $s(n) - s(n-1)$, which is an
arithmetic progression with common difference $a$.*

---

# 4. Motion Under Gravity

Free fall is constant acceleration with $\vec{a} = -g\hat{j}$,
$g \approx 9.8\ \text{m/s}^2$:

$$\frac{d^2y}{dt^2} = -g
\xRightarrow{\text{integrate twice}}
y = ut - \frac{1}{2}gt^2$$

*The minus sign is the frame choice: upward positive.*

---

# 5. Projectile Motion

Decompose into independent axes. Horizontal: $a_x = 0$. Vertical: $a_y = -g$.

$$u_x = u\cos\theta, \qquad u_y = u\sin\theta$$

| Quantity | Formula | Calculus origin |
|:---|:---|:---|
| Time of flight | $T = 2u\sin\theta/g$ | $y(T)=0$, solve quadratic in $t$ |
| Max height | $H = u^2\sin^2\theta/(2g)$ | $dy/dt=0$ at apex |
| Range | $R = u^2\sin 2\theta/g$ | $x(T)$, use double-angle identity |

Trajectory (eliminate $t$ from $x = u_x t$, $y = u_y t - \tfrac{1}{2}gt^2$):

$$y = x\tan\theta - \frac{gx^2}{2u^2\cos^2\theta}$$

*This is a downward parabola: $y = Ax + Bx^2$ with $B < 0$.*

::: {.callout type="tip"}
$R$ is maximum at $\theta = 45^\circ$ since $\sin 2\theta$ peaks there.
Complementary angles $\theta$ and $90^\circ - \theta$ give equal range.
:::

---

# 6. Solved Problem --- Angular Momentum of a Projectile

**Problem.** A ball is launched from origin $P$ with speed $u$ at angle
$\alpha$. At time $t$, the position vector $\vec{r}$ from $P$ makes angle
$\theta$ with the horizontal. Find the angular momentum $\vec{L}$ about $P$.

**Solution.**

Position and velocity at time $t$:

$$\vec{r} = (u\cos\alpha)\,t\,\hat{i}
  + \!\left[(u\sin\alpha)\,t - \tfrac{1}{2}gt^2\right]\hat{j}$$

$$\vec{v} = (u\cos\alpha)\,\hat{i} + (u\sin\alpha - gt)\,\hat{j}$$

Angular momentum $\vec{L} = m(\vec{r}\times\vec{v})$. Only the $\hat{k}$
component survives in 2D:

$$\vec{r}\times\vec{v}
= \bigl(x\,v_y - y\,v_x\bigr)\hat{k}$$

Expanding:

$$x\,v_y - y\,v_x
= (u\cos\alpha)\,t\,(u\sin\alpha - gt)
  - \!\left[(u\sin\alpha)\,t - \tfrac{1}{2}gt^2\right](u\cos\alpha)$$

$$= (u\cos\alpha)\Bigl[t(u\sin\alpha - gt) - t\,u\sin\alpha
  + \tfrac{1}{2}gt^2\Bigr]$$

$$= (u\cos\alpha)\Bigl[-gt^2 + \tfrac{1}{2}gt^2\Bigr]
= -\tfrac{1}{2}g\,t^2\,u\cos\alpha$$

Since $\vec{r}$ makes angle $\theta$ with horizontal,
$x = |\vec{r}|\cos\theta$ and $u\cos\alpha = x/t = |\vec{r}|\cos\theta/t$:

$$\boxed{|\vec{L}| = \tfrac{1}{2}\,m\,g\,t\,|\vec{r}|\cos\theta}$$

directed into the page. The angular momentum grows linearly with $t$ because
gravity exerts a constant torque $\tau = mgx = mg|\vec{r}|\cos\theta$ about $P$,
and $d\vec{L}/dt = \vec{\tau}$.

---

# 7. The Fly and the Train --- Zeno Resolved by Calculus

**Setup.** Initial gap $D$. Fly moves at $v = V/2$ toward train; train moves
at $V$ toward fly. Closing speed $= v + V = 3V/2$.

**Zeno's series approach** (dichotomy: halve the gap at each step):

$$t_{total}
= \sum_{n=1}^{\infty} \frac{D/2^n}{v+V}
= \frac{D}{v+V}\sum_{n=1}^{\infty} \frac{1}{2^n}
= \frac{D}{v+V}\cdot 1
= \frac{D}{3V/2} = \frac{2D}{3V}$$

The sum $\sum 1/2^n = 1$ (geometric series, ratio $r = 1/2 < 1$). The series
converges to a **finite** time. The fly hits the train at $t^* = 2D/(3V)$.

**Calculus approach** (the definitive one):

Let $x(t)$ be the gap. It closes at constant rate:

$$\frac{dx}{dt} = -(v + V) = -\frac{3V}{2}, \qquad x(0) = D$$

$$x(t) = D - \frac{3V}{2}\,t$$

Set $x(t^*) = 0$:

$$t^* = \frac{2D}{3V}$$

::: {.callout type="note"}
Zeno's infinite subdivision describes the same process in infinitely many
steps. The geometric series sums to a finite limit because the steps shrink
faster than they accumulate. Calculus bypasses the infinite steps entirely by
treating the rate of change as a continuous quantity --- $dx/dt$ is defined
precisely by the limit $\lim_{\Delta t \to 0} \Delta x / \Delta t$. Both
approaches agree: the fly hits the train. The event is absolute; only the
method of counting steps is relative.
:::

---

# Key Formulae

$$v = u + at \qquad
s = ut + \tfrac{1}{2}at^2 \qquad
v^2 = u^2 + 2as$$

$$R = \frac{u^2\sin 2\theta}{g} \qquad
H = \frac{u^2\sin^2\theta}{2g} \qquad
T = \frac{2u\sin\theta}{g}$$

$$|\vec{L}| = \tfrac{1}{2}mgt|\vec{r}|\cos\theta \qquad
\frac{d\vec{L}}{dt} = \vec{\tau} \qquad
a_c = \frac{v^2}{r} = r\omega^2$$
