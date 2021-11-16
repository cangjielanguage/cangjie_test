// DEPENDENCE: ../p1 ../p2 ../p3
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt -c ./p3/*.cj -o p3.%middle
// EXEC-PIPE-1: %compiler %cmp_opt p1.%middle p2.%middle p3.%middle %f -o %output 2>&1 | compare %f

import p1.foo // Shadow
import p2.foo // Shadow
import p3.foo // Shadow

func foo(a: UInt64) { return 5 } // f5
func main(): Int64 {
    p1.foo(Int64(1)) // EXPECTED: regex error.*argument is mismatched with parameter type 'Int8'
    foo(Int32(1)) // EXPECTED: regex error.*ambiguous match for function call 'foo'
    foo(Int16(1)) // EXPECTED: regex-not error
    foo(Int8(1)) // EXPECTED: regex-not error
    foo(Int64(1)) // EXPECTED: regex-not error
    foo() // EXPECTED: regex-auto there occurs type ambiguity about func_decl class_decl on imported declaration 'foo'
    return 0
}
