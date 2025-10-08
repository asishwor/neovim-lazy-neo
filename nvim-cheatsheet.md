# 🚀 Neovim + LazyVim Complete Keyboard Cheatsheet

**Leader Key:** `Space` (most important key!)

---

## 📁 File Operations

| Key | Action |
|-----|--------|
| `Space + e` | Toggle File Explorer (Neo-tree) |
| `Space + E` | Focus File Explorer |
| `Space + f + f` | Find Files (fuzzy search) |
| `Space + f + r` | Recent Files |
| `Space + f + g` | Find in Git Files |
| `Space + Space` | Find Buffers (open files) |
| `Space + /` | Search in Current File |
| `Space + s + g` | Live Grep (search in all files) |
| `Space + s + w` | Search Current Word |
| `:w` | Save File |
| `:wa` | Save All Files |
| `:q` | Quit |
| `:wq` or `:x` | Save and Quit |
| `:q!` | Quit Without Saving |

---

## 🎯 Basic Navigation (Normal Mode)

| Key | Action |
|-----|--------|
| `h` | Move Left |
| `j` | Move Down |
| `k` | Move Up |
| `l` | Move Right |
| `w` | Jump Forward by Word |
| `b` | Jump Backward by Word |
| `e` | Jump to End of Word |
| `0` | Start of Line |
| `^` | First Non-Blank Character |
| `$` | End of Line |
| `gg` | Go to First Line |
| `G` | Go to Last Line |
| `:{number}` | Go to Line Number (e.g., `:42`) |
| `Ctrl + d` | Scroll Down Half Page |
| `Ctrl + u` | Scroll Up Half Page |
| `Ctrl + f` | Scroll Down Full Page |
| `Ctrl + b` | Scroll Up Full Page |
| `%` | Jump to Matching Bracket |
| `{` | Previous Paragraph |
| `}` | Next Paragraph |

---

## ✏️ Editing (Insert Mode)

| Key | Action |
|-----|--------|
| `i` | Insert Before Cursor |
| `a` | Insert After Cursor |
| `I` | Insert at Start of Line |
| `A` | Insert at End of Line |
| `o` | New Line Below |
| `O` | New Line Above |
| `Esc` or `Ctrl + [` | Exit Insert Mode |
| `Ctrl + w` | Delete Word Backwards (in insert) |
| `Ctrl + u` | Delete to Start of Line (in insert) |

---

## 🔪 Cutting, Copying & Pasting

| Key | Action |
|-----|--------|
| `yy` | Yank (Copy) Line |
| `y{motion}` | Yank with Motion (e.g., `yw` yank word) |
| `yiw` | Yank Inner Word |
| `yaw` | Yank Around Word |
| `y$` | Yank to End of Line |
| `dd` | Delete (Cut) Line |
| `d{motion}` | Delete with Motion |
| `diw` | Delete Inner Word |
| `daw` | Delete Around Word |
| `d$` or `D` | Delete to End of Line |
| `x` | Delete Character Under Cursor |
| `p` | Paste After Cursor |
| `P` | Paste Before Cursor |
| `u` | Undo |
| `Ctrl + r` | Redo |
| `.` | Repeat Last Command |

---

## 🔍 Search & Replace

| Key | Action |
|-----|--------|
| `/pattern` | Search Forward |
| `?pattern` | Search Backward |
| `n` | Next Search Result |
| `N` | Previous Search Result |
| `*` | Search Word Under Cursor (forward) |
| `#` | Search Word Under Cursor (backward) |
| `:s/old/new/` | Replace First on Line |
| `:s/old/new/g` | Replace All on Line |
| `:%s/old/new/g` | Replace All in File |
| `:%s/old/new/gc` | Replace All with Confirmation |
| `:noh` | Clear Search Highlighting |

---

## 📋 Buffer Management (Open Files)

| Key | Action |
|-----|--------|
| `Space + b + b` | List Buffers |
| `Space + b + d` | Delete Current Buffer |
| `Space + b + n` | Next Buffer |
| `Space + b + p` | Previous Buffer |
| `[b` | Previous Buffer (LazyVim) |
| `]b` | Next Buffer (LazyVim) |
| `Ctrl + 6` or `Ctrl + ^` | Toggle Last Buffer |
| `:ls` | List All Buffers |

---

## 🪟 Window/Split Management

| Key | Action |
|-----|--------|
| `Space + w + s` or `:split` | Horizontal Split |
| `Space + w + v` or `:vsplit` | Vertical Split |
| `Ctrl + w + h` | Move to Left Window |
| `Ctrl + w + j` | Move to Bottom Window |
| `Ctrl + w + k` | Move to Top Window |
| `Ctrl + w + l` | Move to Right Window |
| `Ctrl + w + w` | Cycle Through Windows |
| `Ctrl + w + q` | Close Current Window |
| `Ctrl + w + =` | Equal Window Sizes |
| `Ctrl + w + >` | Increase Width |
| `Ctrl + w + <` | Decrease Width |
| `Ctrl + w + +` | Increase Height |
| `Ctrl + w + -` | Decrease Height |
| `Space + w + d` | Delete Window |

---

## 📑 Tab Management

| Key | Action |
|-----|--------|
| `:tabnew` | New Tab |
| `Space + Tab + Tab` | New Tab |
| `gt` or `]t` | Next Tab |
| `gT` or `[t` | Previous Tab |
| `:tabclose` | Close Tab |
| `1gt` | Go to Tab 1 |
| `2gt` | Go to Tab 2 (etc.) |

---

## 🌲 File Explorer (Neo-tree)

| Key (in Neo-tree) | Action |
|-------------------|--------|
| `a` | Add File/Directory |
| `d` | Delete |
| `r` | Rename |
| `c` | Copy |
| `x` | Cut |
| `p` | Paste |
| `y` | Copy Path to Clipboard |
| `Y` | Copy Relative Path |
| `Enter` | Open File |
| `o` | Open File |
| `s` | Open in Vertical Split |
| `S` | Open in Horizontal Split |
| `t` | Open in New Tab |
| `?` | Show Help |
| `q` | Close Neo-tree |
| `H` | Toggle Hidden Files |
| `R` | Refresh |

---

## 🔧 Code Actions & LSP (Language Server)

| Key | Action |
|-----|--------|
| `g + d` | Go to Definition |
| `g + D` | Go to Declaration |
| `g + r` | Go to References |
| `g + I` | Go to Implementation |
| `K` | Show Hover Documentation |
| `Space + c + a` | Code Actions |
| `Space + c + r` | Rename Symbol |
| `Space + c + f` | Format Document |
| `[d` | Previous Diagnostic |
| `]d` | Next Diagnostic |
| `Space + x + x` | Trouble (all diagnostics) |
| `Space + x + d` | Document Diagnostics |
| `Space + c + d` | Line Diagnostics |

---

## 🎨 Visual Mode (Selection)

| Key | Action |
|-----|--------|
| `v` | Enter Visual Mode (character) |
| `V` | Enter Visual Line Mode |
| `Ctrl + v` | Enter Visual Block Mode |
| `o` | Move to Other End of Selection |
| `y` | Yank Selection |
| `d` | Delete Selection |
| `c` | Change Selection (delete and insert) |
| `>` | Indent Right |
| `<` | Indent Left |
| `=` | Auto-Indent |
| `~` | Toggle Case |
| `u` | Lowercase |
| `U` | Uppercase |
| `Esc` | Exit Visual Mode |

---

## 📝 Multi-Cursor / Visual Block

| Key | Action |
|-----|--------|
| `Ctrl + v` | Enter Visual Block Mode |
| `I` | Insert at Start of Block |
| `A` | Append at End of Block |
| `c` | Change Block |
| `Esc Esc` | Apply to All Lines |

---

## 🔁 Macros (Record & Replay)

| Key | Action |
|-----|--------|
| `q{letter}` | Start Recording Macro (e.g., `qa`) |
| `q` | Stop Recording |
| `@{letter}` | Play Macro (e.g., `@a`) |
| `@@` | Replay Last Macro |
| `{number}@{letter}` | Replay Macro N Times (e.g., `10@a`) |

---

## 💡 LazyVim Specific

| Key | Action |
|-----|--------|
| `Space + l` | Lazy (Plugin Manager) |
| `Space + l + i` | Install Plugins |
| `Space + l + u` | Update Plugins |
| `Space + l + s` | Sync Plugins |
| `Space + l + x` | Clean Unused Plugins |
| `Space + c + m` | Mason (LSP Installer) |
| `Space + u + c` | Colorscheme Picker |
| `Space + u + C` | Pick Colorscheme (Telescope) |

---

## 🎯 Telescope (Fuzzy Finder)

| Key (in Telescope) | Action |
|--------------------|--------|
| `Ctrl + n` | Next Item |
| `Ctrl + p` | Previous Item |
| `Ctrl + c` | Close Telescope |
| `Ctrl + u` | Scroll Preview Up |
| `Ctrl + d` | Scroll Preview Down |
| `Enter` | Select Item |
| `Tab` | Toggle Selection |
| `Ctrl + q` | Send to Quickfix |
| `?` | Show Mappings Help |

---

## 🚀 Git Integration (LazyGit)

| Key | Action |
|-----|--------|
| `Space + g + g` | Open LazyGit |
| `Space + g + b` | Git Blame Line |
| `Space + g + f` | Git File History |
| `]h` | Next Git Hunk |
| `[h` | Previous Git Hunk |
| `Space + g + h + s` | Stage Hunk |
| `Space + g + h + r` | Reset Hunk |
| `Space + g + h + p` | Preview Hunk |

### In LazyGit Interface:
| Key | Action |
|-----|--------|
| `Space` | Stage/Unstage File |
| `a` | Stage All |
| `c` | Commit |
| `P` | Push |
| `p` | Pull |
| `?` | Help |
| `q` | Quit LazyGit |

---

## 🐛 Debugging (if configured)

| Key | Action |
|-----|--------|
| `Space + d + b` | Toggle Breakpoint |
| `Space + d + c` | Continue |
| `Space + d + i` | Step Into |
| `Space + d + o` | Step Over |
| `Space + d + O` | Step Out |
| `Space + d + r` | Toggle REPL |
| `Space + d + u` | Toggle UI |

---

## ⚡ Quick Actions

| Key | Action |
|-----|--------|
| `Space + k` | Open Keymap Help |
| `Space + ?` | Search Keymaps |
| `:checkhealth` | Check Neovim Health |
| `:Mason` | Open Mason (LSP/Tool Manager) |
| `:Lazy` | Open Plugin Manager |
| `:messages` | Show Messages |
| `Space + n` | Toggle Line Numbers |
| `Space + u + w` | Toggle Word Wrap |
| `Space + u + s` | Toggle Spelling |

---

## 🎓 Pro Tips

### Text Objects
Combine with `d`, `c`, `y`, `v`:
- `iw` - inner word
- `aw` - around word  
- `is` - inner sentence
- `ip` - inner paragraph
- `i"` - inside quotes
- `i(` - inside parentheses
- `it` - inside XML/HTML tags

**Examples:**
- `diw` - delete inner word
- `ci"` - change text inside quotes
- `yip` - yank paragraph
- `vit` - select inside HTML tag

### Jump Lists
- `Ctrl + o` - Jump back
- `Ctrl + i` - Jump forward

### Marks
- `m{letter}` - Set mark (e.g., `ma`)
- `'{letter}` - Jump to mark (e.g., `'a`)
- `:marks` - List all marks

### Folding
- `za` - Toggle fold
- `zo` - Open fold
- `zc` - Close fold
- `zR` - Open all folds
- `zM` - Close all folds

---

## 🔥 My Daily Workflow

1. **Open Neovim:** `nvim`
2. **Find file:** `Space + f + f`
3. **Toggle explorer:** `Space + e`
4. **Search in project:** `Space + s + g`
5. **Go to definition:** `g + d`
6. **Show documentation:** `K`
7. **Code actions:** `Space + c + a`
8. **Git status:** `Space + g + g`
9. **Save all:** `:wa`

---

## 🎯 Practice Challenges

1. **Delete 3 words forward:** `d3w`
2. **Change text inside parentheses:** `ci(`
3. **Yank 5 lines down:** `y5j`
4. **Indent 3 lines:** `V2j>`
5. **Search and replace in file:** `:%s/old/new/g`
6. **Jump to line 100:** `:100` or `100gg`
7. **Open file in vertical split:** `Space + w + v` then `Space + f + f`

---

## 📖 Learn More

- `:Tutor` - Built-in Neovim tutorial
- `:help {topic}` - Built-in help (e.g., `:help motions`)
- `:help which-key` - See all keybindings

**Remember:** Practice makes perfect! Start with basics and gradually add more commands to your muscle memory. 🚀

---

**Print this and keep it near your workspace!** 🖨️
