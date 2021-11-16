// DEPENDENCE: define_20013.cj main_20013.cj
// EXEC: %compiler %cmp_opt define_20013.cj -c -backend-options="-fPIC" %enable_macro
// EXEC: %compiler %cmp_opt %f -c ./%llvm_attach/define_20013.o %use_pic_ast %enable_macro
// EXEC: %compiler %cmp_opt  ./%llvm_attach/define_20013.o ./%llvm_attach/%n.o %use_ast main_20013.cj -o %output
// EXEC: %run %run_opt %output %run_args

package use

from ast import ast.*
import define_20013.*

external interface op<T>{
    operator func !=(b:T):T
}

extend Tokens <: op<Tokens>{
    operator func !=(b:Tokens){this}
}



external macro Y(attr:Tokens, input:Tokens):Tokens{
    @X[123](123)!=@X[123](123)
}