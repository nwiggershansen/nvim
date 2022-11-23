local status, jdtls = pcall(require, "jdtls")

if not status then
  return
end

local base_config = require('user.base_config')
local home = os.getenv "HOME"

if vim.fn.has "mac" == 1 then
  CONFIG = "mac"
elseif vim.fn.has "unix" == 1 then
  CONFIG = "linux"
elseif vim.fn.has "win32" == 1 then
  WORKSPACE_PATH = "H:" .. "\\workspace\\"
  CONFIG = "win"
end


local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

if root_dir == "" then
  return
end



-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
-- local workspace_dir = WORKSPACE_PATH .. project_name

JAVA_DAP_ACTIVE = true

local bundles = {}

-- Adding the two bundles for debugging & running tests
if JAVA_DAP_ACTIVE then
  vim.list_extend(bundles, vim.split(vim.fn.glob("H:\\Java\\vscode-java-test\\server\\*jar"), "\n"))
  vim.list_extend(bundles,
    vim.split(vim.fn.glob("H:\\Java\\java-debug\\com.microsoft.java.debug.plugin\\target\\com.microsoft.java.debug.plugin-*.jar")
      , "\n"))
end

local config = {
  on_attach = function()
    base_config.keymap()
  end,
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. base_config.mason_path .. "jdtls/lombok.jar",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    vim.fn.glob(base_config.mason_path .. "jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    base_config.mason_path .. "jdtls/config_" .. CONFIG,
    "-data",
    WORKSPACE_PATH
  },
  root_dir = root_dir,
  settings = {
    java = {
      eclipse = {
        downloadSources = true
      },
      maven = {
        downloadSources = true
      },

    },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*"
      },
      importOrder = {
        "java",
        "javax",
        "com",
        "org"
      }
    },
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },
  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    bundles = bundles
  }
}

jdtls.start_or_attach(config)
