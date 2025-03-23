---
title: Kubernetes
pubDate: 2024-11-04
description: "Kubernetes"
tags: ["kubernetes"]
isDraft: true
snippet:
  language: "bash"
  code: "kubectl get pods"
---

Kubernetes is an open-source container orchestration platform that automates
the deployment, scaling, and management of containerized applications. It
provides a framework for running distributed systems resiliently, allowing you
to manage your application's lifecycle, scale it up or down based on demand, and
ensure high availability.

Kubernetes abstracts away the underlying infrastructure, making it easier to
deploy and manage applications consistently across different environments,
whether on-premises or in the cloud. It also offers features like service
discovery, load balancing, rolling updates, and self-healing, which help
maintain the desired state of your applications and improve their reliability.

## Cluster and Namespace

- **Cluster**: A Kubernetes cluster is a set of nodes (machines) that run
  containerized applications. It consists of a control plane (manages the
  cluster) and worker nodes (run the applications).
- **Namespace**: A namespace is a way to divide cluster resources between
  multiple users or teams. It provides a scope for names, allowing you to create
  isolated environments within the same cluster. Namespaces help organize
  resources and prevent naming conflicts.
  - **Kube-system**: The `kube-system` namespace is used for Kubernetes system
    components and add-ons. It contains essential services like the Kubernetes
    dashboard, DNS, and other system-level resources.

## Nodes

A node is a worker machine in Kubernetes. It can be a physical or virtual
machine and runs the necessary services to execute pods (containers).
Each node is managed by the control plane.

### Nodes Master

The master node is responsible for managing the cluster. It runs the control
plane components, including the API server, scheduler, and controller manager.
The master node makes decisions about the cluster's state and ensures that the
desired state is maintained.

#### Controller Manager

The controller manager is a component of the Kubernetes control plane that runs
controller processes. Controllers are responsible for regulating the state of
the cluster, ensuring that the desired state matches the actual state. For
example, the Replication Controller ensures that the specified number of pod
replicas are running.

#### API Server

The API server is the central component of the Kubernetes control plane. It
exposes the Kubernetes API, which allows users and other components to interact
with the cluster. The API server validates and processes requests, updating the
cluster's state accordingly.

#### Scheduler

The scheduler is responsible for assigning pods to nodes in the cluster. It
considers factors like resource availability, constraints, and policies to make
decisions about pod placement.

#### etcd

etcd is a distributed key-value store used by Kubernetes to store the cluster's
configuration data and state. It provides a reliable and consistent way to store
and retrieve cluster information, ensuring that the control plane components have
access to the latest state of the cluster.

### Nodes Worker

Worker nodes are the machines where your applications run. They host the pods
and provide the necessary resources (CPU, memory, storage) for your containers.
Worker nodes communicate with the master node to receive instructions and report
their status.

#### Kubelet

The kubelet is a component of the Kubernetes control plane that runs on each
node in the cluster. It ensures that the containers are running in the desired
state.
