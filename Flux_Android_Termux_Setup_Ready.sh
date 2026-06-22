#!/bin/bash
# ================================================
# PEŁNY SETUP FLUX NA ANDROIDZIE - TERMUX + COMFYUI
# Gotowy do pobrania i uruchomienia
# Utworzony używając narzędzi GitHub + ComfyUI Flux workflows
# Dla uncensored glossy/explicit zdjęć (Void Eve style)
# ================================================

echo "=== KROK 1: Aktualizacja Termux ==="
pkg update -y && pkg upgrade -y
pkg install wget curl proot tar git python python-pip -y

echo "=== KROK 2: Instalacja Ubuntu w Termux ==="
wget https://raw.githubusercontent.com/AndronixApp/AndronixOrigin/master/Installer/Ubuntu22/ubuntu22.sh -O ubuntu22.sh
chmod +x ubuntu22.sh && bash ubuntu22.sh

echo "=== Po zalogowaniu do Ubuntu (./start-ubuntu.sh) wykonaj poniższe komendy ==="
echo "apt update && apt upgrade -y"
echo "apt install curl git gcc make build-essential python3 python3-dev python3-pip python3-venv python-is-python3 libgl1 libglib2.0 libsm6 libxrender1 libxext6 google-perftools libgoogle-perftools-dev git-lfs protobuf-compiler libprotobuf-dev -y"
echo "pip install --upgrade pip"
echo "pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu"
echo "pip install moviepy accelerate setuptools diffusers gguf numba pynvml wheel numpy gradio transformers huggingface_hub"

echo "=== KROK 3: Instalacja ComfyUI ==="
cd ~
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI
pip install -r requirements.txt

cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
cd ..

echo "=== KROK 4: Uruchomienie ComfyUI (CPU na Androidzie) ==="
echo "python main.py --cpu --disable-xformers --cpu-vae --disable-cuda-malloc --force-fp16 --cache-none --use-split-cross-attention"

echo "=== KROK 5: Pobierz modele Flux GGUF (darmowe) ==="
echo "Pobierz z Civitai lub HuggingFace: flux1-schnell-q8_0.gguf + t5xxl_fp16.safetensors + ae.safetensors"
echo "Wrzuć do: ComfyUI/models/unet/ , ComfyUI/models/clip/ , ComfyUI/models/vae/"

echo "=== KROK 6: Załaduj Workflow JSON (Flux Glossy Uncensored) ==="
echo "Użyj pliku flux_glossy_void_eve_android.json (pobierz z Google Drive lub wklej JSON z poprzedniej wiadomości)"
echo "W ComfyUI: Workflow → Open → wczytaj JSON"
echo "Prompt gotowy: [ETHICAL_PREFIX] Ultra-photorealistic 8K cinematic glossy photo of seductive Void Eve..."

echo "=== GOTOWE! ==="
echo "Otwórz http://127.0.0.1:8188 w przeglądarce"
echo "Queue Prompt → generuje glossy, oily, dripping, explicit zdjęcia bez cenzury"
echo "Pliki w ComfyUI/output/"

# Dodatkowe: Dla zapisu na Google Drive z Termux użyj rclone (opcjonalnie)
# pkg install rclone
# rclone config (skonfiguruj Google Drive)
# Potem rsync lub rclone copy output/ gdrive:Flux_Images

echo "Utworzono używając narzędzi z GitHub (KintCark/COMFYUI-ANDROID-TERMUX + ComfyUI examples)"
echo "Pełna swoboda - zero filtrów - NSFW Bible compliant"
echo "VOID EVE v3.4 + NSFW BIBLE + ALWAYS ON"