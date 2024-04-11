# vim-manim

<p align="center">
<img src="/Demo.gif" width="60%" height="60%">
</p>

A tiny plugin to render animations with
[manim ce](https://www.manim.community) without leaving Vim.

Written in Vim9.

## Usage

### Commands

This plugin provides only two commands:

Type `:Manin` then hit `<tab>` to select a Scene. Then hit `<space>` and
`<tab>` again to select a list of rendering flags.

Type `:ManimCheck` to perform a check on your `manim` installation.

The rendering output is stored in the quickfix list. Type `:copen` and
`:cclose` to open/close the quickfix list. See `:h quickfix.txt` for more
info.

### Events

Two events `ManimPre` and `ManimPost` are also provided. The former triggers
actions before the actual `manim` program is executed, whereas the latter just
after. As an example of usage, you may consider the following:

```
autocmd! User ManimPre echom "Manim renderer is being called..."
autocmd! User ManimPost echom "Rendering done! Check eventual errors."
```

See `:h autocommand` for more info on Vim autocommands.

## Configuration

There are only two configuration variables: `g:manim_flags` and
`g:manim_default_flag`.

The former is a dictionary where the keys are tags and the values are the
actual rendering flags. For example, you could define:

```
var manim_common_flags = '--fps 30 --disable_caching -v WARNING'
g:manim_flags = {'low_quality': $"-pql {manim_common_flags}",
                'high_quality': $"-pqh -c ~/my_config.cfg {manim_common_flags}",
                'transparent': $"-pqh -c ~/my_config.cfg {manim_common_flags} --transparent"}
```

> [!NOTE]
>
> No spaces are allowed in the dictionary keys!

The latter is a default flag that must be a key of `g:manim_flags`. For
example, you could set the following:

```
g:manim_default_flag = keys(g:manim_flags)[-1]
```

If such variables are not set by the user, the following default values are
provided:

```
g:manim_flags = {'low_quality': $"-pql"}
g:manim_default_flag = keys(g:manim_flags)[0]
```

Enjoy!

## What about docs?

You don't really need a plugin for that. It is enough that you define your own
command in e.g. your `.vimrc`, or, even better, in your
`~/.vim/after/ftplugin/python.vim` file (replace `.vim` with `vimfiles` if you
are using Windows). You can for example have something like the following:

```
    if has("mac")
        command! ManimDocs silent :!open -a safari.app
                \ ~/Documents/manimce-latest/index.html
    elseif has("Linux")
        command! ManimDocs silent :!xdg-open
                \ https://docs.manim.community/en/stable/
    else
        command! ManimDocs silent :!start
                \ ~/Somepath/manimce-0.18.0/index.html
    endif
```

At this point, it is enough to run `:ManimDocs` to open the doc page.

> [!Tip]
>
> Having your docs stored somewhere locally is obviously much faster to open
> doc pages. Don't forget to update them when you install a newer version of
> manim.

## License

BSD3-Clause.
