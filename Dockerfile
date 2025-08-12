
FROM runpod/pytorch:2.8.0-py3.11-cuda12.8.1-cudnn-devel-ubuntu22.04
WORKDIR /root

ENV TZ=Europe/Amsterdam

# Install core dependencies
RUN apt update && apt install -y \
    python3 \
    python3-pip \
    git \
    wget \
    curl \
    libgl1 \
    libglib2.0-0 \
    && apt-get clean

# Clone ComfyUI
RUN git clone https://github.com/comfyanonymous/ComfyUI.git
WORKDIR /root/ComfyUI

# Install ComfyUI and serverless dependencies
RUN pip3 install --no-cache-dir -r requirements.txt
RUN pip3 install --no-cache-dir torch==2.8.0 torchvision==0.23.0 torchaudio==2.8.0 --index-url https://download.pytorch.org/whl/cu128
RUN pip3 install --no-cache-dir triton sageattention pylatexenc onnxruntime-gpu fastapi uvicorn

# Create directories for models
RUN mkdir -p models/diffusion_models models/vae models/text_encoders models/loras

# Copy scripts
COPY start.sh /root/ComfyUI/start.sh
COPY serverless_app.py /root/ComfyUI/serverless_app.py

# Make the script executable
RUN chmod +x /root/ComfyUI/start.sh

EXPOSE 8000
CMD ["/root/ComfyUI/start.sh"]
