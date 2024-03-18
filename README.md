<div align="center">
  <img alt="ollama" height="200px" src="src/ollama-assist.svg">
</div>

# Ollama Assist

[Ollama](https://github.com/ollama/ollama) Assist: AI-powered assistants for Linux

## Installation

Please clone the repository and run the install script.

```
git clone https://github.com/untypequicode/ollama-assist.git
```

### Linux

```
./install.sh
```

To install Ollama Assist with ollama, run the following command:

```
./install.sh ollama
```

## Usage

To start Ollama Assist, run the following command:

```
ollama-assist
```

## Commands

```
-h, --help                      Show this help message and exit
-v, --version                   Show version information and exit
-l, --list                      List available models
-i, --init                      Config default model
-r, --run                       Run the argument model
-c, --custom                    Manage custom models:
    -h, --help                  Show this help message and exit
    -l, --list                  List available custom models
    -a, --add                   Add a new custom model
    -rm, --remove               Remove a custom model
    -e, --edit                  Edit a custom model
    -rn, --rename               Rename a custom model
    -r, --run                   Run a custom model with options:
        -c, --clipboard         Copy the response to clipboard
        -t, --terminal          Display the response in the terminal
    -sa, --shortcutadd          Add a shortcut for a custom model
        -i, --icon              Add a custom icon for a shortcut
    -sr, --shortcutremove       Remove a shortcut for a custom model
```

### Custom Models

Ollama Assist supports custom models. You can manage custom models using the `-c` or `--custom` command.

```
ollama-assist -c --list
```

To add a new custom model, run the following command:

```
ollama-assist -c --add
```

To remove a custom model, run the following command:

```
ollama-assist -c --remove
```

To edit a custom model, run the following command:

```
ollama-assist -c --edit
```

To rename a custom model, run the following command:

```
ollama-assist -c --rename
```

To run a custom model, run the following command:

```
ollama-assist -c --run
```

You can use the `-c` or `--clipboard` option to copy the response to the clipboard, and the `-t` or `--terminal` option to display the response in the terminal.

### Shortcut

Ollama Assist also provides a desktop shortcut for easy access. During the installation process, you will be prompted to install the shortcut. Simply enter `y` to install the shortcut or `n` to skip it.

### Uninstall

To uninstall Ollama Assist, run the following command:

```
./uninstall.sh
```

---

Copyright ©2024 [untypequicode](https://github.com/untypequicode)

Licensed under the MIT License. See [LICENSE](LICENSE) for more information.