# 🚀 My Personal Dotfiles

这是一个用于配置我的 **Windows Subsystem for Linux (WSL2)** 和 **Zsh** 开发环境的个人配置文件仓库。它的目标是实现一个功能强大、界面美观且高度可定制的命令行环境，并且可以通过一个脚本快速部署到任何新机器上。

---

## ✨ 特性亮点

* **Zsh + Oh My Zsh**: 使用 Zsh 作为默认 Shell，并通过 Oh My Zsh 框架进行管理，提供了强大的插件和主题支持。
* **Powerlevel10k 主题**: 极致美观、高度可定制且速度极快的 Zsh 主题，提供丰富的上下文信息（Git 状态、Conda 环境等）。
* **优化的 WSL2 配置**: 使用现代化的 `mirrored` 网络模式，无缝集成 Windows 的网络和代理。
* **自动化安装脚本**: 通过一个 `install.sh` 脚本，可以一键为所有配置文件创建符号链接，快速完成部署。
* **Nerd Fonts 支持**: 完美集成 Nerd Fonts 字体，可在终端中显示各种图标。
* **模块化管理**: 所有配置文件都按工具分类存放在不同的文件夹中（`wsl/`, `zsh/`），清晰明了，易于扩展。

---

## 🔧 前提条件

在开始之前，请确保你的系统满足以下条件：

1.  **Windows 10 或 11**: 并已安装 WSL2。
2.  **开启 Windows 功能**:
    * 必须在 "启用或关闭 Windows 功能" 中勾选 **"虚拟机平台 (Virtual Machine Platform)"** 和 **"Windows 亥伯思威泽平台 (Windows Hypervisor Platform)"**。这是 WSL2 正常运行的基石。
3.  **安装一个 Nerd Font 字体**:
    * 为了正确显示 Powerlevel10k 主题的所有图标，必须安装一个 Nerd Font。
    * 推荐字体: **[FiraCode Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip)**
    * **安装方法**: 下载并解压后，全选所有 `.ttf` 文件，右键选择 "为所有用户安装"。
4.  **安装 Git**: 在 WSL 环境中需要 `git` 来克隆本仓库。

---

## ⚙️ 安装与部署

#### 第 1 步: 克隆本仓库

将此仓库克隆到你的 WSL 家目录下的 `.dotfiles` 文件夹中。

```bash
git clone https://github.com/Yima-Gu/Dotfiles.git
```

#### 第 2 步: 运行安装脚本

`install.sh` 脚本会自动为你创建 Zsh 和 Powerlevel10k 配置文件的符号链接。

```bash
cd ~/.dotfiles
./install.sh
```

#### 第 3 步: ⚠️ 手动处理 `.wslconfig` (重要！)

由于 WSL 的机制和跨文件系统的权限问题，`.wslconfig` 文件需要手动处理以确保其可靠性。

**请手动将仓库中的 `.wslconfig` 文件复制到你的 Windows 用户目录下。**

* **源文件位置 (Source):**
    `~/.dotfiles/wsl/.wslconfig`

* **目标位置 (Destination):**
    `C:\Users\[你的 Windows 用户名]\`

> **提示**: 每当你修改了仓库中的 `.wslconfig` 文件，都需要重新手动复制一次才能生效。

#### 第 4 步: 配置你的终端字体

打开你的终端应用（如 **Windows Terminal** 或 **VS Code 的集成终端**），将其字体设置为 `FiraCode Nerd Font`。

#### 第 5 步: 重启终端

完全关闭并重新打开你的 WSL 终端。此时，Oh My Zsh 和 Powerlevel10k 应该已经加载，你将看到一个全新的、漂亮的命令行界面！

如果 Powerlevel10k 首次加载时启动了配置向导，请根据它的提示完成个性化设置。

---

## 📂 文件夹结构

本仓库采用模块化的文件夹结构来管理不同的配置：

```
.
├── install.sh           # 自动化安装脚本
├── README.md            # 本说明文件
├── wsl/                 # 存放 WSL 专属配置
│   └── .wslconfig
└── zsh/                 # 存放 Zsh 和相关工具的配置
    ├── .p10k.zsh
    └── .zshrc
```

---

## 🎨 自定义与维护

* **修改 Zsh 配置**: 直接编辑 `~/.dotfiles/zsh/.zshrc` 文件。
* **修改 Powerlevel10k 主题**: 运行 `p10k configure` 或直接编辑 `~/.dotfiles/zsh/.p10k.zsh` 文件。
* **保存你的修改**: 每当你对配置做出满意的修改后，别忘了提交到 Git：

    ```bash
    cd ~/.dotfiles
    git add .
    git commit -m "feat: 更新了 Zsh 别名"
    git push
    ```

---
*由 [yima] 创建和维护*