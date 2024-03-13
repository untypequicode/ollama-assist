#!/bin/bash

function help() {
    echo "Usage: ollama-assist install manager [options]"
    exit 0
}

function install() {
   echo "Installing Ollama Assist..."
   if [ "$1" ]; then
       case $1 in
           -o) bash -c "curl -fsSL https://ollama.com/install.sh | sh" ;;
           *) echo "fatal: unknown option '$1'"
           exit 1 ;;
       esac
   fi
   sudo mkdir -p /opt/ollama-assist/bin
   sudo cp src/ollama-assist /opt/ollama-assist/bin
#   sudo chmod +x /opt/olla-assist/bin/ollama-assist
   bash -c "echo 'export PATH=\$PATH:/opt/ollama-assist/bin' >> ~/.bashrc"
   if [ -d ~/.ollama-assist/ ]; then
       bash -c 'rm -r ~/.ollama-assist/'
   fi
        bash -c "mkdir ~/.ollama-assist/"
        bash -c 'touch ~/.ollama-assist/models_history'
    echo "Ollama Assist has been installed successfully"
    exit 0
}

if [ "$1" ]; then
    case $1 in
        help|-h|--help) help ;;
        -o) install -o ;;
        *) echo "fatal: unknown option '$1'"
        exit 1 ;;
    esac
else
    install
fi