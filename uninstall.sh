function uninstall() {
    echo "Uninstalling Ollama Assist..."

    # Vérifier si l'utilisateur souhaite supprimer le répertoire /opt/ollama-assist/
    read -p "Do you want to remove the directory /opt/ollama-assist/? (y/n): " choice
    if [ "$choice" == "y" ]; then
        sudo rm -r /opt/ollama-assist
    else
        echo "Skipping /opt/ollama-assist/"
    fi

    # Vérifier si l'utilisateur souhaite supprimer le répertoire ~/.ollama-assist/
    read -p "Do you want to remove the directory ~/.ollama-assist/? (y/n): " choice
    if [ "$choice" == "y" ]; then
        sudo rm -r ~/.ollama-assist/
    else
        echo "Skipping ~/.ollama-assist/"
    fi

    # Supprimer la ligne /ollama-assist/ du fichier ~/.bashrc si elle existe
    if grep -q "/ollama-assist/" ~/.bashrc; then
        read -p "Do you want to remove the line /ollama-assist/ from ~/.bashrc? (y/n): " choice
        if [ "$choice" == "y" ]; then
            sudo sed -i '/ollama-assist/d' ~/.bashrc
        else
            echo "Skipping ~/.bashrc"
        fi
    else
        echo "Skipping ~/.bashrc"
    fi

    # Supprimer les fichiers de raccourci de l'utilisateur
    if [ -d /usr/share/icons ]; then
          for file in /usr/share/icons/*.svg; do
              if [[ $file =~ "ollama-assist" ]]; then
                echo $file
                sudo rm $file
              fi
          done
      fi

    # Supprimer tous les fichiers .desktop pour les modèles
    if [ -d ~/.local/share/applications ]; then
        for file in ~/.local/share/applications/*.desktop; do
            if [[ $file =~ "ollama-assist" ]]; then
              echo $file
              sudo rm $file
            fi
        done
    fi

    echo "Ollama Assist has been uninstalled successfully"
    exit 0
}

if [ "$1" ]; then
    case $1 in
        *) echo "fatal: unknown option '$1'"
        exit 1 ;;
    esac
else
    uninstall
fi