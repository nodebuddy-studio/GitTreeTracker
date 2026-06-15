# Git TreeTracker

A lightweight, zero-overhead Godot 4 editor plugin that displays your active Git branch or **Git Worktree** directly in the top toolbar.

![Godot Engine](https://img.shields.io/badge/Godot-4.3%2B-%23478cbf?logo=godot-engine&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg)

---

## 💡 Why Git TreeTracker?

Traditionally, switching Git branches inside a massive project forces Godot to re-import assets, thrash your disk, and invalidate engine caches. Using **Git Worktrees** avoids this entirely by checking out different branches into separate physical folders side-by-side.

However, because worktrees use a non-standard `.git` text file rather than a folder, full-blown Git integration plugins often crash, freeze the editor, or fail to initialize. 

**Git TreeTracker** fixes this seamlessly. It reads the workspace state **exactly once** when the project opens, bypasses hidden file limits, and displays your active branch right next to your play buttons. 

### Key Features:
* 🌲 **Native Worktree Support:** Accurately parses Git worktree references (`gitdir`).
* 🌿 **Standard Git Fallback:** Works flawlessly in standard single-directory repositories too.
* ⚡ **Zero Editor Performance Impact:** Runs exactly once on project startup. No endless background terminal polling, no editor micro-stutters.
* 🛡️ **Fail-Safe & Lightweight:** Less than 50 lines of robust GDScript with absolute liability safety.

---

## 🛠️ Installation

### Method 1: Via the Godot Asset Library (Recommended)
1. Open your project in Godot.
2. Click on the **AssetLib** tab at the top of the editor.
3. Search for **Git TreeTracker** and click **Download**.
4. In the installation dialog, leave only the `addons/git_tree_tracker/` folder checked and click **Install**.

### Method 2: Manual Installation
1. Download the latest source code zip from the [Releases](https://github.com/your-username/GitTreeTracker/releases) page.
2. Extract the archive and copy the `addons/git_tree_tracker` directory into your project's root `res://addons/` folder.

---

## 🚀 Activation

1. Go to **Project -> Project Settings -> Plugins**.
2. Find **Git TreeTracker** in the list.
3. Check the **Enable** box on the right.
4. Look up at your top menu bar—your active Git branch/worktree name will now be beautifully displayed!

---

## 🔧 How It Works (Under the Hood)

The plugin bypasses Godot's virtual directory restrictions to access absolute operating system paths. When loaded, it checks the physical nature of the `.git` target:

1. **If it's a file (Git Worktree):** It opens the file, reads the `gitdir` routing pointer, and clips out the branch subfolder identity.
2. **If it's a folder (Standard Repo):** It reads the traditional `.git/HEAD` reference file to parse out the local branch target.

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details. It is completely safe for use in both open-source and commercial game production.
