// DEPENDENCE: usg_16metaprogramming_macro_call_02.cj
// EXEC: %compiler %cmp_opt %f -c -backend-options="-fPIC"
// EXEC: %compiler %cmp_opt usg_16metaprogramming_macro_call_02.cj ./%n.o %use_ast -o %output
// EXEC: %run %run_opt %output

package macro_definition

from ast import ast.*

external macro ModifyFunc(input: Tokens): Tokens {
    print("I'm in macro body\n")
    return quote(
    func MyFunc(composer: Composer) {
        composer.start(123)
        var counter = 0
        composer.end()
    })
}