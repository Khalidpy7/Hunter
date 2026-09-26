# Hunter

<p align="center">
  <b>Hunter — Security Awareness & Phishing Simulation Wrapper</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Author-khalidpy7-blue?style=for-the-badge">
  <img src="https://img.shields.io/badge/Version-1.0-green?style=for-the-badge">
  <img src="https://img.shields.io/badge/Platform-Kali%20Linux-yellow?style=for-the-badge">
  <img src="https://img.shields.io/badge/Language-Bash-darkcyan?style=for-the-badge">
</p>

> **Important:** Use this project only in a lab, on systems you own, or with explicit authorization. Do not use it to collect real passwords, tokens, or other credentials.

## Overview

Hunter is a Bash-based wrapper around a phishing-awareness workflow.

The project is divided into three scripts:

```text
requirements.sh
      │
      ├── checks/install dependencies
      └── installs Cloudflared
              │
              ▼
          main.sh
              │
              └── starts the configured awareness/simulation component
                       │
                       ▼
                 cloudtunnel.sh
                       │
                       └── optionally starts a Cloudflared tunnel
```

## Project Files

| File | Purpose |
|---|---|
| `requirements.sh` | Installs/checks the packages required by the project and installs Cloudflared. |
| `main.sh` | Shows the Hunter banner and starts the simulation component. |
| `cloudtunnel.sh` | Accepts a server URL and passes it to Cloudflared for authorized testing. |

## Requirements

The current `requirements.sh` checks for:

- `python3`
- `curl`
- `git`
- `php`

It also installs:

- `ca-certificates`
- `cloudflared`

The dependency setup uses the Debian/Kali `apt` package manager.

## Installation

### 1. Clone or copy the project

Place these files in the same directory:

```text
Hunter/
├── main.sh
├── requirements.sh
├── cloudtunnel.sh
└── README.md
```

If your project also contains a separate simulation component referenced by `main.sh`, keep that file in the same directory as well.

### 2. Enter the project directory

```bash
cd Hunter
```

### 3. Make the scripts executable

```bash
chmod +x main.sh requirements.sh cloudtunnel.sh
```

### 4. Install the dependencies

Run:

```bash
sudo ./requirements.sh
```

The script checks for the required commands and installs missing packages. It also configures the Cloudflare package repository and installs `cloudflared`.

You can alternatively run:

```bash
bash requirements.sh
```

## Running the Project

After the dependencies are installed:

```bash
./main.sh
```

or:

```bash
bash main.sh
```

The main script:

1. Displays the Hunter banner.
2. Makes the simulation script executable.
3. Displays a message about the next step.
4. Starts the simulation component.

## Cloudflared Workflow

`cloudtunnel.sh` is a separate helper script.

It asks for a server URL:

```text
[?] Enter server url:
```

It then invokes Cloudflared using that URL.

Only use this with a server that you are authorized to expose for a security-awareness exercise.

Run:

```bash
bash cloudtunnel.sh
```

### Important

Do not enter:

- another person's private server
- a service you do not control
- a credential-harvesting endpoint
- a URL created to impersonate a real service

Use a local laboratory application or an intentionally created awareness-training page instead.

## Complete Workflow

The intended installation order is:

```text
1. Open terminal
        ↓
2. Enter Hunter directory
        ↓
3. chmod +x *.sh
        ↓
4. sudo ./requirements.sh
        ↓
5. ./main.sh
        ↓
6. Run cloudtunnel.sh only when an authorized
   tunnel is required for your lab
```

### Quick setup

```bash
cd Hunter
chmod +x main.sh requirements.sh cloudtunnel.sh
sudo ./requirements.sh
./main.sh
```

## Troubleshooting

### `Permission denied`

Make the scripts executable:

```bash
chmod +x main.sh requirements.sh cloudtunnel.sh
```

### `sudo: command not found`

The current scripts expect a Debian/Kali-style environment with `sudo` and `apt`.

### A dependency is missing

Run:

```bash
sudo ./requirements.sh
```

Then verify:

```bash
python3 --version
curl --version
git --version
php --version
cloudflared --version
```

### `cloudflared: command not found`

Run the dependency installer again:

```bash
sudo ./requirements.sh
```

Then check:

```bash
cloudflared --version
```

### The simulation script cannot be found

`main.sh` expects its simulation script to be present in the project directory. Make sure the required file exists before running `main.sh`.

## Script Relationships

### `requirements.sh`

Responsible for environment preparation:

```text
check packages
     ↓
install missing dependencies
     ↓
configure Cloudflare package source
     ↓
install cloudflared
     ↓
verify cloudflared
```

### `main.sh`

Responsible for starting the project:

```text
banner
  ↓
prepare simulation script
  ↓
start simulation
```

### `cloudtunnel.sh`

Responsible for the optional tunnel step:

```text
ask for server URL
       ↓
Cloudflared
       ↓
authorized test endpoint
```

## Security & Legal Notice

This repository is intended for:

- security awareness training
- controlled laboratory experiments
- defensive security education
- authorized penetration-testing exercises

Do not use it to:

- steal credentials
- impersonate people or organizations
- access accounts without permission
- distribute malicious links
- collect passwords or session tokens
- target people without informed authorization

Always obtain permission before conducting a security simulation against another person's device, account, network, or organization.

## Recommended Lab Setup

For learning, use an isolated environment such as:

```text
Your computer
     │
     ├── Kali Linux / security lab
     │
     └── intentionally created test application
```

Use test accounts and dummy data rather than real credentials.

## Version

Current Hunter wrapper version:

```text
1.0
```

## Author

Created by **khalidpy7**
<p align="center">
  <a href="https://github.com/khalidpy7" target="_blank"><img src="https://img.shields.io/badge/Github-blue?style=for-the-badge&logo=github">
  </a>
</p>
