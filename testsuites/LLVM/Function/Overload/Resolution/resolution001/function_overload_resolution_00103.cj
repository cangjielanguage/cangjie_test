// DEPENDENCE: a b importcfg2
// EXEC: %compiler %cmp_opt -c ./a/a.cj -o ./a/a.%middle
// EXEC: %compiler %cmp_opt -c ./b/b.cj -o ./b/b.%middle
// EXEC: %compiler %cmp_opt %f -import-config importcfg2 ./a/a.%middle ./b/b.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

import a.*
import b.*

func main(){
    test(1) // EXPECTED: regex ambiguous match for function call
    return 1
}


