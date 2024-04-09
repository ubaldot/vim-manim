# vim-manim

A tiny plugin to render animations with [manim]() without leaving Vim.

## Installation

Install with any method that you like (`vim-plug`, etc.).

## Usage

This plugin provides only two commands: `:Manim` and `:ManimCheck`.

Type `:Manin` then hit `<tab>` to select a Scene. Then hit `<space>` and
`<tab>` again to select a list of rendering flags.

Type `:ManimCheck` to perform a check on your `manim` installation.

The rendering output is stored in the `:h quickfix` list. Type `:copen` and
`:cclose` to open/close the quickfix list.

## Configuration

There are only two variables: `g:manim_flags` and `g:manim_default_flag`. The
former is a dictionary where the keys are tags and the values are the actual
rendering flags. For example, you could define:

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

## License

BSD3-Clause.
