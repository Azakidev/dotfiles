{
    inputs,
    pkgs,
    lib,
    ...
}:

{
    environment.variables = {
        RUSTICL_ENABLE = "radeonsi";
    };

    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            mesa.opencl # Enables Rusticl (OpenCL) support
            rocmPackages.clr.icd
        ];
    };

    systemd.tmpfiles.rules = [
        "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];
}
