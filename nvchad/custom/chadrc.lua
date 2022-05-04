local M = {}

local userPlugins = require "custom.plugins"

M.ui = {
   theme = "chadracula",
}

M.plugins = {
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   status = {
     alpha = true,
   },
   
   user = userPlugins,
}

return M

