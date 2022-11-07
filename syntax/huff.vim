" only load this syntax file if no other was loaded
if exists('b:current_syntax')
  finish
endif


" Opcodes
" Environment opcodes
syntax keyword huffEnvOpcode
	\ address
	\ balance
	\ origin
	\ caller
	\ callvalue
	\ calldataload
	\ calldatasize
	\ calldatacopy
	\ codesize
	\ codecopy
	\ gasprice
	\ returndatasize
	\ returndatacopy
	\ blockhash
	\ coinbase
	\ timestamp
	\ number
	\ difficulty
	\ gaslimit
	\ chainid
	\ selfbalance
	\ basefee

" Trie opcodes
syntax keyword huffTrieOpcode
	\ extcodesize
	\ extcodecopy
	\ extcodehash
	\ sload
	\ sstore
	\ selfdestruct

" Call opcodes
syntax keyword huffCallOpcode
	\ create
	\ call
	\ callcode
	\ delegatecall
	\ create2
	\ staticcall

" Push opcodes
syntax match huffRegularOpcode
	\ "\<push\(3[1-2]\|[1-9]\|[1-2][0-9]\)\>"
	\ nextgroup=huffConstant,huffLabelConst,huffExpressionMacro
	\ skipwhite

" Decimal constant
syntax match huffConstant	"\<\d*\>"	contained
" Hex constant
syntax match huffConstant	"\<0x\x*\>"	contained
" Binary constant
syntax match huffConstant	"\<0b[0-1]*\>"	contained
" Octal constant
syntax match huffConstant	"\<0o\o*\>"	contained

" Regular opcodes
syntax match huffRegularOpcode "\<swap\(1[0-6]\|[1-9]\)\>"
syntax match huffRegularOpcode "\<dup\(1[0-6]\|[1-9]\)\>"
syntax match huffRegularOpcode "\<log\([0-4]\)\>"

syntax keyword huffRegularOpcode
	\ stop
	\ add
	\ mul
	\ sub
	\ div
	\ sdiv
	\ mod
	\ smod
	\ addmod
	\ mulmod
	\ exp
	\ signextend
	\ lt
	\ gt
	\ slt
	\ sgt
	\ eq
	\ iszero
	\ and
	\ or
	\ xor
	\ not
	\ byte
	\ shl
	\ shr
	\ sar
	\ keccak256
	\ pop
	\ mload
	\ mstore
	\ mstore8
	\ jump
	\ jumpi
	\ pc
	\ msize
	\ gas
	\ jumpdest
	\ revert
	\ invalid
	\ return

hi def link huffConstant Constant
hi def link huffEnvOpcode Special
hi def link huffTrieOpcode Special
hi def link huffCallOpcode Special
hi def link huffRegularOpcode Statement

" Huff keywords
syn match huffMethod '#include'
syn match huffDefine '#define'

syn keyword huffTodo TODO XX FIXME NOTE TBD
syn keyword huffKeyword
    \ takes
    \ returns

syn match huffFunctionCall          /\zs[a-zA-Z_$][0-9a-zA-Z_$]*\ze(.*)/

syn keyword huffConstant nextgroup=huffConstantName skipwhite skipempty
    \ constant

syn match huffConstantName contained skipwhite skipempty
    \ '\v<[0-9a-zA-Z_]*'

syn keyword huffMacro nextgroup=huffMacroName skipwhite skipempty
    \ macro

syn match huffMacroName contained skipwhite skipempty
    \ '\v<[0-9a-zA-Z_]*'

syn keyword huffTemplate nextgroup=huffTemplateName skipwhite skipempty
    \ template

syn match huffTemplateName contained skipwhite skipempty
    \ '<[0-9a-zA-z_,]*>'

syn region huffComment          start=/\/\// end=/$/ contains=huffTodo
syn region huffComment          start=/\/\*/ end=/\*\// contains=huffTodo
syn region huffString           start=/\v"/ skip=/\v\\./ end=/\v"/
syn region huffString           start="\v'" skip="\v\\." end="\v'"

hi def link huffTodo Todo
hi def link huffComment Comment
hi def link huffKeyword Keyword
hi def link huffDefine Define
hi def link huffMethod Special
hi def link huffString String
hi def link huffFunctionCall PreProc
hi def link huffConstant Keyword
hi def link huffConstantName Type
hi def link huffMacro Keyword
hi def link huffMacroName Function
hi def link huffTemplate Special
hi def link huffTemplateName Constant

" Function
syn match   solFunction          /\<function\>/ nextgroup=solFuncName,solFuncArgs skipwhite
syn match   solFuncName          contained /\<[a-zA-Z_$][0-9a-zA-Z_$]*/ nextgroup=solFuncArgs skipwhite
syn region  solFuncArgs          contained matchgroup=solFuncParens start='(' end=')' contains=solFuncArgCommas,solBuiltinType nextgroup=solModifierName,solFuncReturns keepend skipwhite skipempty
syn match   solModifierName      contained /\<[a-zA-Z_$][0-9a-zA-Z_$]*/ nextgroup=solModifierArgs,solModifierName skipwhite
syn region  solModifierArgs      contained matchgroup=solFuncParens start='(' end=')' contains=solFuncArgCommas nextgroup=solModifierName,solFuncReturns skipwhite
syn region  solFuncReturns       contained matchgroup=solFuncParens start='(' end=')' contains=solFuncArgCommas,solBuiltinType
syn match   solFuncArgCommas     contained ','

hi def link solFunction          Type
hi def link solFuncName          Function
hi def link solModifierName      Function

" Event
syn match   solEvent             /\<event\>/ nextgroup=solEventName,solEventArgs skipwhite
syn match   solEventName         contained /\<[a-zA-Z_$][0-9a-zA-Z_$]*/ nextgroup=solEventArgs skipwhite
syn region  solEventArgs         contained matchgroup=solFuncParens start='(' end=')' contains=solEventArgCommas,solBuiltinType,solEventArgSpecial skipwhite skipempty
syn match   solEventArgCommas    contained ','
syn match   solEventArgSpecial   contained 'indexed'

hi def link solEvent             Type
hi def link solEventName         Function
hi def link solEventArgSpecial   Label


let b:current_syntax = 'huff'
