---
title: "Sameer Gupta"
author: "Sameer Gupta"
date: "2026"
lang: en
fontsize: 11pt
geometry: margin=2.5cm
colorlinks: true
---

# Sameer Gupta

::: {.contact-footer}
> <xameer@zohomail.in> • +91 799 311 0170 • Ananthapur, India •
> [gitlab.com/xameer](https://gitlab.com/xameer) •
> [xameer.gitlab.io](https://xameer.gitlab.io)
:::

## Summary

::: {.callout type="note"}
> Infrastructure architect and ML pipeline engineer with 15+ years across distributed
> systems, Kubernetes operations, and service design. Specialises in IaC (Terraform,
> NixOS), declarative systems, and cost-efficient self-hosted platforms. Experienced
> in end-to-end ML pipelines: feature extraction, weak supervision, embedding-based
> ranking, and experiment tracking (MLflow). Track record of reducing CI and compute
> costs through binary caching and reproducible builds.

Available for remote senior/staff roles in infrastructure, ML platform, or API/service architecture.
:::

I commit to [Git Forges] and write on my [Blog] and [MicroBlog].

## Core Competencies

::: {.callout type="warning"}

- **Infrastructure & SRE**

  Kubernetes (bare-metal, CRI-O, etcd, secretbox), Terraform, Pulumi, NixOS/NixPkgs,
  GitLab CI/CD, GitOps, declarative VM provisioning, zero-trust networking
  (Tailscale, Cloudflare Tunnel).

- **Observability & Reliability**

  Kubernetes dashboards (Grafana, Monit), stack trace analysis, root-cause debugging,
  CI optimisation, incident debugging on self-hosted infrastructure.

- **Storage & Data**

  MinIO (S3-compatible), Longhorn (Kubernetes PVC), OpenEBS, Restic, Turso/libSQL,
  etcd, AWS S3/CSI.

- **Programming Languages**

  Haskell, Rust, Python, Lua, Bash, Emacs Lisp, WASM.
  Typed DSLs, AST design, compiler/interpreter construction.

- **API & Service Design**

  REST/CRUD webhooks, serverless (Cloudflare Workers), Podman, Docker.

- **Binary Caching & CI Optimisation**

  Cachix, Attic (R2-backed), FastCDC -- ~80% CI time reduction.

:::

\newpage

## Selected Projects

::: {.callout type="note"}

- **NixOS Kubernetes Cluster (2025--26)**

  Production-grade *n*-node QEMU VM [cluster] on NixOS with fully reproducible
  declarative cluster state. Administered Kubernetes (bare-metal, CRI-O, etcd).
  CI-triggered rolling deployments via GitLab webhooks; services exposed over
  Cloudflare Tunnel with zero-trust access.

- **Self-Hosted Platform & CI Optimisation (2026)**

  Eliminated external CI runner and CDN egress costs. Binary caching layer
  (Cachix, Attic) achieved ~80% CI time reduction. Toolchain: Rust + Haskell.

- **Cardano DSL / Smart Contract System (2023--24)**

  Designed and wrote the [winning proposal] for an EDSL targeting Plutus smart
  contract development on open-source hardware. Funded via Ideascale community
  vote; partnered with D.A.O. Konma (Chennai).

:::

## Experience

### 2024--25 · Freelance Trainer -- Data & Cloud Infrastructure · Hyderabad

Trained engineers in Kubernetes, Terraform IaC, and cloud-native architectures.
Covered data lake design (Medallion, Data Vault), GitOps, and disposable
environment design.

### 2023--24 · Senior Haskell Developer -- Haskledger

Typed AST in Haskell for smart-contract constructs; denotational interpreter
mapping DSL to Plutus Core via rewrite rules. GADTs and phantom types enforced
resource constraints at compile time. Optimisation pipeline for batched state
transitions reduced sidechain execution costs.

### 2019--23 · Freelance Network & Systems Engineer

Prototyped interconnection services for crypto mining data centres. Developed
Linux services with Podman; deployed over Tailscale tunnels on cloud and
serverless environments. Root-cause analysis and incident response on networked
infrastructure.

### 2016--19 · Freelance Web Developer

Frontend features and backend integrations for seed-funded startups. Web
administration, deployment, and application firewalls.

\newpage

### 2015--16 · Data Science Lead -- Examify, Mumbai

NLP pattern recognition and ML with CUDA. Reported to CTO and CEO.

### 2010--12 · Faculty, Physics

Preparatory physics for IIT-JEE at incorporated commercial institutes.

## Education

**2006--2011**
:   **B.Tech, M.E.M.S.** -- Indian Institute of Technology Bombay.
    Applied Physics, Mathematics, CS-101. Winter intern at I.I.M. Bangalore
    (traffic policy research and analysis).

::: {.callout type="tip"}
Dorm startup *JeeCarnot*: statistical analysis of competitive exam outcomes.
:::

## Open Source

::: {.callout type="tip"}

- A [serverless API] for a virtual Tailscale microservice via Tailscale Funnel.

- A hybrid ML [jobpipe]: async Rust crawler (Tokio, semaphore-bounded concurrency),
  typed AST predicate DSL, NLP concept extraction over a synonym ontology, and a
  logistic regression model over sentence-transformer embeddings. SQLite persists
  ground-truth labels; each label shifts the decision boundary on retrain.
  Experiment tracking via MLflow.

- A [CLI] tool to query the SourceHut GraphQL API.

:::

## Communication

Primary: Hindi · Secondary: English (professional)

[winning proposal]: https://www.catalystexplorer.com/en/proposals/haskledger-an-edsl-for-scalable-cardano-sidechains-f11/details
[cluster]: https://gitlab.com/xameer/nixos-gitlab-kube-ci/
[serverless API]: https://gitlab.com/xameer/rs-comment-api
[jobpipe]: https://gitlab.com/xameer/jobpipe
[Blog]: https://xameer.gitlab.io
[MicroBlog]: https://mathstodon.xyz/@xameer
[Git Forges]: https://gitlab.com/xameer
[CLI]: https://git.sr.ht/~carnotweat/srht
