{ config, pkgs, stdenv, lib, ... }:

{
        programs.autorandr = {
            enable = true;
            profiles = {
                "default" = {
                    fingerprint = {
                        DisplayPort-1 = "00ffffffffffff001e6d395b3d800000071c010380351e78eaa435a5544f9e27125054a54b80317c4568457c617c8168818081bc953c023a801871382d40582c4500132a2100001e8048801871382d40582c4500132a2100001e000000fd0030901ea022000a202020202020000000fc003234474d3739470a2020202020012902032ff1230907074b010203041112131f903f408301000065030c00100067d85dc401448000681a00000101309000c281808870382a4018203500132a2100001e866f80a07038404030203500132a2100001efe5b80a07038354030203500132a21000018000000ff003830374e54424b30593832390a00000000000000005f";
                        DisplayPort-2 = "00ffffffffffff001e6ddf5b00000000011a010380301b78ea3135a5554ea1260c5054a54b00714f81809500b300a9c0810081c09040023a801871382d40582c4500e00e1100001e000000fd00384b1e5512000a202020202020000000fc004c472046554c4c2048440a2020000000ff000a20202020202020202020202001db020312b14790040301121f1365030c001000023a801871382d40582c4500e00e1100001e2a4480a07038274030203500e00e1100001e011d007251d01e206e285500e00e1100001e8c0ad08a20e02d10103e9600e00e110000180000000000000000000000000000000000000000000000000000000000000000000000000063";
                    };
                    config = {
                        DisplayPort-1 = {
                            enable                      =   true;
                            crtc                        =   0;
                            mode                        =   "1920x1080";
                            pos                         =   "0x0";
                            primary                     =   true;
                            rate                        =   "74.99";
                            x-prop-max_bpc              =   8;
                            x-prop-non_desktop          =   0;
                            x-prop-scaling_mode         =   "None";
                            x-prop-tearfree             =   "auto";
                            x-prop-underscan            =   "off";
                            x-prop-underscan_hborder    =   0;
                            x-prop-underscan_vborder    =   0;

                        };
                        DisplayPort-2 = {
                            enable                      =   true;
                            crtc                        =   1;
                            mode                        =   "1920x1080";
                            pos                         =   "1920x0";
                            rate                        =   "74.97";
                            x-prop-max_bpc              =   8;
                            x-prop-non_desktop          =   0;
                            x-prop-scaling_mode         =   "None";
                            x-prop-tearfree             =   "auto";
                            x-prop-underscan            =   "off";
                            x-prop-underscan_hborder    =   0;
                            x-prop-underscan_vborder    =   0;
                        };
                    };
                };
            };
        };
}
