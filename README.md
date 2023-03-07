# java-syntax.vim

Fork of [uiiaoo/java-syntax.vim](https://github.com/uiiaoo/java-syntax.vim), refactoring everything as one single file, so that it can be easily installed without any plugin manager.

---

This is a Vim plugin that provides syntax highlighting for Java.
This syntax highlighting is better than the default.

## Installation

Simply copy the `java.vim` file into your nvim `syntax` folder.
For more information, type `:help syn-files` inside vim.

## Customizing highlighting
You can disable highlighting variables if you write the following code on your `.vimrc`.
```viml
highlight link javaIdentifier NONE
```

You can also disable highlighting delimiters.
```viml
highlight link javaDelimiter NONE
```
