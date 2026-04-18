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
> ` <xameer@zohomail.in>   +91 799 311 0170  Ananthapur, India. `
:::

## Summary

::: {.callout type="note"}
> Infrastructure architect and functional programmer with 15 years of applied experience across systems design, data engineering, and API development.
> I specialise in reproducible infrastructure as code, service design, DSL and language inter-ops, binary cache optimisation, and zero-trust networking.
> Track record of reducing cloud compute and hosting costs through self-hosted, declarative infrastructure.
Available for remote senior and staff engineering roles.
:::

I commit to [Git Forges] and write on my [Blog] and [MicroBlog].

## Core Competencies

::: {.callout type="warning"}

- **Infrastructure as Code**

  Terraform/Pulumi, GitLab CI/CD, declarative VM provisioning, system service design.

- **Programming Languages & Semantics**

    NixPkgs, Haskell, Rust, Lua, Bash, Python, Wasm, Emacs Lisp.

- **Distributed Systems**

    Kubernetes (bare-metal, CRI-O, etcd, secretbox), Apps and services for  zero-trust
    network meshes, Cloudflare Workers.

- **Binary Caching and CI Optimisation**

  Cachix, Attic (R2-backed), FastCDC chunk tuning,
  ~ 80% CI time reduction through cache layer design.

- **Storage and Data**

    MinIO (S3-compatible), Restic (offsite backup), Longhorn
    (K8S PVC), Turso/libSQL (SQLite), etcd, OpenEBS, AWS CSI.

- **API and Service Design**

    Protocol implementation, CRUD and REST web-hooks.

:::

---

## Selected Projects

::: {.callout type="note"}

-  **Self-Hosted Blog Infrastructure (2026)**:

    For a small-scale DevOps, with Rust and Haskell tool-chain, but without the cloud or CI runner
    compute cost or CDN egress fees and reduced network costs.

-  **NixOS Kubernetes Cluster (2025--26)**:

    A production-grade n-node QEMU VM [cluster], with a reproducible cluster state

    For Apps, I used GitLab webhook receivers triggering Kubernetes rolling restarts on
    successful pipeline events, Which are exposed via Cloudflare Tunnel.

-   **Cardano Proposal (2023--24)**:

   Designed and wrote the winning proposal
   for an EDSL targeting Plutus smart contract development on open-source hardware
   addressing scalability bottlenecks and hardware compatibility constraints that,
   limited Cardano sidechain deployment. Funded via community vote on Ideascale;
   partnered with D.A.O. Konma (Chennai) for pitch.

:::

## Experience

### 2024--25

-  **Freelance Trainer, Data and Cloud Infrastructure** -- Hyderabad

    Trained engineers in data lake architecture: Medallion and Data Vault patterns, cloud-native Kubernetes, and hybrid cost,latency models. Covered Terraform IaC, Kubernetes resource management, GitOps, and disposable environment design.

### 2023--24

-  **Senior Haskell Developer** -- Haskledger

    Developed a typed AST in Haskell, capturing smart-contract constructs, their low-level constraints, with a
    denotational interpreter mapping DSL expressions to Plutus
    Core via operational rewrite rules. Used GADTs and phantom types to make
    resource-exceeding contracts are not represented at compile time, and a deep
    embedding layer for optimisation passes batched state transitions and compact
    validator scripts, that reduce sidechain execution costs before evaluation.

### 2019--23

-  **Freelance Network Programmer**

    Prototyped interconnection services for crypto mining data centres. Full cycle:
    value proposition, feasibility, simulation, prototype, pitch.
    I developed Linux services with Podman, cloud, and serverless on tunnels.

### 2016--19

-  **Freelance Web Developer**

    Frontend features and UI fixes for seed-funded startups. Web administration, development,
    and App firewalls.

---

### 2015--16

-  **Data Science Lead** -- Examify, Mumbai

    NLP pattern recognition, ML with CUDA. Reported to CTO and CEO.

### 2010--12

-  **Faculty, Physics** -- Misc.

    Preparatory physics for IIT-JEE at incorporated commercial institutes.


## Education

**2006--2010**
:  **B.Tech, M.E.M.S.** -- Indian Institute of Technology Bombay.
    I was enrolled on the 4-year course.
    Applied Physics, Mathematics, CS-101. Winter intern at I.I.M. Bangalore (traffic
policy research and analysis).

::: {.callout type="tip"}
Dorm startup *JeeCarnot*: statistical analysis of competitive exam outcomes.
:::

## Open Source

::: {.callout type="tip"}

-  A [serverless API] for a virtual Tailscale microservice, deployed on the [cluster] and natively as a systemd service to post comments on my blog, and
 comment data stored with Turso libsql Connector.
 So that anyone  with a valid GPG key or OpenID can comment on my blog post, even from the machines that are
 not my Tailscale peer.

 -  A fast [CLI tool] to crawl RSS/Atom job feeds from an OPML file, deduplicate entries, and output recent jobs in
   multiple formats.

-  A [cli-util] to query the SourceHut GraphQL API.
:::

## Communication

    Primary: Hindi \
    Secondary: English


[proposal]: https://www.catalystexplorer.com/en/proposals/haskledger-an-edsl-for-scalable-cardano-sidechains-f11/details

[cluster]: https://gitlab.com/xameer/nixos-gitlab-kube-ci/


[serverless API]: https://gitlab.com/xameer/rs-comment-api

[CLI tool]: https://gitlab.com/xameer/opml-crawler

[blog]: https://xameer.gitlab.io

[microblog]: https://mathstodon.xyz/@xameer

[git forges]: https://gitlab.com/xameer

[cli-util]: https://git.sr.ht/~carnotweat/srht
