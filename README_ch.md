# Marzban Node Ansible

此仓库包含用于安装 Docker、配置 Marzban 容器和管理面板上的节点的 Ansible playbook 和角色。本指南提供了设置 Python 虚拟环境、安装 Ansible 和运行 playbook 的说明。

## 前提条件

确保您的系统上安装了以下内容：

- Python 3
- pip (Python 包管理器)
- Git (用于克隆此仓库)
- Docker (用于使用 Docker 进行测试)

## 设置 Python 虚拟环境

建议使用 Python 虚拟环境来管理您的依赖项。请按照以下步骤设置和激活虚拟环境：

1. 创建 Python 虚拟环境：

   ```sh
   python3 -m venv venv
   ```

2. 激活虚拟环境：

   - 在 Linux/macOS 上：

     ```sh
     source venv/bin/activate
     ```

   - 在 Windows 上：

     ```sh
     .\venv\Scripts\activate
     ```

3. 升级 pip：

   ```sh
   pip install --upgrade pip
   ```

4. 使用 pip 安装 Ansible 和所需的依赖项：

```sh
pip install -r requirements.txt
```

## 项目结构

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

- `ansible.cfg`: Ansible 配置文件。
- `Dockerfile`: 用于设置测试环境的 Dockerfile。
- `inventory/`: 包含清单文件的目录。
- `group_vars/`: 包含组变量文件的目录。
- `host_vars/`: 特定主机变量文件的目录。
- `playbooks/`: 包含 playbook 的目录。
- `roles/`: 包含角色的目录。

## 使用 Ansible Vault 加密敏感数据

要保护证书和令牌等敏感数据，请使用 Ansible Vault。`group_vars` 目录中的 `vault.yml` 文件已加密。请按照以下步骤加密/解密文件：

1. 加密 `vault.yml` 文件：

   ```sh
   ansible-vault encrypt group_vars/vault.yml
   ```

2. 解密 `vault.yml` 文件：

   ```sh
   ansible-vault decrypt group_vars/vault.yml
   ```

## 运行 Playbook

确保您的清单文件和变量配置正确。然后，使用以下命令运行 playbook：

### 生产环境

```sh
ansible-playbook -i inventory/production.yml playbooks/site.yml --ask-vault-pass
```

### 使用 Docker 进行测试

1. 构建并运行 Docker 容器：

   ```sh
   docker build -t ansible-test .
   docker run -d --name ansible-test -p 2222:22 ansible-test
   ```

2. 使用测试清单运行 playbook：

   ```sh
   ansible-playbook -i inventory/test.yml playbooks/site.yml --ask-vault-pass
   ```

3. 测试后清理 Docker 容器：

   ```sh
   docker stop ansible-test
   docker rm ansible-test
   ```

## 鸣谢

我们谨向 [Marzban 项目](https://github.com/Gozargah/Marzban) 的开发者和贡献者表示诚挚的感谢。Marzban 由 Gozargah 开发，为管理 VPN 用户和服务提供了卓越的解决方案。其用户友好的界面和全面的功能集极大地简化了 VPN 网络的管理，确保了安全可靠的连接。

我们感谢 Marzban 项目及其社区的贡献。感谢 Marzban 为组织和个人实现安全、高效和可管理的 VPN 服务提供支持。你们的努力产生了重大影响，我们期待你们的持续成长和成功。

## 许可证

本项目根据 Apache 许可证授权。有关详细信息，请参阅 [LICENSE](LICENSE) 文件。

## 贡献

欢迎贡献！请提交 issue 或提交 pull request 提出您的改进建议。
