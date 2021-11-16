// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base {
    var one : Int32 = 1
}

class Data Base {  // EXPECTED: regex expected '<:' to inherit or '{' to open a scope
    var res = one  // EXPECTED: regex undeclared identifier 'one'
}
