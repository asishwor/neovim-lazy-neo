return {
  -- Swift language support
  {
    "keith/swift.vim",
    ft = "swift",
    config = function()
      vim.g.swift_format_command = "swift-format"
      vim.g.swift_format_on_save = 1
    end,
  },

  -- iOS development tools
  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    ft = { "swift", "objc" },
    config = function()
      require("xcodebuild").setup({
        -- Automatically show code coverage report after running tests
        show_coverage = true,
        -- The command that will be executed to run tests
        test_command = "xcodebuild test",
        -- The command that will be executed to build the project  
        build_command = "xcodebuild build",
        -- Configuration for code coverage
        coverage = {
          file_pattern = "*.swift",
        },
      })
    end,
  },

  -- Swift LSP configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {
          cmd = { "xcrun", "sourcekit-lsp" },
          filetypes = { "swift", "objc", "objcpp" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("Package.swift", ".git", "*.xcodeproj", "*.xcworkspace")(fname)
          end,
          settings = {
            sourcekitlsp = {
              -- Enable code completion
              completion = {
                maxResults = 20,
              },
              -- Enable diagnostics
              diagnostics = {
                enable = true,
              },
            },
          },
        },
      },
    },
  },

  -- TreeSitter Swift support
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "swift", "objc" })
      end
    end,
  },

  -- Swift formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        swift = { "swift_format" },
      },
      formatters = {
        swift_format = {
          command = "swift-format",
          args = { "--configuration", ".swift-format", "$FILENAME" },
          stdin = true,
        },
      },
    },
  },

  -- iOS Simulator integration (macOS only)
  {
    "xbase-lab/xbase",
    build = "make install",
    ft = { "swift", "objc" },
    cond = vim.fn.has("mac") == 1, -- Only load on macOS
    config = function()
      require("xbase").setup({
        -- Automatically start simulator
        auto_start_simulator = true,
        -- Log level
        log_level = vim.log.levels.INFO,
        -- Watch build logs
        watch_build_logs = true,
      })
    end,
  },

  -- Plist file support
  {
    "darfink/vim-plist",
    ft = "plist",
  },

  -- Objective-C support
  {
    "b4winckler/vim-objc",
    ft = { "objc", "objcpp" },
  },

  -- CocoaPods support
  {
    "gfontenot/vim-xcode",
    ft = { "swift", "objc" },
    config = function()
      vim.g.xcode_runner_xcpretty = 1
      vim.g.xcode_xcpretty_testing_flags = "--color"
    end,
  },

  -- Key mappings for iOS development
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>x"] = { name = "+xcode" },
      },
    },
  },

  -- Custom iOS development commands
  {
    "nvim-lua/plenary.nvim",
    config = function()
      -- Custom commands for iOS development
      vim.api.nvim_create_user_command("XcodeRun", function()
        vim.cmd("!xcodebuild -scheme %:t:r -destination 'platform=iOS Simulator,name=iPhone 14' build")
      end, { desc = "Build and run iOS app in simulator" })

      vim.api.nvim_create_user_command("XcodeTest", function()
        vim.cmd("!xcodebuild test -scheme %:t:r -destination 'platform=iOS Simulator,name=iPhone 14'")
      end, { desc = "Run iOS tests in simulator" })

      vim.api.nvim_create_user_command("XcodeClean", function()
        vim.cmd("!xcodebuild clean -scheme %:t:r")
      end, { desc = "Clean Xcode project" })

      vim.api.nvim_create_user_command("SimulatorOpen", function()
        vim.cmd("!open -a Simulator")
      end, { desc = "Open iOS Simulator" })

      vim.api.nvim_create_user_command("XcodeProject", function()
        local project_files = vim.fn.glob("*.xcodeproj", false, true)
        local workspace_files = vim.fn.glob("*.xcworkspace", false, true)
        
        if #workspace_files > 0 then
          vim.cmd("!open " .. workspace_files[1])
        elseif #project_files > 0 then
          vim.cmd("!open " .. project_files[1])
        else
          vim.notify("No Xcode project or workspace found", vim.log.levels.WARN)
        end
      end, { desc = "Open Xcode project" })
    end,
  },
}

-- Key mappings for iOS development (only on macOS)
if vim.fn.has("mac") == 1 then
  vim.keymap.set("n", "<leader>xr", ":XcodeRun<CR>", { desc = "Build and run iOS app" })
  vim.keymap.set("n", "<leader>xt", ":XcodeTest<CR>", { desc = "Run iOS tests" })
  vim.keymap.set("n", "<leader>xc", ":XcodeClean<CR>", { desc = "Clean Xcode project" })
  vim.keymap.set("n", "<leader>xs", ":SimulatorOpen<CR>", { desc = "Open iOS Simulator" })
  vim.keymap.set("n", "<leader>xo", ":XcodeProject<CR>", { desc = "Open in Xcode" })
end