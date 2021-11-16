// DEPENDENCE: usg_16metaprogramming_macro_call_01.cj
// EXEC: %compiler %cmp_opt %f -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt usg_16metaprogramming_macro_call_01.cj ./%n.o %use_ast -o %output
// EXEC: %run %run_opt %output

package define

from ast import ast.*

external macro TestDef(input: Tokens): Tokens {
    print("I'm in macro body\n")
    return input
}