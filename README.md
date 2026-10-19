# Raspberry Pi Container Security Lab

A homelab I'm building on a Raspberry Pi 4 to learn container and Kubernetes security properly. I set things up, deliberately break them the way real systems go wrong, then work out how to detect and fix them. It all runs on the Pi.

It's built in stages. Each one adds a layer and has its own folder with the commands I ran and what I found.

## Stages

**Stage 1, containers** (`stage1/`)
Build a small container and harden it: run it as a non-root user, drop Linux capabilities, make the filesystem read-only. Then scan it with Trivy and work through what it finds, separating what can be fixed from what can't.

**Stage 2, Kubernetes** (`stage2/`)
Stand up a k3s cluster and apply the core controls: RBAC to limit what each account can do, network policies to control what can talk to what, and Pod Security Standards to keep risky pods out.

**Stage 3, detection and policy** (`stage3/`)
The defender side. Falco to spot suspicious behaviour as it happens, Kyverno to block bad configs before they deploy, kube-bench to measure the cluster against a security benchmark, and image signing to prove images haven't been tampered with.

## Setup

Raspberry Pi 4 (4GB) running k3s on Raspberry Pi OS Lite (64-bit). 

## What it shows

- Container hardening and image scanning
- Kubernetes security: RBAC, network policies, Pod Security
- Runtime detection and policy as code
- Reading and acting on vulnerability scans
