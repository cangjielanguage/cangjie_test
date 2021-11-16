// DEPENDENCE: usg_16metaprogramming_macro_call_03.cj
// EXEC: %compiler %cmp_opt %f -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt usg_16metaprogramming_macro_call_03.cj ./%n.o %use_ast -o %output
// EXEC: %run %run_opt %output

package macro_definition

from ast import ast.*

external macro Foo(attrTokens: Tokens, inputTokens: Tokens) : Tokens {
    return attrTokens + inputTokens
}