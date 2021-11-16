// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan overflow annotation must be used before funcdecl or lambdaExpr

package test

from ast import ast.*

// not supported yet.

@overflowSaturating
external macro M(m:Tokens){
    var a : Int8 = 127
    var b = a+a
    print("b is ${b}\n")
    return m
}
