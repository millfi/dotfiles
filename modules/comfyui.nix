{ config, lib, pkgs, comfyui-src, ... }:

let
  python = pkgs.python312;
  py = python.pkgs;
  pythonSitePackages = python.sitePackages;
  torch = py.torchWithRocm;
  torchvision = py.torchvision.override {
    inherit torch;
  };
  torchaudio = py.torchaudio.override {
    inherit torch;
    rocmSupport = true;
    cudaSupport = false;
  };

  comfyuiFrontendPackage = py.buildPythonPackage rec {
    pname = "comfyui-frontend-package";
    version = "1.37.11";
    format = "wheel";

    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/31/0d/adb224e976d677bf1f53330a1cd34f704cefe6a32bbcd2c8d960e49db73d/comfyui_frontend_package-1.37.11-py3-none-any.whl";
      hash = "sha256-b+0TnslCsFQwVZ+o5FtYQCmz7WI4mSEuxv+1sJzcBCw=";
    };

    doCheck = false;
  };

  comfyKitchen = py.buildPythonPackage rec {
    pname = "comfy-kitchen";
    version = "0.2.8";
    format = "wheel";

    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/46/b0/64c3e0656db822cb4f7dbc928d6a13cf2cad861cc178e6386114634e355b/comfy_kitchen-0.2.8-py3-none-any.whl";
      hash = "sha256-CzIpks8Wgevj1BOseVDznlzEJVBcE8740IUnzoL+XjI=";
    };

    dontCheckRuntimeDeps = true;
    doCheck = false;
  };

  spandrel = py.buildPythonPackage rec {
    pname = "spandrel";
    version = "0.4.2";
    format = "wheel";

    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/74/31/411ea965835534c43d4b98d451968354876e0e867ea1fd42669e4cca0732/spandrel-0.4.2-py3-none-any.whl";
      hash = "sha256-bJPj7L6w5Uj9LfRaYFRys0wWFCh8VrUbszze965SNbU=";
    };

    dontCheckRuntimeDeps = true;
    doCheck = false;
  };

  workflowTemplates = py.buildPythonPackage rec {
    pname = "comfyui-workflow-templates";
    version = "0.9.21";
    format = "wheel";

    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/3f/26/080d3fb30bea9f91b361d640324ef94cc4ed378616f0427704323b707ac5/comfyui_workflow_templates-0.9.21-py3-none-any.whl";
      hash = "sha256-qC10QM9IZG6Xmedde4ysYBRl89M1p+eLnAMyIqZmya0=";
    };

    dontCheckRuntimeDeps = true;
    doCheck = false;
  };

  workflowTemplatesCore = py.buildPythonPackage rec {
    pname = "comfyui-workflow-templates-core";
    version = "0.3.168";
    format = "wheel";

    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/8d/05/c8f8419d31d683263bfdf51295ab79e50dfc5434d6ebf7a4c8fbcb9fbe69/comfyui_workflow_templates_core-0.3.168-py3-none-any.whl";
      hash = "sha256-viY0lsCIXGIY0yeLqPycGmpmsePwwAfgdQY8gpW6A+w=";
    };

    dontCheckRuntimeDeps = true;
    doCheck = false;
  };

  workflowTemplatesMediaApi = py.buildPythonPackage rec {
    pname = "comfyui-workflow-templates-media-api";
    version = "0.3.64";
    format = "wheel";

    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/d5/f6/47c7e4413bb5e30e3a2788b742ce7f6f6bc162a0ab805b8a7f7962ca8860/comfyui_workflow_templates_media_api-0.3.64-py3-none-any.whl";
      hash = "sha256-6p4Or4rbuct5B3SDQhoyCGoHGYMvyA7czoTiPxoc9Hc=";
    };

    dontCheckRuntimeDeps = true;
    doCheck = false;
  };

  workflowTemplatesMediaVideo = py.buildPythonPackage rec {
    pname = "comfyui-workflow-templates-media-video";
    version = "0.3.60";
    format = "wheel";

    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/6d/a0/6e915c086938572c6e1ae7f1dcffc3b3b44f9898e9a19f4aa0c66f6c977b/comfyui_workflow_templates_media_video-0.3.60-py3-none-any.whl";
      hash = "sha256-thoDH1amsg5yfg4eZtlxXSo7ogopctM/SPlraIZP990=";
    };

    dontCheckRuntimeDeps = true;
    doCheck = false;
  };

  workflowTemplatesMediaImage = py.buildPythonPackage rec {
    pname = "comfyui-workflow-templates-media-image";
    version = "0.3.104";
    format = "wheel";

    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/e7/da/200a361d7d6880549c76b0e22bdd03dfea9315a0d920b1b99d15da01aa6e/comfyui_workflow_templates_media_image-0.3.104-py3-none-any.whl";
      hash = "sha256-GMjU/48YtZcSZYmP8S97+JCJhgh06jX+WJgkbK8taLw=";
    };

    dontCheckRuntimeDeps = true;
    doCheck = false;
  };

  workflowTemplatesMediaOther = py.buildPythonPackage rec {
    pname = "comfyui-workflow-templates-media-other";
    version = "0.3.141";
    format = "wheel";

    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/a5/b3/179745959152231283dcae2c4db455c7a07d83b51e933ff193938b8e44e8/comfyui_workflow_templates_media_other-0.3.141-py3-none-any.whl";
      hash = "sha256-lagRSSPtGVZ3Iq6ecQb6pgFlD9am0bPGKvgaksaSiAQ=";
    };

    dontCheckRuntimeDeps = true;
    doCheck = false;
  };

  embeddedDocs = py.buildPythonPackage rec {
    pname = "comfyui-embedded-docs";
    version = "0.4.3";
    format = "wheel";

    src = pkgs.fetchurl {
      url = "https://files.pythonhosted.org/packages/e9/3d/f77a91b500e7005b995ab922c03d9f87ff3f7955e9ab13b6e334c14a7229/comfyui_embedded_docs-0.4.3-py3-none-any.whl";
      hash = "sha256-2mBmnSV566hv0ozutQIrkC7Yov1QxmeoYCWTZyzFRKk=";
    };

    dontCheckRuntimeDeps = true;
    doCheck = false;
  };

  comfyuiManagerTarball = pkgs.fetchurl {
    url = "https://codeload.github.com/Comfy-Org/ComfyUI-Manager/tar.gz/a801227663b5a34f93756daa2c51b8114aad1e6e";
    sha256 = "07r6pcwn7cjlyiq4a3isi2ggz656i2cma292zfif84rjarpy5g9j";
  };

  comfyuiManager = pkgs.stdenvNoCC.mkDerivation {
    pname = "comfyui-manager";
    version = "3.39.2-a801227";
    src = comfyuiManagerTarball;
    dontBuild = true;
    dontUnpack = true;

    installPhase = ''
      runHook preInstall
      mkdir -p "$out"
      temp_dir="$(mktemp -d)"
      tar -xzf "$src" -C "$temp_dir" --strip-components=1
      cp -r "$temp_dir" "$out/ComfyUI-Manager"
      runHook postInstall
    '';
  };

  comfyAimdoStub = pkgs.runCommand "comfy-aimdo-stub" {} ''
    mkdir -p "$out/${pythonSitePackages}/comfy_aimdo"

    cat > "$out/${pythonSitePackages}/comfy_aimdo/__init__.py" <<'EOF'
    from . import control, model_vbar, torch
    EOF

    cat > "$out/${pythonSitePackages}/comfy_aimdo/control.py" <<'EOF'
    def init():
        return False

    def init_device(_device_index):
        return False

    def set_log_debug():
        pass

    def set_log_info():
        pass

    def set_log_warning():
        pass

    def set_log_error():
        pass

    def set_log_critical():
        pass

    def get_total_vram_usage():
        return 0
    EOF

    cat > "$out/${pythonSitePackages}/comfy_aimdo/torch.py" <<'EOF'
    def get_torch_allocator():
        return None

    def aimdo_to_tensor(value, _device):
        return value
    EOF

    cat > "$out/${pythonSitePackages}/comfy_aimdo/model_vbar.py" <<'EOF'
    class ModelVBAR:
        def __init__(self, *_args, **_kwargs):
            self._args = _args
            self._kwargs = _kwargs

    def vbar_fault(_value):
        return None

    def vbar_signature_compare(_lhs, _rhs):
        return False

    def vbar_unpin(_value):
        pass
    EOF
  '';

  comfyuiPythonPackages = [
    torch
    torchvision
    torchaudio
    py.numpy
    py.einops
    py.torchsde
    py.transformers
    py.tokenizers
    py.sentencepiece
    py.safetensors
    py.aiohttp
    py.yarl
    py.pyyaml
    py.pillow
    py.scipy
    py.tqdm
    py.psutil
    py.alembic
    py.sqlalchemy
    py.av
    py.requests
    py.kornia
    py.pydantic
    py.pydantic-settings
    py.gitpython
    py.pygithub
    py."matrix-nio"
    py.aria2p
    py.toml
    py.chardet
    comfyuiFrontendPackage
    comfyKitchen
    spandrel
    workflowTemplatesCore
    workflowTemplatesMediaApi
    workflowTemplatesMediaVideo
    workflowTemplatesMediaImage
    workflowTemplatesMediaOther
    workflowTemplates
    embeddedDocs
  ];

  comfyuiPython = python.buildEnv.override {
    extraLibs = comfyuiPythonPackages;
    ignoreCollisions = true;
  };

  comfyuiRocmPackages = with pkgs.rocmPackages; [
    clr
    clr.icd
    rocm-runtime
    rocblas
    hipblas
    hipblaslt
    miopen
    rocminfo
    rocm-smi
  ];

  comfyuiRocmPath = pkgs.symlinkJoin {
    name = "comfyui-rocm-path";
    paths = comfyuiRocmPackages;
  };

  comfyuiRocmLibPath = lib.makeLibraryPath comfyuiRocmPackages;

  comfyuiLauncher = pkgs.writeShellScript "comfyui" ''
    set -euo pipefail

    self_dir="$(cd "$(dirname "$0")/.." && pwd)"

    export ROCM_PATH="${comfyuiRocmPath}"
    export HIP_PATH="${comfyuiRocmPath}"
    export HSA_PATH="${pkgs.rocmPackages.rocm-runtime}"
    export LD_LIBRARY_PATH="${comfyuiRocmLibPath}''${LD_LIBRARY_PATH:+:}''${LD_LIBRARY_PATH-}"
    export PYTHONPATH="${comfyAimdoStub}/${pythonSitePackages}''${PYTHONPATH:+:}''${PYTHONPATH-}"
    export PYTHONNOUSERSITE=1
    export PYTORCH_HIP_ALLOC_CONF="''${PYTORCH_HIP_ALLOC_CONF:-expandable_segments:True}"

    exec "${comfyuiPython}/bin/python" "$self_dir/share/comfyui/src/main.py" \
      --front-end-root "${comfyuiFrontendPackage}/${pythonSitePackages}/comfyui_frontend_package/static" \
      "$@"
  '';

  comfyuiPackage = pkgs.stdenvNoCC.mkDerivation rec {
    pname = "comfyui";
    version = "0.12.3";

    src = comfyui-src;

    dontBuild = true;

    installPhase = ''
      runHook preInstall

      mkdir -p "$out/share/comfyui"
      cp -r . "$out/share/comfyui/src"

      out="$out" ${pkgs.python3}/bin/python - <<'PY'
import os
from pathlib import Path

main_py = Path(os.environ["out"]) / "share/comfyui/src/main.py"
text = main_py.read_text()
old = """import comfy.memory_management
import comfy.model_patcher

import comfy_aimdo.control
import comfy_aimdo.torch

if enables_dynamic_vram():
    if comfy.model_management.torch_version_numeric < (2, 8):
        logging.warning(\"Unsupported Pytorch detected. DynamicVRAM support requires Pytorch version 2.8 or later. Falling back to legacy ModelPatcher. VRAM estimates may be unreliable especially on Windows\")
        comfy.memory_management.aimdo_allocator = None
    elif comfy_aimdo.control.init_device(comfy.model_management.get_torch_device().index):
        if args.verbose == 'DEBUG':
            comfy_aimdo.control.set_log_debug()
        elif args.verbose == 'CRITICAL':
            comfy_aimdo.control.set_log_critical()
        elif args.verbose == 'ERROR':
            comfy_aimdo.control.set_log_error()
        elif args.verbose == 'WARNING':
            comfy_aimdo.control.set_log_warning()
        else: #INFO
            comfy_aimdo.control.set_log_info()

        comfy.model_patcher.CoreModelPatcher = comfy.model_patcher.ModelPatcherDynamic
        comfy.memory_management.aimdo_allocator = comfy_aimdo.torch.get_torch_allocator()
        logging.info(\"DynamicVRAM support detected and enabled\")
    else:
        logging.warning(\"No working comfy-aimdo install detected. DynamicVRAM support disabled. Falling back to legacy ModelPatcher. VRAM estimates may be unreliable especially on Windows\")
        comfy.memory_management.aimdo_allocator = None
"""
new = """import comfy.memory_management
import comfy.model_patcher

import torch

comfy_aimdo = None

if not torch.version.hip:
    try:
        import comfy_aimdo.control
        import comfy_aimdo.torch
    except ModuleNotFoundError:
        logging.warning(\"comfy-aimdo is not installed. DynamicVRAM support disabled.\")

if enables_dynamic_vram():
    if comfy.model_management.torch_version_numeric < (2, 8):
        logging.warning(\"Unsupported Pytorch detected. DynamicVRAM support requires Pytorch version 2.8 or later. Falling back to legacy ModelPatcher. VRAM estimates may be unreliable especially on Windows\")
        comfy.memory_management.aimdo_allocator = None
    elif torch.version.hip:
        logging.info(\"ROCm detected. DynamicVRAM support via comfy-aimdo is disabled on HIP.\")
        comfy.memory_management.aimdo_allocator = None
    elif comfy_aimdo is not None and comfy_aimdo.control.init_device(comfy.model_management.get_torch_device().index):
        if args.verbose == 'DEBUG':
            comfy_aimdo.control.set_log_debug()
        elif args.verbose == 'CRITICAL':
            comfy_aimdo.control.set_log_critical()
        elif args.verbose == 'ERROR':
            comfy_aimdo.control.set_log_error()
        elif args.verbose == 'WARNING':
            comfy_aimdo.control.set_log_warning()
        else: #INFO
            comfy_aimdo.control.set_log_info()

        comfy.model_patcher.CoreModelPatcher = comfy.model_patcher.ModelPatcherDynamic
        comfy.memory_management.aimdo_allocator = comfy_aimdo.torch.get_torch_allocator()
        logging.info(\"DynamicVRAM support detected and enabled\")
    else:
        logging.warning(\"No working comfy-aimdo install detected. DynamicVRAM support disabled. Falling back to legacy ModelPatcher. VRAM estimates may be unreliable especially on Windows\")
        comfy.memory_management.aimdo_allocator = None
"""

if old not in text:
    raise SystemExit("failed to locate comfy_aimdo block in main.py")

main_py.write_text(text.replace(old, new, 1))
PY

      mkdir -p "$out/bin"
      install -m 0555 "${comfyuiLauncher}" "$out/bin/comfyui"

      runHook postInstall
    '';
  };

  comfyuiBaseDir = "${config.home.homeDirectory}/.local/share/comfyui";
  comfyuiModelsDir = "${comfyuiBaseDir}/models";
  comfyuiDatabaseUrl = "sqlite:///${comfyuiBaseDir}/user/comfyui.db";
in
{
  home.packages = [
    comfyuiPackage
    comfyuiPython
  ];

  home.activation.comfyuiDataDirs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "${comfyuiBaseDir}"
    mkdir -p "${comfyuiBaseDir}/custom_nodes"
    mkdir -p "${comfyuiBaseDir}/input"
    mkdir -p "${comfyuiBaseDir}/output"
    mkdir -p "${comfyuiBaseDir}/temp"
    mkdir -p "${comfyuiBaseDir}/user/default"
    mkdir -p "${comfyuiBaseDir}/user/default/ComfyUI-Manager"
    mkdir -p "${comfyuiModelsDir}/checkpoints"
    mkdir -p "${comfyuiModelsDir}/clip_vision"
    mkdir -p "${comfyuiModelsDir}/configs"
    mkdir -p "${comfyuiModelsDir}/controlnet"
    mkdir -p "${comfyuiModelsDir}/diffusers"
    mkdir -p "${comfyuiModelsDir}/diffusion_models"
    mkdir -p "${comfyuiModelsDir}/embeddings"
    mkdir -p "${comfyuiModelsDir}/loras"
    mkdir -p "${comfyuiModelsDir}/text_encoders"
    mkdir -p "${comfyuiModelsDir}/upscale_models"
    mkdir -p "${comfyuiModelsDir}/vae"
    mkdir -p "${comfyuiModelsDir}/vae_approx"
  '';

  home.file.".local/share/comfyui/README.md".text = ''
    ComfyUI on NixOS (RX 6800 / ROCm)

    Binary:
      comfyui

    Mutable data:
      ${comfyuiBaseDir}

    Important directories:
      ${comfyuiModelsDir}/checkpoints
      ${comfyuiModelsDir}/loras
      ${comfyuiModelsDir}/controlnet
      ${comfyuiModelsDir}/upscale_models

    Manual run:
      comfyui --enable-manager --listen 127.0.0.1 --port 8188 --base-directory ${comfyuiBaseDir} --database-url ${comfyuiDatabaseUrl} --disable-auto-launch

    User service:
      systemctl --user status comfyui.service
      systemctl --user restart comfyui.service

    Notes:
    - ComfyUI source is pinned declaratively.
    - Python dependencies are built declaratively with torch ROCm.
    - Models and custom nodes remain mutable user data outside the Nix store.
  '';

  home.file.".local/share/comfyui/custom_nodes/ComfyUI-Manager".source = "${comfyuiManager}/ComfyUI-Manager";

  systemd.user.services.comfyui = {
    Unit = {
      Description = "ComfyUI";
      After = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${comfyuiPackage}/bin/comfyui --enable-manager --listen 127.0.0.1 --port 8188 --base-directory ${comfyuiBaseDir} --database-url ${comfyuiDatabaseUrl} --disable-auto-launch";
      WorkingDirectory = comfyuiBaseDir;
      Environment = "PATH=${lib.makeBinPath [ pkgs.uv pkgs.git pkgs.coreutils pkgs.bash ]}:/run/current-system/sw/bin";
      Restart = "on-failure";
      RestartSec = 5;
    };

    Install.WantedBy = [ "default.target" ];
  };
}
