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
:::

## Summary

::: {.callout type="note"}
> Infrastructure architect and ML pipeline engineer with 15+ years of applied experience across distributed systems,
Kubernetes operations, cloud infrastructure,
> and service API design. Specialises in infrastructure as code (Terraform, Nix/NixOS), declarative systems, and
cost-efficient self-hosted platforms.
> Experienced in end-to-end ML pipeline architecture: feature extraction, weak supervision, embedding-based ranking, and
experiment tracking with MLflow.
> Track record of reducing CI and cloud compute costs through binary caching, reproducible builds, and system-level
design.

Available for remote senior and staff roles in infrastructure, ML platform, and API/service architecture.
:::

I commit to [Git Forges] and write on my [Blog] and [MicroBlog].

## Core Competencies

::: {.callout type="warning"}

- **Infrastructure & SRE**

  Kubernetes (bare-metal, CRI-O, etcd, secretbox), Terraform, Pulumi, NixOS/NixPkgs,
  GitLab CI/CD, GitOps, declarative VM provisioning, system service design,
  zero-trust networking (Tailscale, Cloudflare Tunnel).

- **Observability & Reliability**

  Kubernetes dashboards (Grafana, Monit), stack trace analysis and root-cause
  debugging, CI optimisation, incident debugging on self-hosted infrastructure.

- **Storage & Data**

  MinIO (S3-compatible), Longhorn (Kubernetes PVC), OpenEBS, Restic (offsite backup),
  Turso/libSQL (SQLite), etcd, AWS S3/CSI.

- **Programming Languages**

  Haskell, Rust, Python, Lua, Bash, Emacs Lisp, WebAssembly (WASM).
  Typed DSLs, AST design, compiler/interpreter construction.

- **API & Service Design**

  Protocol implementation, REST/CRUD webhooks, serverless (Cloudflare Workers),
  container-native services (Podman, Docker).

- **Binary Caching & CI Optimisation**

  Cachix, Attic (R2-backed), FastCDC chunk tuning — ~80% CI time reduction
  through cache layer design.

:::

---

## Selected Projects

::: {.callout type="note"}

- **NixOS Kubernetes Cluster (2025--26)**

  Production-grade *n*-node QEMU VM [cluster] on NixOS with fully reproducible,
  declarative cluster state. Administered Kubernetes (bare-metal, CRI-O, etcd).
  Implemented CI-triggered rolling deployments via GitLab webhook receivers.
  Exposed services securely over Cloudflare Tunnel. Focus: reliability,
  automation, and zero-trust access.

- **Self-Hosted Platform & CI Optimisation (2026)**

  Eliminated external CI runner and CDN egress costs. Designed binary caching
  layer (Cachix, Attic) achieving ~80% CI time reduction. Toolchain: Rust +
  Haskell, self-hosted with reduced network costs.

- **Cardano DSL / Smart Contract System (2023--24)**

  Designed and wrote the [winning proposal] for an EDSL targeting Plutus smart
  contract development on open-source hardware, addressing scalability and hardware
  compatibility constraints for Cardano sidechain deployment. Funded via community
  vote on Ideascale; partnered with D.A.O. Konma (Chennai) for pitch.

:::

---

## Experience

### 2024--25 · Freelance Trainer — Data & Cloud Infrastructure · Hyderabad

Trained engineers in Kubernetes, Terraform IaC, and cloud-native architectures.
Covered data lake design (Medallion, Data Vault), Kubernetes resource management,
GitOps, disposable environment design, and hybrid cost/latency models.

### 2023--24 · Senior Haskell Developer — Haskledger

Developed a typed AST in Haskell capturing smart-contract constructs with a
denotational interpreter mapping DSL expressions to Plutus Core via operational
rewrite rules. Used GADTs and phantom types to enforce resource constraints at
compile time. Designed an optimisation pipeline for batched state transitions and
compact validator scripts, reducing sidechain execution costs before evaluation.

### 2019--23 · Freelance Network & Systems Engineer

Prototyped interconnection services for crypto mining data centres. Full cycle:
value proposition, feasibility, simulation, prototype, pitch. Developed Linux
services with Podman; deployed on cloud and serverless environments over Tailscale
tunnels. Root-cause analysis and incident response on networked infrastructure.

### 2016--19 · Freelance Web Developer

Frontend features and UI fixes for seed-funded startups. Web administration,
development, and application firewalls.

---

### 2015--16 · Data Science Lead — Examify, Mumbai

NLP pattern recognition and ML with CUDA. Reported to CTO and CEO.

### 2010--12 · Faculty, Physics

Preparatory physics for IIT-JEE at incorporated commercial institutes.

---

## Education

**2006--2011**
:   **B.Tech, M.E.M.S.** — Indian Institute of Technology Bombay.
    Applied Physics, Mathematics, CS-101. Winter intern at I.I.M. Bangalore
    (traffic policy research and analysis).

::: {.callout type="tip"}
Dorm startup *JeeCarnot*: statistical analysis of competitive exam outcomes.
:::

---

## Open Source

::: {.callout type="tip"}

- A [serverless API] for a virtual Tailscale microservice, exposed via Tailscale Funnel.

- A hybrid ML ranking CLI [jobpipe], with  async Rust crawler with bounded concurrency), with a typed AST predicate DSL,
NLP concept extraction over a synonym ontology.
And a logistic regression model over sentence-transformer embeddings trained on SQLite-persisted weak labels, SQL stores
the ground truth; a script shifts the decision boundary with every label added.

- A [CLI] tool to query the SourceHut GraphQL API.

:::

---

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
