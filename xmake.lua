-- RUT workspace: rut_cpp_library + realtime-universal-transport (xmake; third_party via vendored sources, not CMake)
set_project("RUT")
set_version("0.1.0")
set_languages("c++20")
add_rules("mode.debug", "mode.release")
-- Headers use #include "rut_cpp_library/..."
add_includedirs(
    os.scriptdir(),
    path.join(os.scriptdir(), "rut_cpp_library"),
    path.join(os.scriptdir(), "rut_cpp_library/third_party/spdlog/include")
)

add_requires("libevent", {system = false})
add_requires("openssl")
add_requires("fmt", {system = false})

if not is_plat("windows") then
    add_cxflags("-Wall", "-Wextra", "-Wno-unused-function", "-Werror=uninitialized")
    add_cflags("-Wall", "-Wextra", "-Wno-unused-function", "-Werror=uninitialized")
else
    add_cxflags("/W3", "/utf-8")
    add_defines("NOMINMAX", "WIN32_LEAN_AND_MEAN", "_CRT_SECURE_NO_WARNINGS")
end

includes("rut_cpp_library/xmake_targets.lua")
includes("realtime-universal-transport/xmake_targets.lua")

set_default("rut_transceiver_bin")
