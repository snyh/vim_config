" Vim syntax file
" Language:	CSS3
" Maintainer:	Hsiaoming Yang <lepture@me.com>
" URL: http://lepture.me/work/css3/
" Created:	Dec 14, 2011
" Modified:	Sep 4, 2012

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'css'
endif

syn case ignore
syn region cssString start='"' end='"' contained
syn region cssString start="'" end="'" contained

" HTML4 tags
syn keyword cssTagName abbr acronym address applet area base a b
syn keyword cssTagName basefont bdo big blockquote body button br
syn keyword cssTagName caption cite code col colgroup dd del
syn keyword cssTagName dfn dir div dl dt em fieldset form frame
syn keyword cssTagName frameset h1 h2 h3 h4 h5 h6 head hr html img i
syn keyword cssTagName iframe img input ins isindex kbd label legend li
syn keyword cssTagName link map menu meta noframes noscript ol optgroup
syn keyword cssTagName option p param pre q s samp script select
syn keyword cssTagName span strike strong style sub sup tbody td
syn keyword cssTagName textarea tfoot th thead title tr tt ul u var
syn match cssTagName "\*"
syn match cssTagName /\<table\>/
syn match cssTagName /\<small\>/
syn match cssTagName /\<center\>/
" HTML5 tags
syn keyword cssTagName article aside audio bb canvas command datagrid
syn keyword cssTagName datalist details dialog embed figure footer figcaption
syn keyword cssTagName header hgroup keygen mark meter nav output 
syn keyword cssTagName progress time rt rp section time video
syn match cssTagName /\<ruby\>/
" class select
syn match cssSelector /\.[A-Za-z][A-Za-z0-9_-]\+/
" id select
syn match cssSelector /#[A-Za-z][A-Za-z0-9_-]\+/
syn region cssSelector start='\[' end='\]' contains=cssString

syn region cssDefineBlock start="{" end="}" transparent contains=ALL

syn keyword cssCommonVal inherit initial auto both normal hidden none medium contained


" Comment
syn keyword cssTodo FIXME TODO contained
syn region cssComment start="/\*" end="\*/" contains=cssTodo
syn match cssImportant "!\s*important\>" contained

syn match cssValueInteger "[-+]\=\d\+" contained
syn match cssValueNumber "[-+]\=\d\+\(\.\d*\)\="
syn match cssValueLength "[-+]\=\d\+\(\.\d*\)\=\(%\|mm\|cm\|in\|pt\|pc\|em\|ex\|px\|rem\|vh\|vw\|vm\|fr\|gr\)" contained
syn match cssValueAngle "[-+]\=\d\+\(\.\d*\)\=\(deg\|grad\|rad\|turn\)" contained
syn match cssValueTime "+\=\d\+\(\.\d*\)\=\(ms\|s\)" contained
syn match cssValueFrequency "+\=\d\+\(\.\d*\)\=\(Hz\|kHz\)" contained


" Properties http://www.w3.org/community/webed/wiki/CSS/Properties
" background http://www.w3.org/TR/css3-background/
syn match cssBackgroundProp /\(background-\(color\|image\|repeat\|attachment\|position\)\|background\)/ contained
syn match cssBackgroundProp /background-\(origin\|\(repeat\|position\)-[xy]\|clip\|size\)/ contained
syn match cssBackgroundProp /object-\(fit\|position\)/ contained
" http://www.evotech.net/blog/2010/02/css3-properties-values-browser-support/
syn keyword cssBackgroundVal tb lr rl snap cover contain widthLength heightLength contained
syn match cssBackgroundVal /\(scale-down\|from-image\)/ contained
syn match cssBackgroundVal /repeat-[xy]/ contained
syn match cssBackgroundVal /no-repeat/ contained
syn keyword cssBackgroundVal circle ellipse to at contained
syn match cssBackgroundVal /\(closest\|farthest\)-\(side\|corner\)/ contained

syn region cssFuncVal start="\(url\|calc\|min\|max\|counter\|cycle(\)" end=")" oneline contained contains=cssString,cssValueLength,cssValueInteger,cssValueNumber,cssValueAngle,cssValueTime,cssValueFrequency
syn region cssFuncVal start="\(linear\|radial\|repeating-linear\|repeating-radial\)-gradient(" end=")" oneline contained contains=cssString,cssValueLength,cssValueInteger,cssValueNumber,cssValueAngle,cssValueTime,cssValueFrequency,cssVisualProp,cssColorVal

syn match cssBorderProp /\(border-\(color\|style\|width\|radius\)\|border\)/ contained
syn match cssBorderProp /border-\(image-\(source\|slice\|width\|outset\|repeat\)\|image\)/ contained
syn match cssBorderProp /border-\(\(top\|right\|bottom\|left\)-\(color\|style\|width\)\|\(top\|right\|bottom\|left\)\)/ contained
syn match cssBorderProp /border-\(top\|bottom\)-\(left\|right\)-radius/ contained
syn keyword cssBorderVal dotted dashed solid double groove ridge inset outset contained
syn match cssBorderVal /\<collapse\>/ contained
syn match cssBorderVal /\<separate\>/ contained
syn match cssBorderVal /\<fill\>/ contained

" Font
syn match cssFontProp /\(font-\(family\|style\|variant\|weight\|size-adjust\|size\|stretch\)\|font\)/ contained
syn match cssFontVal /\(sans-serif\|small-caps\)/ contained
syn match cssFontVal /\<x\{1,2\}-\(large\|small\)\>/ contained
syn keyword cssFontVal cursive fantasy monospace italic oblique serif contained
syn keyword cssFontVal bold bolder lighter larger smaller contained
syn keyword cssFontVal icon narrower wider contained

" Color
syn match cssColorVal /transparent/ contained
syn match cssColorVal "#[0-9A-Fa-f]\{3\}\>" contained
syn match cssColorVal "#[0-9A-Fa-f]\{6\}\>" contained
syn match cssFuncVal /rgb(\(\d\{1,3\}\s*,\s*\)\{2\}\d\{1,3\})/ contained contains=cssString,cssValueLength,cssValueInteger,cssValueNumber,cssValueAngle,cssValueTime,cssValueFrequency
syn match cssFuncVal /rgba(\(\d\{1,3\}\s*,\s*\)\{3\}\(1\|0\(\.\d\+\)\?\))/ contained contains=cssString,cssValueLength,cssValueInteger,cssValueNumber,cssValueAngle,cssValueTime,cssValueFrequency 
syn match cssFuncVal /hsl(\d\{1,3\}\s*,\s*\(100\|\d\{1,2\}\(\.\d\+\)\?\)%\s*,\s*\(100\|\d\{1,2\}\(\.\d\+\)\?\)%)/ contained contains=cssString,cssValueLength,cssValueInteger,cssValueNumber,cssValueAngle,cssValueTime,cssValueFrequency
syn match cssFuncVal /hsla(\d\{1,3\}\s*,\s*\(\(100\|\d\{1,2\}\(\.\d\+\)\?\)%\s*,\s*\)\{2\}\(1\|0\(\.\d\+\)\?\))/ contained contains=cssString,cssValueLength,cssValueInteger,cssValueNumber,cssValueAngle,cssValueTime,cssValueFrequency
syn keyword cssColorVal aliceblue antiquewhite aqua aquamarine azure contained
syn keyword cssColorVal beige bisque black blanchedalmond blue blueviolet brown burlywood contained
syn keyword cssColorVal cadetblue chartreuse chocolate coral cornflowerblue cornsilk crimson cyan contained
syn match cssColorVal /dark\(blue\|cyan\|goldenrod\|gray\|green\|grey\|khaki\)/ contained
syn match cssColorVal /dark\(magenta\|olivegreen\|orange\|orchid\|red\|salmon\|seagreen\)/ contained
syn match cssColorVal /darkslate\(blue\|gray\|grey\)/ contained
syn match cssColorVal /dark\(turquoise\|violet\)/ contained
syn keyword cssColorVal deeppink deepskyblue dimgray dimgrey dodgerblue firebrick contained
syn keyword cssColorVal floralwhite forestgreen fuchsia gainsboro ghostwhite gold contained
syn keyword cssColorVal goldenrod gray green greenyellow grey honeydew hotpink contained
syn keyword cssColorVal indianred indigo ivory khaki lavender lavenderblush lawngreen contained
syn keyword cssColorVal lemonchiffon lime limegreen linen magenta maroon contained
syn match cssColorVal /light\(blue\|coral\|cyan\|goldenrodyellow\|gray\|green\)/ contained
syn match cssColorVal /light\(grey\|pink\|salmon\|seagreen\|skyblue\|yellow\)/ contained
syn match cssColorVal /light\(slategray\|slategrey\|steelblue\)/ contained
syn match cssColorVal /medium\(aquamarine\|blue\|orchid\|purple\|seagreen\)/ contained
syn match cssColorVal /medium\(slateblue\|springgreen\|turquoise\|violetred\)/ contained
syn keyword cssColorVal midnightblue mintcream mistyrose moccasin navajowhite contained
syn keyword cssColorVal navy oldlace olive olivedrab orange orangered orchid contained
syn match cssColorVal /pale\(goldenrod\|green\|turquoise\|violetred\)/ contained
syn keyword cssColorVal papayawhip peachpuff peru pink plum powderblue purple contained
syn keyword cssColorVal red rosybrown royalblue saddlebrown salmon sandybrown contained
syn keyword cssColorVal seagreen seashell sienna silver skyblue slateblue contained
syn keyword cssColorVal slategray slategrey snow springgreen steelblue tan contained
syn keyword cssColorVal teal thistle tomato turquoise violet wheat contained
syn keyword cssColorVal white whitesmoke yellow yellowgreen contained
syn match cssColorVal /<white>/ contained
syn keyword cssColorProp color opaticy contained
syn match cssColorProp /color-profile/ contained

" Box
syn match cssBoxProp /\(\(margin\|padding\)-\(top\|right\|bottom\|left\)\|\(margin\|padding\)\)/ contained
syn match cssBoxProp /\(min\|max\)-\(width\|height\)/ contained
syn match cssBoxProp /box-\(align\|decoration-break\|direction\|flex-group\|flex\|lines\)/ contained
syn match cssBoxProp /box-\(ordinal-group\|orient\|pack\|shadow\|sizing\)/ contained
syn match cssBoxProp /\(outline-\(color\|offset\|style\|width\)\|outline\)/ contained
syn keyword cssBoxProp width height contained

" Text
syn match cssTextProp /text-\(align-last\|align\|decoration\|emphasis\|height\|indent\|justify\|outline\|shadow\|transform\|wrap\|overflow\)\|text/ contained
syn match cssTextProp /\(line-stacking-\(ruby\|shift\|strategy\)\|line-stacking\|line-height\)/ contained
syn match cssTextProp /vertical-align/ contained
syn match cssTextProp /letter-spacing/ contained
syn match cssTextProp /white-\(space-collapse\|space\)/ contained
syn match cssTextProp /word-\(break\|spacing\|wrap\)/ contained
syn match cssTextProp "\<word-wrap\>" contained
syn match cssTextVal "\<break-word\>" contained
syn match cssTextVal "\<break-all\>" contained
syn match cssTextVal "\<line-through\>" contained
syn match cssTextVal /text-\(top\|bottom\)/ contained
syn keyword cssTextVal uppercase lowercase ellipsis middle contained

" List
syn match cssListProp /\(list-style-\(type\|image\|position\)\|list-style\)/ contained
syn keyword cssListVal armenian circle disc georgian hebrew square contained
syn match cssListVal /cjk-ideographic/ contained
syn match cssListVal /\(decimal-leading-zero\|decimal\)/ contained
syn match cssListVal /\(\(hiragana\|katakana\)-iroha\|\(hiragana\|katakana\)\)/ contained
syn match cssListVal /\(lower\|upper\)-\(alpha\|latin\|roman\)/ contained
syn match cssListVal /lower-greek/ contained

" Visual formatting
syn keyword cssVisualProp display position top right bottom left float clear clip contained
syn keyword cssVisualProp zoom visibility cursor direction outline resize contained
syn keyword cssVisualProp opacity contained
syn match cssVisualProp /z-index/ contained
syn match cssVisualProp /\(overflow-\(style\|[xy]\)\|overflow\)/ contained
syn keyword cssVisualVal inline block compact contained
syn match cssVisualVal '\<table\>' contained
syn match cssVisualVal /\(inline-\(block\|table\)\|list-item\|run-in\)/ contained
syn match cssVisualVal /table-\(row-group\|header-group\|footer-group\|row\|column-group\|column\|cell\|caption\)/ contained
syn match cssVisualVal /\<ruby\>-\(base-group\|text-group\|base\|text\)/  contained
syn keyword cssVisualVal static relative absolute fixed contained
syn keyword cssVisualVal ltr rtl embed bidi-override pre nowrap contained
syn keyword cssVisualVal crosshair help move pointer progress wait contained
syn keyword cssVisualVal e-resize n-resize ne-resize nw-resize s-resize se-resize sw-resize w-resize contained

" Table
syn match cssTableProp /border-\(collapse\|spacing\)/ contained
syn match cssTableProp /\(table-layout\|caption-side\|empty-cells\)/ contained

" Generated content
syn match cssCommonProp /counter-\(reset\|increment\)/ contained
syn keyword cssCommonProp content quotes contained

" Print
syn match cssPrintProp /break-\(before\|after\|inside\)/
syn match cssPrintProp /\(page-break-\(before\|after\|inside\)\|page-policy\)/
syn keyword cssPrintProp orphans windows

" special keywords
syn match cssSpecialProp /-\(webkit\|moz\|ms\|o\)-/
syn match cssRuleProp /@\(media\|font-face\|charset\|import\|page\|namespace\)/
" http://www.w3.org/TR/selectors/
syn match cssPseudo /:\(link\|visited\|active\|hover\|focus\|before\|after\)/
syn match cssPseudo /:\(target\|lang\|enabled\|disabled\|checked\|indeterminate\)/
syn match cssPseudo /:\(root\|\(first\|last\|only\)-\(child\|of-type\)\|empty\)/
syn match cssPseudo /:\(nth-last-\|nth-\)\(child\|of-type\)(\<\S\+\>)/
syn match cssPseudo /:not(\<\S*\>)/
syn match cssPseudo /:first-\(line\|letter\)/
syn match cssPseudo /::\(first-\(line\|letter\)\|before\|after\|selection\)/

" CSS3 Advanced http://meiert.com/en/indices/css-properties/
syn keyword cssAdvancedProp appearance azimuth binding bleed columns crop hyphens icon
syn keyword cssAdvancedProp phonemes resize richness size volumne
syn match cssAdvancedProp /\(animation-\(delay\|direction\|duration\|name\|iteration-count\|play-state\|timing-function\)\|animation\)/
syn match cssAdvancedProp /alignment-\(adjust\|baseline\)/
syn match cssAdvancedProp /\(backface-visibility\baseline-shift\)/
syn match cssAdvancedProp /bookmark-\(label\|level\|state\|target\)/
syn match cssAdvancedProp /column-\(count\|fill\|gap\|rule-\(color\|style\|width\)\|rule\|span\|width\)/
syn match cssAdvancedProp /\(cue-\(after\|before\)\|cue\)/
syn match cssAdvancedProp /dominant-baseline/
syn match cssAdvancedProp /drop-initial-\(size\|value\|\(after\|before\)-\(adjust\|align\)\)/
syn match cssAdvancedProp /\(fit-position\|fit\)/
syn match cssAdvancedProp /\(float-offset\|hanging-punctuation\)/
syn match cssAdvancedProp /grid-\(columns\|rows\)/
syn match cssAdvancedProp /hyphenate-\(after\|before\|character\|lines\|resource\)/
syn match cssAdvancedProp /image-\(orientation\|rendering\|resolution\)/
syn match cssAdvancedProp /inline-box-align/
syn match cssAdvancedProp /\(mark-\(after\|before\)\|mark\|marks\)/
syn match cssAdvancedProp /marquee-\(direction\|loop\|play-count\|speed\|style\)/
syn match cssAdvancedProp /move-to/
syn match cssAdvancedProp /nav-\(down\|index\|left\|right\|up\)/
syn match cssAdvancedProp /\(pause-\(after\|before\)\|pause\)/
syn match cssAdvancedProp /\(perspective-origin\|perspective\)/
syn match cssAdvancedProp /\(pitch-range\|pitch\)/
syn match cssAdvancedProp /presentation-level/
syn match cssAdvancedProp /punctuation-trim/
syn match cssAdvancedProp /rendering-intent/
syn match cssAdvancedProp /\(rest-\(after\|before\)\|rest\)/
syn match cssAdvancedProp /\(rotation-point\|rotation\)/
syn match cssAdvancedProp /ruby-\(align\|overhang\|position\|span\)/
syn match cssAdvancedProp /\(target-\(name\|new\|position\)\|target\)/
syn match cssAdvancedProp /\(transform-\(origin\|style\)\|transform\)/
syn match cssAdvancedProp /\(transition-\(delay\|duration\|property\|timing-function\)\|transition\)/
syn match cssAdvancedProp /voice-\(balance\|duration\|family\|pitch-range\|pitch\|rate\|stress\|volume\)/

syn match cssAdvancedVal /\(ease-\(in\|out\|in-out\)\|ease\)/ contained

" CSS3 Advanced value 
"syn match cssAdvancedVal 


if main_syntax == "css"
  syn sync minlines=10
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_css_syn_inits")
  if version < 508
    let did_css_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cssString String
  HiLink cssComment Comment
  HiLink cssTagName Statement
  HiLink cssSelector Function
  HiLink cssBackgroundProp StorageClass
  HiLink cssTableProp StorageClass
  HiLink cssBorderProp StorageClass
  HiLink cssFontProp StorageClass
  HiLink cssColorProp StorageClass
  HiLink cssBoxProp StorageClass
  HiLink cssTextProp StorageClass
  HiLink cssListProp StorageClass
  HiLink cssVisualProp StorageClass
  HiLink cssAdvancedProp StorageClass
  HiLink cssCommonProp StorageClass
  HiLink cssSpecialProp Special 
  HiLink cssImportant Special
  HiLink cssRuleProp PreProc
  HiLink cssPseudo PreProc

  HiLink cssColorVal Constant
  HiLink cssCommonVal Type
  HiLink cssFontVal Type
  HiLink cssListVal Type
  HiLink cssTextVal Type
  HiLink cssVisualVal Type
  HiLink cssBorderVal Type
  HiLink cssBackgroundVal Type
  HiLink cssFuncVal Function
  HiLink cssAdvancedVal Function

  HiLink cssValueLength Number
  HiLink cssValueInteger Number
  HiLink cssValueNumber Number
  HiLink cssValueAngle Number
  HiLink cssValueTime Number
  HiLink cssValueFrequency Number
  delcommand HiLink
endif

let b:current_syntax = "css"

if main_syntax == 'css'
  unlet main_syntax
endif
