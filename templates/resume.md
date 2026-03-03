---
title: "Xameer"
author: "Xameer"
date: "2026"
lang: en
fontsize: 10pt
geometry: "margin=2cm"
colorlinks: true
urlcolor: blue
---

Xameer
======

----

>  NixOS infrastructure engineer. Kubernetes on QEMU VMs, agenix secret management,\
>  Rust services, GitLab CI, Tailscale mesh networking.

----

Experience
----------

**2024 -- Present**
:   **Infrastructure Engineer**; Self-hosted homelab

    Designed and deployed a two-node Kubernetes cluster on NixOS QEMU VMs with full
    declarative configuration via flakes. Implemented agenix-encrypted secret management,
    WasmEdge containerd runtime, and GitLab CI pipelines triggering rolling k8s deployments
    via a Rust webhook service.

    * Built ops-dashboard: Axum/Rust service exposing cluster status API and GitLab webhook receiver
    * Configured Tailscale mesh with session recording, device posture, and MagicDNS
    * Deployed minio, Nextcloud, atticd (nix binary cache), Prometheus + Grafana stack

**2022 -- 2024**
:   **Systems Developer**; Previous Role

    Short description of work done, results, lessons learned.

    * Built and maintained CI/CD pipelines
    * Contributed to [open source projects](https://github.com/0xameer)

Technical Skills
----------------

NixOS / Flakes
:   **Declarative system config:** Full NixOS flake setup with agenix secrets,
    home-manager, overlays, and QEMU VM builder. Node differentiation via
    `specialArgs.nodeIndex`.

:   **Tooling:** agenix, crane, fenix, colmena, terraform-nixos-ng

Kubernetes
:   **Cluster:** Two-node k8s on NixOS QEMU VMs. kube-apiserver token auth,
    etcd, containerd + WasmEdge runtime, CoreDNS, kube-proxy.

:   **Workloads:** Deployments, Services, RBAC, RuntimeClass (wasmedge),
    topology spread constraints, rolling updates via webhook trigger.

Rust
:   **ops-dashboard:** Axum HTTP service -- webhook receiver, kube-apiserver
    client, live cluster dashboard. Built hermetically with crane + fenix.

:   Basic knowledge of **C**, **bash**, **Python**, **Lua**, **Nix**

Infrastructure
:   **Networking:** Tailscale ACLs, WireGuard (wgkube inter-node, wg0 phone VPN),
    VDE switch for QEMU VM LAN.

:   **Storage:** minio S3-compatible object store, Nextcloud with S3 backend,
    restic backups.

:   **Observability:** Prometheus + Grafana + Alertmanager with Telegram alerts,
    node-exporter on all nodes, etcd fsync latency alerting.

Open Source
-----------

[wasm-k8s](https://github.com/0xameer/wasm-k8s)
:   NixOS module providing WasmEdge containerd runtime via crun, plus
    KubeDiagrams package for live cluster architecture diagrams.

[ops-dashboard](https://github.com/0xameer/ops-dashboard)
:   Rust/Axum cluster dashboard and GitLab webhook receiver.
    Deployed as k8s pods, exposed via Tailscale funnel.

[forge](https://github.com/0xameer/forge)
:   NixOS flake for two-node k8s homelab. QEMU VMs, agenix secrets,
    home-manager, GitLab CI, WasmEdge, Prometheus.

Education
---------

2020-2024
:   **BSc, Computer Science**; University Name (City)

    *Focus: distributed systems, compilers*

----

> <xameer@example.com> \ +00 000 000 0000 \
> github.com/0xameer -- Hyderabad, IN
