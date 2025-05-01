# Simple Term

Simple Term is a Neovim plugin designed to manage terminal buffers efficiently. It provides functionality to create and navigate between terminal buffers within Neovim, enhancing the terminal experience for users.

## Features

- Create terminal buffers within Neovim
- Navigate to specific terminal buffers by index
- Automatically manage terminal buffer visibility

## Installation

To install Simple Term, you can use your preferred Neovim plugin manager. For example, using [vim-plug](https://github.com/junegunn/vim-plug):

1. Add the following line to your `init.vim` or `init.lua`:

   ```vim
   Plug 'yourusername/simple-term'
   ```

2. Install the plugin:

   ```vim
   :PlugInstall
   ```

## Usage

Simple Term provides a simple API to manage terminal buffers:

- **Create a Terminal**: Automatically creates a terminal buffer if it doesn't exist.
- **Go to Terminal**: Navigate to a terminal buffer by its index.

### Example Commands

- To navigate to a terminal buffer by index:

  ```lua
  require('simple-term').goto_terminal(1)
  ```

This command will switch to the terminal buffer at the specified index, creating it if necessary.

## Contributing

Contributions are welcome! If you would like to contribute to Simple Term, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with descriptive messages.
4. Push your changes to your fork.
5. Submit a pull request to the main repository.

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

