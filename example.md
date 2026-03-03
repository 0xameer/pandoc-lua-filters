---
title: "ops-vm Infrastructure Notes"
author: "Xameer"
date: "2026"
lang: en
fontsize: 11pt
geometry: margin=2.5cm
colorlinks: true
---

# Introduction

This document demonstrates **pandoc** with custom Lua filters compiled to PDF via **LuaLaTeX**.

Inline code: `kubectl get nodes` and a block:

```bash
nix run .#generate-keys
kubectl apply -f k8s/ops-dashboard/
```

# Filters Demonstrated

## Callout Boxes

::: {.callout type="note"}
This is a **note**. Rendered as tcolorbox in LaTeX.
:::

::: {.callout type="warning"}
Check your agenix secrets before rebuilding nodes.
:::

::: {.callout type="tip"}
Run `nix fmt` before committing to auto-format all `.nix` files.
:::

## Typographer

Converts -- to en-dash, --- to em-dash, ... to ellipsis.

## Tables

| Service        | Node  | Port |
|:---------------|:------|-----:|
| kube-apiserver | node1 | 6443 |
| minio          | node1 | 9005 |
| prometheus     | node1 | 9090 |
| grafana        | node1 | 3000 |
| node-exporter  | both  | 9100 |

## Math

Inline: $E = mc^2$ and display:

$$
\int_0^\infty e^{-x^2} dx = \frac{\sqrt{\pi}}{2}
$$

# Conclusion

All filters are composable --- chain them with multiple `--lua-filter` flags.
