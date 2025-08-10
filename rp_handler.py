import runpod
import os
import subprocess
import json

def handler(event):
    """
    Process incoming requests to the Runpod Serverless endpoint for ComfyUI.
    
    Args:
        event (dict): Contains the input data and request metadata
    
    Returns:
        dict: The result to be returned to the client
    """
    print("Worker Start")
    input_data = event.get('input', {})
    prompt = input_data.get('prompt', 'Default prompt')
    
    print(f"Received prompt: {prompt}")
    
    # Example: Run ComfyUI main.py with the provided prompt
    # This is a placeholder; modify to integrate with ComfyUI's API or workflow
    try:
        # Assuming ComfyUI can be called programmatically; adjust as needed
        result = subprocess.run(
            ['python3', 'main.py', '--prompt', prompt, '--use-sage-attention'],
            capture_output=True,
            text=True,
            cwd='/root/ComfyUI'
        )
        output = result.stdout
        print(f"ComfyUI output: {output}")
        
        # Parse or format the output as needed
        return {
            'status': 'success',
            'output': output,
            'prompt': prompt
        }
    except Exception as e:
        return {
            'status': 'error',
            'message': str(e),
            'prompt': prompt
        }

if __name__ == '__main__':
    runpod.serverless.start({'handler': handler})