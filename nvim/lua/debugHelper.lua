local dap = require('dap')

local function swift_attach()
dap.run({
    type = 'swift',
    request = 'attach',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
})
end

return {
    attach = swift_attach
}
