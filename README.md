# tex-fold

A light-weight alternative to vim-latexsuite's folding. It uses a simple
`foldexpr` to capture `\section`s, `\subsection`s and blocks defined with
`\begin` and `\end`. However, you are not limited to the `foldexpr` method and
can still define manual markers, e.g.

~~~ latex
%{{{ Packages
\usepackage{hyperref}
%}}}
~~~

## Installation

vim-tex-fold is compatible with all major plugin managers. To install it with
Vundle, add

~~~ vim
Bundle 'matze/vim-tex-fold'
~~~

to your `.vimrc`


## License

This plugin is licensed under MIT license.


## Screenshot

![Screenshot showing an open section and two environments](http://i.imgur.com/ovltmkz.png)
