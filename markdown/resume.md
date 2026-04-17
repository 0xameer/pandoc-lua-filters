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
xameer@disroot.org | +91 799 311 0170 | Ananthapur, India.
:::

## Summary

::: {.callout type="note"}
Infrastructure architect and functional programmer with 15 years of applied experience across systems design, data
engineering, and API development.
I specialize in reproducible infrastructure as code, service design, DSL and language inter-ops, binary cache optimization, and zero-trust networking.
Track record of reducing cloud compute and hosting costs through self-hosted, declarative infrastructure.
Available for remote senior and staff engineering roles.
:::

I commit to [git forges] and write on my [blog], [microblog].

## Core Competencies

**Infrastructure as Code**
: Terraform/Pulumi, GitLab CI/CD, declarative VM provisioning, system service design.

**Languages, DSL & FFI InterOps**
: Nixpkgs, Haskell, Rust, Lua, Bash, Python, Wasm, Emacs Lisp.

**Distributed Systems**
: Kubernetes (bare-metal, CRI-O, etcd, secretbox), Apps and services for  zero-trust
network meshes , Cloudflare Workers.

**Binary Caching and CI Optimization**
: Cachix, Attic (R2-backed), FastCDC chunk tuning,
~ 80% CI time reduction through cache layer design.

**Storage and Data**
: MinIO (S3-compatible), Restic (offsite backup), Longhorn
  (K8S PVC), Turso/libSQL (SQLite), etcd, OpenEBS, AWS CSI.

**API and Service Design**
: Protocol implementation, CRUD and REST web-hooks.

---

## Selected Projects

### Self-Hosted Blog Infrastructure (2026)

For a small scale DevOps, with Rust and Haskell tool-chain, but without the cloud or CI runner compute cost or CDN egress fees and reduced network costs.

### NixOS Kubernetes Cluster (2025--26)

A production grade n-node QEMU VM [cluster], with a reproducible cluster state

For Apps, I used GitLab webhook receivers triggering Kubernetes rolling restarts on successful pipeline
events. Which are exposed via Cloudfare Tunnel.

### Cardano Proposal (2023--24)
Proposed a Haskell EDSL  network-namespace process isolation for Cardano nodes to eliminate port conflicts and improve data integrity.
Funded in Catalyst Fund-11 via community vote on Ideascale. Partnered with D.A.O. Konma (Chennai) for the pitch.

## Experience

### 2024--25 | Freelance Trainer, Data and Cloud Infrastructure -- Hyderabad

Trained engineers in data lake architecture: Medallion and Data Vault patterns,
cloud-native Kubernetes, and hybrid cost/latency models. Covered Terraform IaC,
Kubernetes resource management, GitOps, and disposable environment design.

### 2023--24 | Senior Haskell Developer -- Haskledger

Submitted a [proposal] to address scalability and hardware compatibility  related issue of smart contracts on the Plutus.
I was developing an Embedded Domain-Specific Language (EDSL) optimized for open-source hardware.
The [proposal] won Catalyst Fund-11 proposal for network namespace isolation.

### 2019--23 | Freelance Network Programmer

Prototyped interconnection services for crypto mining data centres. Full cycle:
value proposition, feasibility, simulation, prototype, pitch.
I developed Linux services with Podman, cloud, and server-less on tunnels.

### 2016--19 | Freelance Web Developer

Frontend features and UI fixes for seed-funded startups. Web administration, development, and App firewalls.

### 2015--16 | Data Science Lead -- Examify, Mumbai

NLP pattern recognition, ML with CUDA. Reported to CTO and CEO.

### 2010--12 | Faculty, Physics

Preparatory physics for IIT-JEE at commercial institutes.

---

## Education

**2006--2010** | B.Tech, M.E.M.S. -- Indian Institute of Technology Bombay.
I was enrolled for the 4 year Course.
Applied Physics, Mathematics, CS-101. Winter intern at I.I.M. Bangalore (traffic
policy research and analysis).

::: {.callout type="tip"}
Dorm startup *JeeCarnot*: statistical analysis of competitive exam outcomes.
:::

---

## Open Source

-  A [serverless API] for a virtual Tailscale Microservice service to post comments on my blog, deployed on Hasura [Turso].
 So that, anyone  with a valid GPG key or [indiauth] portal can comment on my blog post even from the machines which are
 not my Tailscale peer.

 - A fast [CLI tool] to crawl RSS/Atom job feeds from an OPML file, deduplicate entries, and output recent jobs in
   multiple formats.

## Communication

Primary: Hindi | Secondary: English

## References

[proposal]: https://www.catalystexplorer.com/en/proposals/haskledger-an-edsl-for-scalable-cardano-sidechains-f11/details

[serverless API]: https://gitlab.com/xameer/rs-comment-api

[CLI tool]: https://gitlab.com/xameer/opml-crawler

[blog]: xameer.gitlab.io

[microblog]: https://mathstodon.xyz/@xameer

[git forges]: https://gitlab.com/xameer
