
# WSL (Windows Subsystem for Linux) 常见配置与问题

## `.wslconfig` 内存自动回收配置 (2025-10-26)

WSL2 的一个常见问题是它会占用大量内存，并且在 Linux 进程结束后不会立即归还给 Windows。可以通过在 `.wslconfig` 文件中配置自动内存回收来解决这个问题。

> **重要提示**：`.wslconfig` 文件必须保存为 **UTF-8** 编码。如果保存为 `UTF-8 with BOM` 编码，WSL 将无法正确读取，导致配置失效。

此配置需要放在 `[experimental]` 部分下。

### 1. 找到或创建 `.wslconfig` 文件

该文件位于你的 Windows 用户目录下，例如 `C:\Users\<YourUsername>\.wslconfig`。如果不存在，请手动创建一个。

### 2. 添加 `autoMemoryReclaim` 配置

`autoMemoryReclaim` 关键字用于启用自动内存回收，它有三种模式：

* `gradual`：（**推荐**）渐进式回收。当系统空闲时，WSL 会缓慢地释放已缓存的内存。这是最平稳的模式，不会在你突然返回工作时造成性能抖动。
* `dropcache`：快速回收。当系统空闲时，立即强制清理 Linux 的文件缓存（Page Cache）来释放内存。这种模式回收得更快、更多，但代价是下次你访问文件时可能会变慢（因为缓存被清空了）。
* `disabled`：（默认）不启用。WSL 会一直占用内存，直到你手动执行 `wsl --shutdown`。

### 3. 配置示例

编辑你的 `.wslconfig` 文件，添加以下内容：

```ini
[experimental]
autoMemoryReclaim=gradual
````

配置完成后，需要以管理员身份打开 PowerShell 并运行 `wsl --shutdown`，然后重新启动 WSL 实例以使配置生效。

*参考资料: [GitHub Issue WSL/issues/10759](https://github.com/microsoft/WSL/issues/10759)*

---

## 网络无法配置问题 (2025-10-16)


在某些情况下，WSL 可能会遇到网络初始化失败的问题，例如启动时报错 `Wsl/Service/CreateInstance/CreateVm/ConfigureNetwork/HNS/Hcs`。

这通常与 Windows 的网络配置（特别是 Hyper-V 虚拟交换机或防火墙设置）有关。

**解决方案参考：**

一个有效的高票解决方案可以在 Stack Overflow 上找到，它通常涉及重置网络相关的 Winsock 和 IP 设置。

  * **Stack Overflow 解决方案**: [WSL networking error Code: Wsl/Service/CreateInstance/CreateVm/ConfigureNetwork...](https://stackoverflow.com/questions/77498634/wsl-networking-error-code-wsl-service-createinstance-createvm-configurenetworki/78092729#78092729)
