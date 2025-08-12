
#!/bin/bash
echo "Checking for Wan 2.2 models..."
if [ ! -f "models/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors" ]; then
    echo "Downloading Wan 2.2 models..."
    wget -P models/diffusion_models/ https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors
    wget -P models/diffusion_models/ https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors
    wget -P models/vae/ https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/vae/wan_2.1_vae.safetensors
    wget -P models/text_encoders/ https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/text_encoders/umt5_xxl_fp16.safetensors
    wget -P models/loras/ https://huggingface.co/lightx2v/Wan2.2-Lightning/resolve/main/Wan2.2-I2V-A14B-4steps-lora-rank64-Seko-V1/high_noise_model.safetensors
    wget -P models/loras/ https://huggingface.co/lightx2v/Wan2.2-Lightning/resolve/main/Wan2.2-I2V-A14B-4steps-lora-rank64-Seko-V1/low_noise_model.safetensors
    echo "Model download complete."
else
    echo "Models already exist, skipping download."
fi

echo "Installing custom nodes..."
mkdir -p custom_nodes
declare -a nodes=(
    "ComfyUI-Manager|https://github.com/Comfy-Org/ComfyUI-Manager.git"
    "was-node-suite-comfyui|https://github.com/WASasquatch/was-node-suite-comfyui.git"
    "ComfyUI-Easy-Use|https://github.com/yolain/ComfyUI-Easy-Use.git"
    "comfyui_controlnet_aux|https://github.com/Fannovel16/comfyui_controlnet_aux.git"
    "ComfyUI_Comfyroll_CustomNodes|https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git"
    "ComfyUI-Crystools|https://github.com/crystian/ComfyUI-Crystools.git"
    "rgthree-comfy|https://github.com/rgthree/rgthree-comfy.git"
    "ComfyUI-GGUF|https://github.com/city96/ComfyUI-GGUF.git"
    "ComfyUI-Florence2|https://github.com/kijai/ComfyUI-Florence2.git"
    "ComfyUI_Searge_LLM|https://github.com/SeargeDP/ComfyUI_Searge_LLM.git"
    "ControlAltAI-Nodes|https://github.com/gseth/ControlAltAI-Nodes.git"
    "comfyui-ollama|https://github.com/stavsap/comfyui-ollama.git"
    "ComfyUI-iTools|https://github.com/MohammadAboulEla/ComfyUI-iTools.git"
    "ComfyUI-seamless-tiling|https://github.com/spinagon/ComfyUI-seamless-tiling.git"
    "ComfyUI-Inpaint-CropAndStitch|https://github.com/lquesada/ComfyUI-Inpaint-CropAndStitch.git"
    "canvas_tab|https://github.com/Lerc/canvas_tab.git"
    "ComfyUI-OmniGen|https://github.com/1038lab/ComfyUI-OmniGen.git"
    "ComfyUI-Inspyrenet-Rembg|https://github.com/john-mnz/ComfyUI-Inspyrenet-Rembg.git"
    "ComfyUI_AdvancedRefluxControl|https://github.com/kaibioinfo/ComfyUI_AdvancedRefluxControl.git"
    "ComfyUI-VideoHelperSuite|https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git"
    "ComfyUI-AdvancedLivePortrait|https://github.com/PowerHouseMan/ComfyUI-AdvancedLivePortrait.git"
    "ComfyUI-ToSVG|https://github.com/Yanick112/ComfyUI-ToSVG.git"
    "comfyui-kokoro|https://github.com/stavsap/comfyui-kokoro.git"
    "ComfyUI-Janus-Pro|https://github.com/CY-CHENYUE/ComfyUI-Janus-Pro.git"
    "ComfyUI_Sonic|https://github.com/smthemex/ComfyUI_Sonic.git"
    "ComfyUI-TeaCache|https://github.com/welltop-cn/ComfyUI-TeaCache.git"
    "KayTool|https://github.com/kk8bit/KayTool.git"
    "ComfyUI-TiledDiffusion|https://github.com/shiimizu/ComfyUI-TiledDiffusion.git"
    "ComfyUI-LTXVideo|https://github.com/Lightricks/ComfyUI-LTXVideo.git"
    "ComfyUI-KJNodes|https://github.com/kijai/ComfyUI-KJNodes.git"
    "ComfyUI-WanVideoWrapper|https://github.com/kijai/ComfyUI-WanVideoWrapper.git"
)

for node in "${nodes[@]}"; do
    IFS="|" read -r name url <<< "$node"
    if [ ! -d "custom_nodes/$name" ]; then
        echo "Cloning $name..."
        git clone $url custom_nodes/$name
        if [ -f "custom_nodes/$name/requirements.txt" ]; then
            pip3 install --no-cache-dir -r custom_nodes/$name/requirements.txt
        fi
        if [ -f "custom_nodes/$name/install.py" ]; then
            python3 custom_nodes/$name/install.py
        fi
    else
        echo "Custom node $name already exists, skipping."
    fi
done
echo "Custom node installation complete."

echo "Starting FastAPI server..."
exec uvicorn serverless_app:app --host 0.0.0.0 --port 8000
