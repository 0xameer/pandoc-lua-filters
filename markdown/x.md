---
title: "Resume"
author: "Sameer Gupta"
date: "2026"
lang: en
fontsize: 10pt
geometry: margin=1.8cm
colorlinks: true
---


::: {.contact-footer}
> <xameer@zohomail.in> - +91 799 311 0170 - Ananthapur, India -
:::

## Summary



> Infrastructure architect and platform engineer with 15+ years across distributed systems,
> Kubernetes operations, and service design. Specialises in IaC (Terraform,NixOS), declarative
> systems, and cost-efficient self-hosted platforms. Rust and Haskell for data pipelines,
> typed DSLs, and runtime program analysis. Track record of reducing CI and compute costs
> via binary caching and reproducible builds.

Available for remote senior/staff roles in infrastructure, ML platform, or API/service architecture.


I commit to [Git Forges] and write on my [Blog] and [MicroBlog].

## Core Competencies



- **Infrastructure & SRE**

  Kubernetes (bare-metal, CRI-O, etcd, secretbox), Terraform, Pulumi, NixOS/NixPkgs,
  GitLab CI/CD, GitOps, zero-trust networking (Tailscale, Cloudflare Tunnel).

- **Observability & Reliability**

  Grafana, Monit, stack trace analysis, root-cause debugging, incident response.

- **Storage & Data**

  MinIO, Longhorn, OpenEBS, Restic, Turso/libSQL, etcd, AWS S3/CSI.

- **Programming Languages**

  Haskell, Rust, Python, Lua, Bash, Emacs Lisp, WASM.
  Typed DSLs, AST design, compiler/interpreter construction.

- **API & Service Design**

  REST/CRUD, webhooks, serverless (Cloudflare Workers), Podman, Docker.

- **Binary Caching & CI**

  Cachix, Attic (Cloudflare-backed), FastCDC -- ~80% CI time reduction.



---

## Selected Projects

::: {.callout type="note"}
    Trace-Align -- Runtime Execution Diff (2025--26)

-    Haskell CLI verifying jobpipe refactors by aligning JSON runtime traces from two function versions and diffing
     diverging intermediate states (inspired byPLDI 2023 proof repair alignment). Uses a Template Haskell splice (make
     Traced)to auto-instrument pure functions in Writer [TraceEvent] without IO. Integrated into GitLab CI to block logic regressions during algorithmic refactors.

    Rust Microservices on NixOS Kubernetes (2024--25)

  -  Two-node QEMU VM cluster (K8s 1.35, CRI-O, etcd, Calico, ArgoCD). Live recoveryfrom etcd secretbox key corruption (zero data loss); Calico/Tailscale netfilterconflicts resolved via nft monitor trace to a missing cali* forward rule.Deployed proxy-svc (Rust/axum typestate validation proxy: Raw -> Shaped -> RatePassed -> Clean -> Forwarded), comment-api (IndieAuth, Turso/libSQL),and ops-dashboard (GitLab webhook receiver triggering kubectl rollout restart)via reproducible Nix OCI builds.

 -   Cardano DSL / Smart Contract System (2023--24)

    Designed and wrote the winning proposal for an EDSL targeting Plutus smart contract development.
    GADTs and phantom types enforced resource constraints at compile time; denotational interpreter
    mapped  DSL to Plutus Core via rewrite rules. Batched state transitions reduced sidechain execution
    costs.

:::

## Open Source

-    trace-align: Haskell CLI for runtime execution trace diffing.

 -   [jobpipe]: candidate-side job-ranking CLI. Typed ontology DSL projectingsymbolic concepts into vector space; logistic regression oversentence-transformer embeddings re-ranks by your labelling history.Async Rust crawler (Tokio), MLflow experiment tracking.

-    A CLI [tool] to query the SourceHut GraphQL API.


- A [serverless API] for a virtual Tailscale microservice via Tailscale Funnel.

---

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



### 2015--16 · Data Science Lead -- Examify, Mumbai

NLP pattern recognition and ML with CUDA. Reported to CTO and CEO.

### 2010--12 · Faculty, Physics

 Preparatory physics for IIT-JEE at incorporated commercial institutes.

---

## Education

**2006--2011**
:   **B.Tech, M.E.M.S.** -- Indian Institute of Technology Bombay.
    Applied Physics, Mathematics, CS-101. Winter intern at I.I.M. Bangalore
    (traffic policy research and analysis).

::: {.callout type="tip"}
Dorm startup *JeeCarnot*: statistical analysis of competitive exam outcomes.
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
