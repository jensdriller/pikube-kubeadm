# Deploy Kubernetes atop Raspberry Pis - The easy way

## What is this project?

This project leverages kubeadm and Ansible to provision a kubernetes cluster on Raspberry Pis (or any other ARM single board computer)

## What do I need for this to work?
  - A linux environment with Python already configured
  - At least two raspberry pi's
  - A half decent network router that can do static IP allocations

---
## Getting Started

### Install Ansible (v2.8 or newer)
  - [Ubuntu  install docs](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu)
  - Mac: `brew install ansible`

### Clone the repo
```
git clone https://github.com/jensdriller/pikube-via-kubeadm.git
```

### Update `ansible.cfg`
  - Update `roles_path` to match the location of the repo on your local machine. 

---
## Set up each raspberry pi

### Get ubuntu base image
- Download ubuntu 19.10 for the raspberry pi (https://ubuntu.com/download/raspberry-pi)
- Flash SD card with ubuntu image - [Balena Etcher](https://www.balena.io/etcher/) is a good tool for this
- Insert the SD card in the Pi and connect power and ethernet.

### Configure Devices on the Network
- In your router admin page, locate each raspberry pi
- Configure a static IP for each device. Record these values, we'll use them to update the ansible `hosts` file

### Copy over your ssh keys
- With the IP addresses configured above, ssh onto each raspberry pi via `ssh ubuntu@<static-ip-address>`.
- The default password is `ubuntu`. You'll be promted to set a new one
- Select a ssh key to copy over (or create a new one via `ssh-keygen`)
- `ssh-copy-id ubuntu@$<static-ip-address> -i ~/.ssh/id_rsa.pub` (or specify another key)
- Verify you can now ssh onto the pi without being promted for a password

---
## Deploy via Ansible
...