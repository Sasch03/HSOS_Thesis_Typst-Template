# Setup Guide: Typst for VS Code & VSCodium

This guide provides step-by-step instructions on setting up **Typst** on **Windows** and the most common **Linux distributions**, including recommended extensions for **VS Code** and **VSCodium**.

## Table of Contents

* [1. Installing the Typst CLI](#1-installing-the-typst-cli)

  * [Windows](#windows)

  * [Linux (VSCodium / Flatpak / Native)](#linux-vscodium--flatpak--native)

* [2. Editor Configuration](#2-editor-configuration)

  * [VS Code (Windows / Linux)](#vs-code-windows--linux)

  * [VSCodium (Windows / Linux)](#vscodium-windows--linux)

* [3. Using the Template in the Editor](#3-using-the-template-in-the-editor)

* [4. Troubleshooting & FAQ](#4-troubleshooting--faq)

## 1. Installing the Typst CLI

The Typst CLI is required for local compilation outside of the editor and serves as the foundation for Language Server Protocol (LSP) features.

### Windows

Choose one of the following methods:

#### Option A: Package Managers (Recommended)

* **winget**:

  ```
  winget install --id Typst.Typst
  
  ```

* **Scoop**:

  ```
  scoop install typst
  
  ```

* **Chocolatey**:

  ```
  choco install typst
  
  ```

#### Option B: Manual Download

1. Download the latest release zip archive from [GitHub Releases](https://github.com/typst/typst/releases) (`typst-x86_64-pc-windows-msvc.zip`).

2. Extract `typst.exe` to a folder of your choice (e.g., `C:\Program Files\Typst`).

3. Add this folder path to your system's Environment Variables (`PATH`).

### Linux (VSCodium / Flatpak / Native)

Depending on your Linux distribution, choose the matching package manager:

#### Arch Linux / Manjaro / EndeavourOS

Typst is available in the official repositories:

```
sudo pacman -S typst

```

*(Alternatively via AUR helpers like `yay` or `paru`: `yay -S typst`)*

#### Ubuntu / Debian / Pop!\_OS / Linux Mint

Since official Ubuntu repositories may carry outdated versions, installing via Cargo or downloading the prebuilt binary is recommended:

* **Via Cargo (Rust Package Manager):**

  ```
  sudo apt install cargo
  cargo install --locked typst-cli
  
  ```

* **Via Direct Binary Download (GitHub Releases):**

  ```
  curl -L -O https://github.com/typst/typst/releases/latest/download/typst-x86_64-unknown-linux-musl.tar.xz
  tar -xf typst-x86_64-unknown-linux-musl.tar.xz
  sudo mv typst-x86_64-unknown-linux-musl/typst /usr/local/bin/
  rm -rf typst-x86_64-unknown-linux-musl*
  
  ```

#### Fedora / RHEL

```
sudo dnf install typst

```

#### openSUSE (Tumbleweed / Leap)

```
sudo zypper install typst

```

#### NixOS

```
environment.systemPackages = [
  pkgs.typst
];

```

*(or temporarily via `nix-shell -p typst`)*

## 2. Editor Configuration

For optimal developer experience (syntax highlighting, live preview, auto-completion, PDF export), the **Tinymist** extension (successor to Typst LSP / Typst Preview) is recommended.

### VS Code (Windows / Linux)

1. Open VS Code.

2. Press `Ctrl + Shift + X` to open the Extensions view.

3. Search for **`Tinymist Typst`** (by *myriad-dreamin*).

4. Click **Install**.

### VSCodium (Windows / Linux)

Since VSCodium defaults to Open VSX Registry instead of the VS Code Marketplace:

#### Method A: Open VSX Registry (Native in VSCodium)

1. Open VSCodium.

2. Open the Extensions sidebar (`Ctrl + Shift + X`).

3. Search for **`Tinymist`** and click **Install**.

#### Method B: Manual VSIX Installation (If Open VSX is outdated)

1. Visit the Tinymist release page on GitHub or Open VSX.

2. Download the extension's `.vsix` package.

3. In VSCodium: Click the three dots menu (`...`) in the top-right corner of the Extensions view $\rightarrow$ **Install from VSIX...** and select the downloaded file.

#### Note for Flatpak VSCodium on Linux:

If running VSCodium inside Flatpak, host filesystem isolation might prevent it from detecting system binaries. Grant host access using:

```
flatpak override --user --filesystem=host com.vscodium.codium

```

## 3. Using the Template in the Editor

1. Clone this repository:

   ```
   git clone https://github.com/Sasch03/hsos_typst_thesis_template.git
   cd hsos_typst_thesis_template
   
   ```

2. Open the directory in VS Code / VSCodium.

3. Open the entry file (e.g., `main.typ`).

4. **Start Live Preview:**

   * Press `Ctrl + Shift + P` to open the Command Palette.

   * Type `Tinymist: Open Preview` and press `Enter` (or click the preview icon in the upper-right corner of the editor).

5. Saving the file (`Ctrl + S`) automatically refreshes the preview and updates the generated PDF document.

## 4. Troubleshooting & FAQ

* **Preview pane stays blank or throws errors:**
  Verify that the `typst` executable path is configured correctly under the Tinymist extension settings (`tinymist.typstCliPath`) if it is not automatically resolved in your system `PATH`.

* **Missing fonts:**
  Typst utilizes locally installed system fonts. Ensure that all fonts required by the template (e.g., Arial, Calibri, or university-specific typefaces) are installed on your machine. On Linux, copy user fonts to `~/.local/share/fonts/` and run `fc-cache -f -v`.