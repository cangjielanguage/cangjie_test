// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle -import-config cfg-ast -o %output 2>&1 |compare %f
// ASSERT:regex-not core dump
// ASSERT:regex-not stack trace

import pkga.*

func main(): Int64 {
    var res2 = GenRec.foo()    // EXPECTED: regex undeclared identifier 'GenRec'
    return 0
}

