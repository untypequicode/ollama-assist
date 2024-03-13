#!/bin/bash

function help() {
    echo "Usage: ollama-assist uninstall manager [options]"
    exit 0
}

function uninstall() {
    echo "Uninstalling Ollama Assist..."
    sudo rm -r /opt/ollama-assist
    sudo rm -r ~/.ollama-assist/
    sudo sed -i '/ollama-assist/d' ~/.bashrc
    echo "Ollama Assist has been uninstalled successfully"
    exit 0
}

if [ "$1" ]; then
    case $1 in
        help|-h|--help) help ;;
        *) echo "fatal: unknown option '$1'"
        exit 1 ;;
    esac
else
    uninstall
fi