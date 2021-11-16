// DEPENDENCE: pkga
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f pkga.%middle -o %output 2>&1 | compare %f

import pkga.Coo

func main(): Int64 {
    var i: Int32 = 3
    var res: Int32 = Coo<String>.foo<Int32>(i)
    var b = pkga.Boo() // EXPECTED: regex error.*'Boo' is not a member of package 'pkga'
    return 0
}