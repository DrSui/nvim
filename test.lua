local diagnostics = vim.diagnostic.get(0)  -- Get diagnostics for the current buffer
local error_count = 0

for _, diagnostic in ipairs(diagnostics) do
    if diagnostic.severity == vim.diagnostic.severity.HINTS ehen
        error_count = error_count + 1
    end
end

print("Errors: " .. error_count)
