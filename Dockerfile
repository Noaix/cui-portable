FROM nvidia/cuda:12.8.0-devel-ubuntu22.04
   WORKDIR /root
 
 ENV TZ=Europe/Amsterdam

  RUN apt update && apt install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    wget \
    curl \
    build-essential \
    libgl1 \
    libglib2.0-0
RUN git clone https://github.com/comfyanonymous/ComfyUI.git
WORKDIR /root/ComfyUI
RUN pip3 install -r requirements.txt
RUN pip3 install torch==2.6.0 torchvision torchaudio==2.6.0 --index-url https://download.pytorch.org/whl/cu124
RUN pip3 install triton sageattention
   RUN pip3 install --no-cache-dir pylatexenc onnxruntime-gpu flet pygit2
   RUN git clone https://github.com/Comfy-Org/ComfyUI-Manager.git custom_nodes/ComfyUI-Manager && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-Manager/requirements.txt
   RUN git clone https://github.com/WASasquatch/was-node-suite-comfyui.git custom_nodes/was-node-suite-comfyui && \
       pip3 install --no-cache-dir -r custom_nodes/was-node-suite-comfyui/requirements.txt && \
       [ -f custom_nodes/was-node-suite-comfyui/install.py ] && python3 custom_nodes/was-node-suite-comfyui/install.py || true
   RUN git clone https://github.com/yolain/ComfyUI-Easy-Use.git custom_nodes/ComfyUI-Easy-Use && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-Easy-Use/requirements.txt && \
       [ -f custom_nodes/ComfyUI-Easy-Use/install.py ] && python3 custom_nodes/ComfyUI-Easy-Use/install.py || true
   RUN git clone https://github.com/Fannovel16/comfyui_controlnet_aux.git custom_nodes/comfyui_controlnet_aux && \
       pip3 install --no-cache-dir -r custom_nodes/comfyui_controlnet_aux/requirements.txt && \
       [ -f custom_nodes/comfyui_controlnet_aux/install.py ] && python3 custom_nodes/comfyui_controlnet_aux/install.py || true
   RUN git clone https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git custom_nodes/ComfyUI_Comfyroll_CustomNodes && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI_Comfyroll_CustomNodes/requirements.txt && \
       [ -f custom_nodes/ComfyUI_Comfyroll_CustomNodes/install.py ] && python3 custom_nodes/ComfyUI_Comfyroll_CustomNodes/install.py || true
   RUN git clone https://github.com/crystian/ComfyUI-Crystools.git custom_nodes/ComfyUI-Crystools && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-Crystools/requirements.txt && \
       [ -f custom_nodes/ComfyUI-Crystools/install.py ] && python3 custom_nodes/ComfyUI-Crystools/install.py || true
   RUN git clone https://github.com/rgthree/rgthree-comfy.git custom_nodes/rgthree-comfy && \
       pip3 install --no-cache-dir -r custom_nodes/rgthree-comfy/requirements.txt && \
       [ -f custom_nodes/rgthree-comfy/install.py ] && python3 custom_nodes/rgthree-comfy/install.py || true
   RUN git clone https://github.com/city96/ComfyUI-GGUF.git custom_nodes/ComfyUI-GGUF && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-GGUF/requirements.txt && \
       [ -f custom_nodes/ComfyUI-GGUF/install.py ] && python3 custom_nodes/ComfyUI-GGUF/install.py || true
   RUN git clone https://github.com/kijai/ComfyUI-Florence2.git custom_nodes/ComfyUI-Florence2 && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-Florence2/requirements.txt && \
       [ -f custom_nodes/ComfyUI-Florence2/install.py ] && python3 custom_nodes/ComfyUI-Florence2/install.py || true
   RUN git clone https://github.com/SeargeDP/ComfyUI_Searge_LLM.git custom_nodes/ComfyUI_Searge_LLM && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI_Searge_LLM/requirements.txt && \
       [ -f custom_nodes/ComfyUI_Searge_LLM/install.py ] && python3 custom_nodes/ComfyUI_Searge_LLM/install.py || true
   RUN git clone https://github.com/gseth/ControlAltAI-Nodes.git custom_nodes/ControlAltAI-Nodes && \
       pip3 install --no-cache-dir -r custom_nodes/ControlAltAI-Nodes/requirements.txt && \
       [ -f custom_nodes/ControlAltAI-Nodes/install.py ] && python3 custom_nodes/ControlAltAI-Nodes/install.py || true
   RUN git clone https://github.com/stavsap/comfyui-ollama.git custom_nodes/comfyui-ollama && \
       pip3 install --no-cache-dir -r custom_nodes/comfyui-ollama/requirements.txt && \
       [ -f custom_nodes/comfyui-ollama/install.py ] && python3 custom_nodes/comfyui-ollama/install.py || true
   RUN git clone https://github.com/MohammadAboulEla/ComfyUI-iTools.git custom_nodes/ComfyUI-iTools && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-iTools/requirements.txt && \
       [ -f custom_nodes/ComfyUI-iTools/install.py ] && python3 custom_nodes/ComfyUI-iTools/install.py || true
   RUN git clone https://github.com/spinagon/ComfyUI-seamless-tiling.git custom_nodes/ComfyUI-seamless-tiling && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-seamless-tiling/requirements.txt && \
       [ -f custom_nodes/ComfyUI-seamless-tiling/install.py ] && python3 custom_nodes/ComfyUI-seamless-tiling/install.py || true
   RUN git clone https://github.com/lquesada/ComfyUI-Inpaint-CropAndStitch.git custom_nodes/ComfyUI-Inpaint-CropAndStitch && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-Inpaint-CropAndStitch/requirements.txt && \
       [ -f custom_nodes/ComfyUI-Inpaint-CropAndStitch/install.py ] && python3 custom_nodes/ComfyUI-Inpaint-CropAndStitch/install.py || true
   RUN git clone https://github.com/Lerc/canvas_tab.git custom_nodes/canvas_tab && \
       pip3 install --no-cache-dir -r custom_nodes/canvas_tab/requirements.txt && \
       [ -f custom_nodes/canvas_tab/install.py ] && python3 custom_nodes/canvas_tab/install.py || true
   RUN git clone https://github.com/1038lab/ComfyUI-OmniGen.git custom_nodes/ComfyUI-OmniGen && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-OmniGen/requirements.txt && \
       [ -f custom_nodes/ComfyUI-OmniGen/install.py ] && python3 custom_nodes/ComfyUI-OmniGen/install.py || true
   RUN git clone https://github.com/john-mnz/ComfyUI-Inspyrenet-Rembg.git custom_nodes/ComfyUI-Inspyrenet-Rembg && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-Inspyrenet-Rembg/requirements.txt && \
       [ -f custom_nodes/ComfyUI-Inspyrenet-Rembg/install.py ] && python3 custom_nodes/ComfyUI-Inspyrenet-Rembg/install.py || true
   RUN git clone https://github.com/kaibioinfo/ComfyUI_AdvancedRefluxControl.git custom_nodes/ComfyUI_AdvancedRefluxControl && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI_AdvancedRefluxControl/requirements.txt && \
       [ -f custom_nodes/ComfyUI_AdvancedRefluxControl/install.py ] && python3 custom_nodes/ComfyUI_AdvancedRefluxControl/install.py || true
   RUN git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git custom_nodes/ComfyUI-VideoHelperSuite && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-VideoHelperSuite/requirements.txt && \
       [ -f custom_nodes/ComfyUI-VideoHelperSuite/install.py ] && python3 custom_nodes/ComfyUI-VideoHelperSuite/install.py || true
   RUN git clone https://github.com/PowerHouseMan/ComfyUI-AdvancedLivePortrait.git custom_nodes/ComfyUI-AdvancedLivePortrait && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-AdvancedLivePortrait/requirements.txt && \
       [ -f custom_nodes/ComfyUI-AdvancedLivePortrait/install.py ] && python3 custom_nodes/ComfyUI-AdvancedLivePortrait/install.py || true
   RUN git clone https://github.com/Yanick112/ComfyUI-ToSVG.git custom_nodes/ComfyUI-ToSVG && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-ToSVG/requirements.txt && \
       [ -f custom_nodes/ComfyUI-ToSVG/install.py ] && python3 custom_nodes/ComfyUI-ToSVG/install.py || true
   RUN git clone https://github.com/stavsap/comfyui-kokoro.git custom_nodes/comfyui-kokoro && \
       pip3 install --no-cache-dir -r custom_nodes/comfyui-kokoro/requirements.txt && \
       [ -f custom_nodes/comfyui-kokoro/install.py ] && python3 custom_nodes/comfyui-kokoro/install.py || true
   RUN git clone https://github.com/CY-CHENYUE/ComfyUI-Janus-Pro.git custom_nodes/ComfyUI-Janus-Pro && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-Janus-Pro/requirements.txt && \
       [ -f custom_nodes/ComfyUI-Janus-Pro/install.py ] && python3 custom_nodes/ComfyUI-Janus-Pro/install.py || true
   RUN git clone https://github.com/smthemex/ComfyUI_Sonic.git custom_nodes/ComfyUI_Sonic && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI_Sonic/requirements.txt && \
       [ -f custom_nodes/ComfyUI_Sonic/install.py ] && python3 custom_nodes/ComfyUI_Sonic/install.py || true
   RUN git clone https://github.com/welltop-cn/ComfyUI-TeaCache.git custom_nodes/ComfyUI-TeaCache && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-TeaCache/requirements.txt && \
       [ -f custom_nodes/ComfyUI-TeaCache/install.py ] && python3 custom_nodes/ComfyUI-TeaCache/install.py || true
   RUN git clone https://github.com/kk8bit/KayTool.git custom_nodes/KayTool && \
       pip3 install --no-cache-dir -r custom_nodes/KayTool/requirements.txt && \
       [ -f custom_nodes/KayTool/install.py ] && python3 custom_nodes/KayTool/install.py || true
   RUN git clone https://github.com/shiimizu/ComfyUI-TiledDiffusion.git custom_nodes/ComfyUI-TiledDiffusion && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-TiledDiffusion/requirements.txt && \
       [ -f custom_nodes/ComfyUI-TiledDiffusion/install.py ] && python3 custom_nodes/ComfyUI-TiledDiffusion/install.py || true
   RUN git clone https://github.com/Lightricks/ComfyUI-LTXVideo.git custom_nodes/ComfyUI-LTXVideo && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-LTXVideo/requirements.txt && \
       [ -f custom_nodes/ComfyUI-LTXVideo/install.py ] && python3 custom_nodes/ComfyUI-LTXVideo/install.py || true
   RUN git clone https://github.com/kijai/ComfyUI-KJNodes.git custom_nodes/ComfyUI-KJNodes && \
       pip3 install --no-cache-dir -r custom_nodes/ComfyUI-KJNodes/requirements.txt && \
       [ -f custom_nodes/ComfyUI-KJNodes/install.py ] && python3 custom_nodes/ComfyUI-KJNodes/install.py || true
   EXPOSE 8188
   CMD ["python3", "main.py", "--listen", "0.0.0.0", "--port", "8188", "--use-sage-attention"]