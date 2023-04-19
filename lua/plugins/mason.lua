local status,mason = pcall(require,'mason')
if not status then
    return
end
local status1,masonlsp = pcall(require,'mason-lspconfig')
if not status1 then
    return
end


mason.setup()
masonlsp.setup{
    ensure_installed = { "marksman" },
    automatic_installation = false,
}
