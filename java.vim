" Vim syntax file
" Language      :   Java
" Maintainer    :   Yuki MIYAMOTO <k15121kk[at]maslab.aitech.ac.jp>

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

sy sync minlines=200
sy sync maxlines=500

" keywords

"-----------------------------------------------------------------------------------------
sy keyword javaConstant         this super
sy keyword javaConstant         null
sy keyword javaBoolean          true false
"-----------------------------------------------------------------------------------------
sy keyword javaStatement        return
sy keyword javaStatement        break continue
sy keyword javaStatement        yield
sy keyword javaConditional      if else switch
sy keyword javaRepeat           for while do
sy keyword javaLabel            case default
sy keyword javaOperator         new                 skipwhite skipempty nextgroup=javaType
sy keyword javaOperator         instanceof          skipwhite skipempty nextgroup=javaType
sy keyword javaAccessKeyword    public protected private
sy keyword javaException        throw
sy keyword javaException        try catch finally
"-----------------------------------------------------------------------------------------
sy keyword javaPreProc          package
"-----------------------------------------------------------------------------------------
sy keyword javaType             void
sy keyword javaType             char
sy keyword javaType             byte short int long
sy keyword javaType             boolean
sy keyword javaType             float double
sy keyword javaType             var
sy keyword javaStorageClass     static transient final abstract
sy keyword javaStorageClass     volatile strictfp native
sy keyword javaStorageClass     synchronized
sy keyword javaStructure        class interface     skipwhite skipempty nextgroup=javaType
sy keyword javaStructure        enum                skipwhite skipempty nextgroup=javaType
sy keyword javaStructure        extends implements  skipwhite skipempty nextgroup=javaType
sy keyword javaStructure        permits             skipwhite skipempty nextgroup=javaType
sy keyword javaStructure        throws              skipwhite skipempty nextgroup=javaType
sy keyword javaStructure        record              skipwhite skipempty nextgroup=javaType
"-----------------------------------------------------------------------------------------
sy keyword javaDebug            assert
"-----------------------------------------------------------------------------------------
sy keyword javaError            goto const
"-----------------------------------------------------------------------------------------
sy keyword javaTodoTask         TODO FIXME  contained
sy keyword javaTodoNote         NOTE        contained
sy keyword javaTodoWarn         XXX NB      contained
"-----------------------------------------------------------------------------------------

" pattern

"---------------------------------------------------------------------------------------------------
sy match  javaOperator      '[+\-\~!\*/%<>=&\^|?:]'
sy match  javaDelimiter     '[()\.\[\],;{}]'
sy match  javaIdentifier    '\v<%(\h|\$)%(\w|\$)*>'
sy match  javaFunction      '\v<%(\h|\$)%(\w|\$)*>\ze\_s*\(\_.{-}\)'
sy match  javaType          '\v<\$*\u%(\w|\$)*>'
sy match  javaConstant      '\v<%(\u|[_\$])%(\u|\d|[_\$])*>'
"---------------------------------------------------------------------------------------------------
sy match  javaComment       '//.*'                  contains=@javaTodos
sy region javaComment       start='/\*' end='\*/'   contains=@javaTodos
"---------------------------------------------------------------------------------------------------
sy match  javaString        '\v"%([^\\"]|\\.)*"'
sy region javaString        start='"""\s*$' end='"""'
sy match  javaCharacter     "'[^\\']'"
sy match  javaCharacter     "'\\[btnfr\"'\\]'"
sy match  javaCharacter     "\v'\\%(\o{1,3}|u\x{4})'"
"---------------------------------------------------------------------------------------------------
sy match  javaDecNumber     '\v\c<\d%(\d|_*\d)*L=>'
sy match  javaOctNumber     '\v\c<0%(\o|_*\o)+L=>'
sy match  javaHexNumber     '\v\c<0X\x%(\x|_*\x)*L=>'
sy match  javaBinNumber     '\v\c<0B[01]%([01]|_*[01])*L=>'
"---------------------------------------------------------------------------------------------------
sy match  javaDecFloat      '\v\c<\d%(\d|_*\d)*%(E[+-]=\d%(\d|_*\d)*[FD]=|[FD])>'
sy match  javaDecFloat      '\v\c<\d%(\d|_*\d)*\.%(\d%(\d|_*\d)*)=%(E[+-]=\d%(\d|_*\d)*)=[FD]='
sy match  javaDecFloat      '\v\c\.\d%(\d|_*\d)*%(E[+-]=\d%(\d|_*\d)*)=[FD]='
sy match  javaHexFloat      '\v\c<0X\x%(\x|_*\x)*%(P[+-]=\d%(\d|_*\d)*[FD]=|[FD])>'
sy match  javaHexFloat      '\v\c<0X\x%(\x|_*\x)*\.%(\x%(\x|_*\x)*)=%(P[+-]=\d%(\d|_*\d)*)=[FD]='
sy match  javaHexFloat      '\v\c<0X\.\x%(\x|_*\x)*%(P[+-]=\d%(\d|_*\d)*)=[FD]='
"---------------------------------------------------------------------------------------------------
sy match  javaPreProc       '@\h\w*'
sy match  javaInclude       '\v<import%(\_s+static)=>'
\   skipwhite skipempty nextgroup=javaPackagePath
sy match  javaPackagePath   '\v<%(%(\w|\$)+\_s*\.\_s*)*%(\w|\$)+>'
\   contained contains=javaIdentifier,javaDelimiter
"---------------------------------------------------------------------------------------------------

" Cluster

"-------------------------------------------------------------------------------
sy cluster javaTodos    contains=javaTodoTask,javaTodoNote,javaTodoWarn
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------

" Highlighting

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508
  if version < 508
    let did_antlr_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " Java

  "-------------------------------------------------
  HiLink javaComment         Comment
  "-------------------------------------------------
  HiLink javaConstant        Constant
  HiLink javaString          String
  HiLink javaCharacter       Character
  HiLink javaNumber          Number
  HiLink javaBoolean         Boolean
  HiLink javaFloat           Float
  "-------------------------------------------------
  HiLink javaIdentifier      Identifier
  HiLink javaFunction        Function
  "-------------------------------------------------
  HiLink javaStatement       Statement
  HiLink javaConditional     Conditional
  HiLink javaRepeat          Repeat
  HiLink javaLabel           Label
  HiLink javaOperator        Operator
  HiLink javaKeyword         Keyword
  HiLink javaException       Exception
  "-------------------------------------------------
  HiLink javaPreProc         PreProc
  HiLink javaInclude         Include
  HiLink javaDefine          Define
  HiLink javaMacro           Macro
  HiLink javaPreCondit       PreCondit
  "-------------------------------------------------
  HiLink javaType            Type
  HiLink javaStorageClass    StorageClass
  HiLink javaStructure       Structure
  HiLink javaTypedef         Typedef
  "-------------------------------------------------
  HiLink javaSpecial         Special
  HiLink javaSpecialChar     SpecialChar
  HiLink javaTag             Tag
  HiLink javaDelimiter       Delimiter
  HiLink javaSpecialComment  SpecialComment
  HiLink javaDebug           Debug
  "-------------------------------------------------
  HiLink javaUnderlined      Underlined
  "-------------------------------------------------
  HiLink javaIgnore          Ignore
  "-------------------------------------------------
  HiLink javaError           Error
  "-------------------------------------------------
  HiLink javaTodo            Todo
  "-------------------------------------------------

  " Reduction

  "-------------------------------------------------
  HiLink javaDecNumber       javaNumber
  HiLink javaOctNumber       javaNumber
  HiLink javaHexNumber       javaNumber
  HiLink javaBinNumber       javaNumber
  "-------------------------------------------------
  HiLink javaDecFloat        javaFloat
  HiLink javaHexFloat        javaFloat
  "-------------------------------------------------
  HiLink javaAccessKeyword   javaKeyword
  "-------------------------------------------------
  HiLink javaTodoTask        javaTodo
  HiLink javaTodoNote        javaTodo
  HiLink javaTodoWarn        javaTodo
  "-------------------------------------------------

  delcommand HiLink
endif

let b:current_syntax = "java"

