
##
## base16_monokai.kak
##

evaluate-commands %sh{
    ## http://chriskempson.com/projects/base16/
    ## default bg black
    base00='rgb:272822'
    base_black='rgb:272822'
    ## lighter bg black
    base01='rgb:383830'
    ## selection bg black
    base02='rgb:49483e'
    ## comments black
    base03='rgb:75715e'
    ## dark fg grey
    base04='rgb:a59f85'
    ## default fg grey
    base05='rgb:f8f8f2'
    ## light fg grey
    base06='rgb:f5f4f1'
    ## light bg white
    base07='rgb:f9f8f5'
    base_white='rgb:f9f8f5'
    ## red
    base08='rgb:f92672'
    base_red='rgb:f92672'
    ## orange
    base09='rgb:fd971f'
    base_orange='rgb:fd971f'
    ## yellow
    base0A='rgb:f4bf75'
    base_yellow='rgb:f4bf75'
    ## green
    base0B='rgb:a6e22e'
    base_green='rgb:a6e22e'
    ## cyan
    base0C='rgb:a1efe4'
    base_cyan='rgb:a1efe4'
    ## blue
    base0D='rgb:66d9ef'
    base_blue='rgb:66d9ef'
    ## purple
    base0E='rgb:ae81ff'
    base_purple='rgb:ae81ff'
    ## brown
    base0F='rgb:cc6633'
    base_brown='rgb:cc6633'

    ## code
    echo "
        face global value ${base09}+b
        face global type ${base0A}
        face global identifier ${base08}
        face global string ${base0B}
        face global error ${base05},${base0B}
        face global keyword ${base0E}+b
        face global operator ${base05}
        face global attribute ${base09}
        face global comment ${base03}
        face global meta ${base0A}
    "

    ## markup
    echo "
        face global title ${base0D}
        face global header ${base0D}
        face global bold ${base0A}
        face global italic ${base09}
        face global mono ${base0B}
        face global block ${base09}
        face global link ${base0D}
        face global bullet ${base0B}
        face global list ${base08}
    "

    ## builtin
    echo "
        face global Default ${base05},${base_black}
        face global PrimarySelection ${base_white},${base_blue}
        face global SecondarySelection ${base05},${base_blue}
        face global PrimaryCursor ${base_black},${base_white}
        face global SecondaryCursor ${base_black},${base05}
        face global LineNumbers ${base05},${base01}
        face global LineNumberCursor ${base05},rgb:282828+b
        face global MenuForeground ${base_white},${base_blue}
        face global MenuBackground ${base_blue},${base01}
        face global MenuInfo ${base_blue}
        face global Information ${base00},${base_blue}
        face global Error ${base01},${base_red}
        face global StatusLine ${base06},${base01}
        face global StatusLineMode ${base_yellow}
        face global StatusLineInfo ${base_blue}
        face global StatusLineValue ${base_green}
        face global StatusCursor ${base02},${base_blue}
        face global Prompt ${base_yellow},${base_black}
        face global MatchingChar ${base_blue},${base00}+b
        face global BufferPadding ${base_blue},${base01}
    "
}
