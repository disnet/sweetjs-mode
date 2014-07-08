# Sweet.js Minor Mode

An emacs minor mode for sweet.js files. It adds syntax highlighting and provides commands to compile the current buffer.

# Installation

Clone this project and add it to your load path. In your emacs config:

```lisp
(add-to-list 'load-path "/path/to/sweetjs-mode")
(require 'sweetjs-mode)
```

If you want to turn sweetjs-mode for all js files:

```lisp
(add-hook 'js-mode 'sweetjs-mode)
```

# Default keymap

|Key | Command |
|:---|---------|
|`C-c s c` | Compile the current buffer and display the result in a new frame |
|`C-c s r` | Compile the current region and display the result in a new frame |
