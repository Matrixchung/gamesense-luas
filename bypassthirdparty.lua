-- 'Third Party Files Loaded' bypass for Counter-Strike: Global Offensive, by nicole
-- Libraries
local ffi = require "ffi"

-- Game/engine definitions
local vftable_e =
{
    asyncfilesystem =
    {
        get_whitelist_spew_flags = 128
    }
}

-- Filesystem vtable
local g_pAsyncFileSystem = ffi.cast("uintptr_t**", client.create_interface("filesystem_stdio.dll", "VFileSystem017") or error("CAsyncFileSystem (filesystem_stdio.dll) interface could not be found."))
local g_pAsyncFileSystem_vfptr = nil
local g_apVMT = nil

-- Code in middle of functions in the same module. Evaluates to `mov eax, 1; ret`.
local g_pfnReturnsOne = ffi.cast("uintptr_t", client.find_signature("filesystem_stdio.dll", "\xB8\x01\x00\x00\x00\xC3") or error("filesystem_stdio.dll!::(mov eax, 1; ret) could not be found. Signature is outdated."))

local function get_vmt_size(vfptr)
    local nVMTSize = 0

    while tonumber(ffi.cast("uintptr_t", vfptr[nVMTSize])) ~= 0 do
        nVMTSize = nVMTSize + 1
    end

    return nVMTSize
end

local function patch(enable)
    if enable then
        -- Store the original vmt
        g_pAsyncFileSystem_vfptr = g_pAsyncFileSystem[0]

        -- Copy original vmt to our new one
        local nVMTSize = get_vmt_size(g_pAsyncFileSystem_vfptr)
        g_apVMT = ffi.new("uintptr_t[?]", nVMTSize)
        ffi.copy(g_apVMT, g_pAsyncFileSystem_vfptr, ffi.sizeof("uintptr_t") * nVMTSize)

        -- Redirect.....
        g_apVMT[vftable_e.asyncfilesystem.get_whitelist_spew_flags] = g_pfnReturnsOne

        -- Redirect the vmt to mine
        g_pAsyncFileSystem[0] = g_apVMT
    else
        -- Revert to original vmt
        g_pAsyncFileSystem[0] = g_pAsyncFileSystem_vfptr
        g_apVMT = nil
    end
end

local function on_shutdown()
    patch(false)
end

patch(true)

-- Swap vfptr back before unloading script
client.set_event_callback("shutdown", on_shutdown)