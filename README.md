# fritzbox-cloudflare-dyndns-chart

A Kubernetes Helm chart for automatically updating DNS records at
Cloudflare.\
Designed as a replacement for the FRITZ!Box DynDNS feature and ideal for
GitOps-driven environments.

This chart uses the container image:\
👉 **[cromefire/fritzbox-cloudflare-dyndns](https://github.com/cromefire/fritzbox-cloudflare-dyndns)**

------------------------------------------------------------------------

## 🚀 Features

-   🔧 Automatically updates Cloudflare DNS records (IPv4/IPv6)
-   🔐 Supports Kubernetes Secrets (API token & password)
-   📡 Service + HTTPRoute (Gateway API) support
-   📦 GitHub Pages-based Helm repository
-   🔍 Automated linting & testing (Helm)
-   ♻️ GitOps-style automated semantic versioning (SemVer + tags)

------------------------------------------------------------------------

## 📦 Helm Repository

The public Helm repository is available at:

    https://steled.github.io/fritzbox-cloudflare-dyndns-chart/

### Add repository

``` sh
helm repo add fritzbox-dyndns https://steled.github.io/fritzbox-cloudflare-dyndns-chart/
helm repo update
```

### Install the chart

``` sh
helm install dyndns fritzbox-dyndns/fritzbox-cloudflare-dyndns-chart --namespace cloudflare-dyndns --create-namespace
```

------------------------------------------------------------------------

## 🔐 Configuration

### Example `values.yaml`

``` yaml
useExistingSecrets: false
secrets:
  cloudflareApiToken: "YOUR-API-TOKEN"
  dyndnsServerPassword: "DYNDNS-SERVER-PASSWORD"

env:
  CLOUDFLARE_ZONES_IPV4: "test.example.com"
  CLOUDFLARE_ZONES_IPV6: "test.example.com"
  DYNDNS_SERVER_USERNAME: "ddnsUser"
```

### Using your own Kubernetes Secret

``` yaml
existingSecrets:
  cloudflareApiTokenName: "TOKEN-NAME-VALUE"
  dyndnsServerPasswordName: "SERVER-PASSWORD-VALUE"
```

Required secret structure:

``` yaml
apiVersion: v1
kind: Secret
metadata:
  name: dyndns-secrets
  namespace: ddns-updater
type: Opaque
data:
  cloudflare_api_token: <base64>
  dyndns_server_password: <base64>
```

------------------------------------------------------------------------

## 🛠 Development & Testing

### Helm lint

``` sh
helm lint charts/fritzbox-cloudflare-dyndns-chart
```

### Dry‑run chart install

``` sh
helm install test charts/fritzbox-cloudflare-dyndns-chart --dry-run --debug
```

### Package locally

``` sh
helm package charts/fritzbox-cloudflare-dyndns-chart
```

------------------------------------------------------------------------

## 🤖 GitHub Actions CI/CD

The repository includes:

-   **Auto Tag Version** -- automated SemVer bumping based on commit
    messages
-   **Release Helm Chart** -- packages charts and updates the Helm
    repository on GitHub Pages and linting & testing steps

------------------------------------------------------------------------

## 🗂 Repository Structure

    .
    ├── charts/
    │   └── fritzbox-cloudflare-dyndns-chart/
    │       ├── Chart.yaml
    │       ├── values.yaml
    │       └── templates/
    ├── .github/workflows/
    │   ├── auto-tag.yaml
    │   └── release-helm.yaml
    └── README.md

------------------------------------------------------------------------

## ❤️ Contributing

PRs are always welcome!

------------------------------------------------------------------------

## 📝 License

This project is released under the **MIT License**.
