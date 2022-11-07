" only load this syntax file if no other was loaded
if exists('b:current_syntax')
  finish
endif

" Optodes
syn keyword ioOpcodes sstore sload mstore8 mstore mload pop msize balance address returndatacopy returndatasize extcodecopy extcodesize gasprice caller origin gaslimit difficulty number timestamp coinbase blockhash codecopy codesize calldatacopy calldatasize calldataload callvalue gas
syn keyword sideEffectOpcodes log4 log3 log2 log1 log0 jumpdest getpc jumpi jump create2 staticcall delegatecall callcode call create
syn keyword calculationOpcodes not xor or and ror rol sar shr shl keccak sha3 byte iszero eq sgt slt gt lt signextend exp mulmod addmod smod mod sdiv div sub mul add
syn keyword stopOpcodes selfdestruct invalid revert return stop
syn keyword stackOpcodes push1 push2 push3 push4 push5 push6 push7 push8 push9 push10 push11 push12 push13 push14 push15 push16 push17 push18 push19 push20 push21 push22 push23 push24 push25 push26 push27 push28 push29 push30 push31 push32 dup1 dup2 dup3 dup4 dup5 dup6 dup7 dup8 dup9 dup10 dup11 dup12 dup13 dup14 dup15 dup16 swap1 swap2 swap3 swap4 swap5 swap6 swap7 swap8 swap9 swap10 swap11 swap12 swap13 swap14 swap15 swap16 sha3

hi def link ioOpcodes Special
hi def link sideEffectOpcodes Special
hi def link calculationOpcodes Special
hi def link stopOpcodes Special
hi def link stackOpcodes Special

syn match huffMethod '#include'
syn match huffDefine '#define'

syn keyword huffTodo TODO XX FIXME NOTE TBD
syn keyword huffKeyword
    \ takes
    \ returns
    \ constant

syn match huffFunctionCall          /\zs[a-zA-Z_$][0-9a-zA-Z_$]*\ze(.*)/

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
