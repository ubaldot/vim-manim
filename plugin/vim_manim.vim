vim9script

# Render manim-ations in Vim
# Maintainer: Ubaldo Tiberi
# License: BSD3-Clause
# GetLatestVimScripts: 6075 1 :AutoInstall: vim_manim.vim

if !has('vim9script') ||  v:version < 900
    finish
endif

g:loaded_vim_manim = true

if !exists('g:manim_flags')
    g:manim_flags = {'low_quality': "-pql"}
endif

if !exists('g:manim_default_flag')
    g:manim_default_flag = keys(g:manim_flags)[-1]
endif
