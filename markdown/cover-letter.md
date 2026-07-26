---
title: "Cover Letter"
author: "Sameer Gupta"
date: "2026"
lang: en
fontsize: 10pt
geometry: margin=1.8cm
colorlinks: true
header-includes:
  - \usepackage{tcolorbox}
  - \tcbuselibrary{breakable}
---

::: {.contact-footer}
<xameer@zohomail.in> - +91 799 311 0170 - Ananthapur, India
:::

---

Dear Hiring Team,

In 2010, I applied for an internship at Greenpeace India and corresponded
with Akshey Kalra about a cover letter and project proposal. Life took a
different turn before that could be finished, and I spent the years since
building a career in distributed systems, programming language theory, and
infrastructure engineering. I am writing again now, fifteen years later, at
a point where that experience has something concrete to offer the same
mission I was drawn to then.

In the interim, I designed and wrote the winning proposal for Haskledger, an
embedded DSL for Plutus smart contract development on Cardano. The Cardano
community voted to fund its development, in part for its application to
carbon credit tracking in India \u2014 verifiable, tamper-resistant record-keeping
for emissions reduction claims, which is a real infrastructure problem before
it is a policy one. GADTs and phantom types enforced resource constraints on
the contracts at compile time; a denotational interpreter mapped the DSL to
Plutus Core through rewrite rules; batched state transitions reduced the
sidechain execution costs that make on-chain tracking viable at scale.

Since then my work has stayed close to the same question in a different
form: how do you build systems whose logic stays legible as they grow,
rather than collapsing into complexity nobody can reason about. I run a
production Kubernetes cluster on NixOS with full GitOps and reproducible
infrastructure, and I have recovered it from real failures \u2014 an etcd
encryption key corruption, a Calico/Tailscale netfilter conflict \u2014 without
data loss, because I had a precise enough model of what the system was
supposed to be doing to see exactly where reality had diverged. That same
discipline is what carbon-tracking infrastructure, environmental monitoring
systems, or any data pipeline Greenpeace India relies on will need to be
trustworthy at scale.

I am now at a stage in my career where I can realistically contribute at a
senior or staff level, not as an intern \u2014 and where the environmental
application of infrastructure work is something I would genuinely want to
spend the next years on, not a detour from it. If there is a role, project,
or infrastructure need at Greenpeace India where that would be useful, I
would welcome the conversation.

Thank you for your time and consideration.

---
Sincerely,
Sameer Gupta - <xameer@zohomail.in> - [Git Forges](https://gitlab.com/xameer) - [Blog](https://xameer.gitlab.io)
