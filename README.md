# Raspberry Pi Cloud Security Lab

A homelab I built on a Raspberry Pi 4 to learn container and Kubernetes security by doing. In each stage I set something up, broke it the way real systems get misconfigured, then worked out how to detect the problem and fix it. Everything runs on the Pi, so there are no cloud costs and nothing leaves my own network.

I built it in stages. Each one adds a security layer and has its own folder with the exact commands I ran, what I found, and how I fixed it.

## Stages

**Stage 1, containers** (`stage1/`)
I built a small container image and hardened it: ran it as a non-root user, dropped the Linux capabilities it didn't need, and made the filesystem read-only. I scanned it with Trivy, then worked through the findings and separated the ones worth fixing from the ones with no fix available.

**Stage 2, Kubernetes** (`stage2/`)
I deployed a k3s cluster and applied the main controls: RBAC to limit what each service account can do, network policies to control which pods can talk to each other, and Pod Security Standards to keep high-risk pods out.

**Stage 3, detection and policy** (`stage3/`)
The defensive side. I set up Falco to catch suspicious behaviour at runtime, Kyverno to block non-compliant configs before they deploy, kube-bench to check the cluster against the CIS benchmark, and image signing to confirm images haven't been tampered with.

## Setup

Raspberry Pi 4 (4GB) running k3s on Raspberry Pi OS Lite (64-bit). I run one stage at a time to fit the memory.

## What it shows

- Container hardening and image scanning
- Kubernetes security: RBAC, network policies, Pod Security Standards
- Runtime threat detection and policy as code
- Reading scan output and deciding what to fix first
