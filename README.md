# Marzban Node Ansible

This repository contains Ansible playbooks and roles for installing Docker, configuring Marzban containers, and managing nodes on a panel. This guide provides instructions for setting up a Python virtual environment, installing Ansible, and running the playbooks.

## Language

- [English](README.md)
- [Farsi](README_fa.md)
- [Chinese](README_zh.md)

## Prerequisites

Ensure you have the following installed on your system:

- Python 3
- pip (Python package installer)
- Git (to clone this repository)
- Docker (for testing with Docker)

## Setting Up the Python Virtual Environment

It is recommended to use a Python virtual environment to manage your dependencies. Follow these steps to set up and activate the virtual environment:

1. Create a Python virtual environment:

   ```sh
   python3 -m venv venv
   ```

2. Activate the virtual environment:

   - On Linux/macOS:

     ```sh
     source venv/bin/activate
     ```

   - On Windows:

     ```sh
     .\venv\Scripts\activate
     ```

3. Upgrade pip:

   ```sh
   pip install --upgrade pip
   ```

4. Install Ansible and the required dependencies using pip:

```sh
pip install -r requirements.txt
```

## Project Structure

```sh
ansible-playbook-docker-node/
├── ansible.cfg
├── Dockerfile
├── inventory/
│   └── production.yml
├── group_vars/
│   ├── all.yml
│   ├── vault.yml
│   └── README.md
├── host_vars/
├── playbooks/
│   └── site.yml
└── roles/
    ├── create_node_on_panel/
    ├── docker/
    └── marzban/
```

- `ansible.cfg`: Ansible configuration file.
- `Dockerfile`: Dockerfile for setting up a test environment.
- `inventory/`: Directory containing inventory files.
- `group_vars/`: Directory containing group variable files.
- `host_vars/`: Directory for host-specific variable files.
- `playbooks/`: Directory containing playbooks.
- `roles/`: Directory containing roles.

## Encrypting Sensitive Data with Ansible Vault

To secure sensitive data such as certificates and tokens, use Ansible Vault. The `vault.yml` file in the `group_vars` directory is encrypted. Follow these steps to encrypt/decrypt the file:

1. Encrypt the `vault.yml` file:

   ```sh
   ansible-vault encrypt group_vars/vault.yml
   ```

2. Decrypt the `vault.yml` file:

   ```sh
   ansible-vault decrypt group_vars/vault.yml
   ```

## Running the Playbooks

Ensure your inventory files and variables are correctly configured. Then, run the playbooks using the following commands:

### For Production

```sh
ansible-playbook -i inventory/production.yml playbooks/site.yml --ask-vault-pass
```

### For Testing with Docker

1. Build and run the Docker container:

   ```sh
   docker build -t ansible-test .
   docker run -d --name ansible-test -p 2222:22 ansible-test
   ```

2. Run the playbook against the test inventory:

   ```sh
   ansible-playbook -i inventory/test.yml playbooks/site.yml --ask-vault-pass
   ```

3. Clean up the Docker container after testing:

   ```sh
   docker stop ansible-test
   docker rm ansible-test
   ```

## Acknowledgments

We would like to extend our heartfelt thanks to the developers and contributors of the [Marzban project](https://github.com/Gozargah/Marzban). Marzban, developed by Gozargah, has provided an exceptional solution for managing VPN users and services with ease. Its user-friendly interface and comprehensive feature set have significantly simplified the administration of VPN networks, ensuring secure and reliable connectivity.

We are grateful for the contributions of the Marzban project and the dedication of its community. Thank you, Marzban, for empowering organizations and individuals to achieve secure, efficient, and manageable VPN services. Your efforts have made a significant impact, and we look forward to your continued growth and success.

## License

This project is licensed under the Apache License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request with your improvements.
