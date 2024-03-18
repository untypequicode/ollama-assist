function install() {
   echo "Installing Ollama Assist..."
   if [ "$1" ]; then
       case $1 in
           -o|--ollama) bash -c "curl -fsSL https://ollama.com/install.sh | sh" ;;
           *) echo "fatal: unknown option '$1'"
           exit 1 ;;
       esac
   fi

   # Vérifier si les dépendances sont installées
   if ! command -v jq >/dev/null 2>&1; then
       echo "Installing jq..."
       sudo apt-get install jq -y
   fi

   # Copier le script d'assistant Ollama dans le répertoire /opt/ollama-assist/bin/
   sudo mkdir -p /opt/ollama-assist/bin
   sudo cp src/ollama-assist /opt/ollama-assist/bin
   sudo chmod +x /opt/ollama-assist/bin/ollama-assist

   # Vérifier si le répertoire /opt/ollama-assist/bin/ est déjà dans le PATH
   if ! grep -q "/opt/ollama-assist/bin" ~/.bashrc; then
       # Ajouter le répertoire /opt/ollama-assist/bin/ au PATH
       bash -c "echo 'export PATH=\$PATH:/opt/ollama-assist/bin' >> ~/.bashrc"
   else
       echo "Skipping PATH"
   fi

   # Vérifier si le répertoire ~/.ollama-assist/ existe déjà et demander à l'utilisateur s'il souhaite le supprimer
   if [ -d ~/.ollama-assist/ ]; then
       read -p "The directory ~/.ollama-assist/ already exists. Do you want to remove it? (y/n): " choice
       if [ "$choice" == "y" ]; then
           bash -c 'rm -r ~/.ollama-assist/'
       else
           echo "Skipping ~/.ollama-assist/"
       fi
   fi

   # Créer le répertoire ~/.ollama-assist/ s'il n'existe pas
   if [ ! -d ~/.ollama-assist/ ]; then
       bash -c 'mkdir ~/.ollama-assist/'
   fi

   # Créer les fichiers ~/.ollama-assist/models_history et ~/.ollama-assist/models_custom s'ils n'existent pas
   if [ ! -f ~/.ollama-assist/models_history ]; then
       bash -c 'touch ~/.ollama-assist/models_history'
   fi
   if [ ! -f ~/.ollama-assist/models_custom ]; then
       bash -c 'touch ~/.ollama-assist/models_custom'
   fi

   echo "Ollama Assist has been installed successfully"

   # Demander à l'utilisateur s'il souhaite installer le raccourci
   read -p "Do you authorize the installation of the Ollama Assist shortcut? (y/n): " choice
   if [ "$choice" == "y" ]; then
       bash -c 'echo "Installing Ollama Assist shortcut..."'
       # Supprimer les anciens fichiers de raccourci si nécessaire
       if [ -f ~/.local/share/icons/ollamaassist.svg ]; then
           bash -c 'sudo rm /usr/share/icons/ollamaassist.svg'
       fi
       if [ -f ~/Desktop/ollama-assist.desktop ]; then
           bash -c 'sudo rm ~/.local/share/applications/ollama-assist.desktop'
       fi
       # Copier le logo et le fichier de raccourci
       bash -c 'echo "Copying the Ollama Assist logo..."'
       sudo cp src/ollamaassist.svg /usr/share/icons/
       bash -c 'echo "Copying the Ollama Assist desktop file..."'
       cp src/ollama-assist.desktop ~/.local/share/applications/
       echo "Ollama Assist shortcut has been installed successfully."
   else
       echo "Skipping Ollama Assist shortcut installation."
   fi

   exit 0
}

if [ "$1" ]; then
    case $1 in
        ollama) install ollama ;;
        *) echo "fatal: unknown option '$1'"
        exit 1 ;;
    esac
else
    install
fi