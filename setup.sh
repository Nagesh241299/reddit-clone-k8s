#!/bin/bash

set -e

echo "🧱 Creating Kind cluster..."
kind create cluster --wait 60s

echo "📦 Installing metrics-server..."
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

echo "🕒 Waiting for metrics-server to be ready..."
kubectl rollout status deployment metrics-server -n kube-system

echo "🚀 Applying reddit-clone manifests..."
kubectl apply -f k8s/

echo "✅ All set! Use 'kubectl get all' to see your deployment."
