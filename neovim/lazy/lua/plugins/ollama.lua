return {
  'nomnivore/ollama.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  cmd = { 'Ollama', 'OllamaModel', 'OllamaServe', 'OllamaServeStop' },
  keys = {
    -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
    {
      '<Leader>oo',
      ':<c-u>lua require("ollama").prompt()<cr>',
      desc = 'ollama prompt',
      mode = { 'n', 'v' },
    },
    {
      '<leader>og',
      ':<c-u>lua require("ollama").prompt("Generate_Code")<cr>',
      desc = 'ollama Generate Code',
      mode = { 'n', 'v' },
    },
    {
      '<leader>oe',
      ':<c-u>lua require("ollama").prompt("Explain_Code")<cr>',
      desc = 'ollama Explain Code',
      mode = { 'n', 'v' },
    },
  },

  opts = {
    model = 'llama3',
    serve = {
      on_start = true,
    },
  }
}
