" only load this syntax file if no other was loaded
if exists('b:current_syntax')
  finish
endif

syn keyword EVMDialect stop add sub mul div sdiv mod smod exp not lt gt slt sgt eq iszero and or xor byte shl shr sar addmod mulmod signextend keccak256 pc pop mload mstore mstore8 sload sstore msize gas address balance selfbalance caller callvalue calldataload calldatasize calldatacopy codesize codecopy extcodesize extcodecopy returndatasize returndatacopy extcodehash create create2 call callcode delegatecallcode staticcall return revert selfdestruct invalid log0 log1 log2 log3 log4 chainid origin gasprice blockhash coinbase timestamp number difficulty gaslimit

syn match huffMethod '#include'
syn match huffDefine '#define'

syn keyword huffTodo TODO XX FIXME NOTE TBD
syn keyword huffKeyword
    \ takes
    \ returns
    \ constant
    \ function

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
hi def link EVMDialect Special
hi def link huffString String
hi def link huffMacro Keyword
hi def link huffMacroName Function
hi def link huffTemplate Special
hi def link huffTemplateName Constant


let b:current_syntax = 'huff'
