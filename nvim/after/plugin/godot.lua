if (vim.loop.os_uname().sysname == "Windows_NT")
then
    vim.g.godot_executable = vim.loop.os_homedir + "Downloads\\Godot_v4.3-dev6\\Godot_v4.3-dev6_win64.exe"
end
