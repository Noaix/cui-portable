
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import json
import os
from comfyui import ComfyUI
import torch

app = FastAPI()

class WorkflowRequest(BaseModel):
    workflow: dict
    input_image: str = None  # Base64 encoded image or URL

@app.post("/generate")
async def generate(request: WorkflowRequest):
    try:
        # Initialize ComfyUI
        comfy = ComfyUI()
        
        # Load workflow
        workflow = request.workflow
        
        # Handle input image if provided
        if request.input_image:
            # For simplicity, assume input_image is a URL or base64; handle accordingly
            # You may need additional logic to process the image
            workflow["input_image"] = request.input_image
        
        # Run ComfyUI workflow
        result = comfy.run_workflow(workflow)
        
        # Return the generated output (e.g., image or video)
        return {"status": "success", "output": result}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
