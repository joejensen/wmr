# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.7.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
RUN comfy node install --exit-on-fail comfyui-easy-use@1.3.6 --mode remote
RUN comfy node install --exit-on-fail was-ns@3.0.1
RUN comfy node install --exit-on-fail comfyui-crystools@1.27.4
RUN comfy node install --exit-on-fail comfyui_essentials@1.1.0
RUN comfy node install --exit-on-fail comfyui-kjnodes@1.3.3
RUN comfy node install --exit-on-fail comfyui-inpaint-cropandstitch@3.0.8
RUN comfy node install --exit-on-fail comfyui-rmbg@3.0.0
RUN comfy node install --exit-on-fail seedvr2_videoupscaler@2.5.24
RUN comfy node install --exit-on-fail comfyui-logicmath@0.1.0
RUN git clone https://github.com/DenRakEiw/ComfyUI-nearest-qwen-resolution /comfyui/custom_nodes/ComfyUI-nearest-qwen-resolution

# download models into comfyui
#RUN comfy model download --url https://huggingface.co/numz/SeedVR2_comfyUI/resolve/main/ema_vae_fp16.safetensors --relative-path models/vae --filename ema_vae_fp16.safetensors
#RUN comfy model download --url https://huggingface.co/Comfy-Org/flux2-dev/resolve/main/split_files/vae/flux2-vae.safetensors --relative-path models/vae --filename flux2-vae.safetensors
#RUN # Could not find URL for seedvr2_ema_7b_fp8_e4m3fn_mixed_block35_fp16.safetensors
#RUN comfy model download --url https://huggingface.co/black-forest-labs/FLUX.2-klein-9b-nvfp4/resolve/main/flux-2-klein-9b-nvfp4.safetensors --relative-path models/diffusion_models --filename flux-2-klein-9b-nvfp4.safetensors
#RUN comfy model download --url https://huggingface.co/Comfy-Org/vae-text-encorder-for-flux-klein-9b/resolve/main/split_files/text_encoders/qwen_3_8b_fp8mixed.safetensors --relative-path models/clip --filename qwen_3_8b_fp8mixed.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
