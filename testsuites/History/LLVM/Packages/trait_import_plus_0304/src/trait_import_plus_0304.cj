// DEPENDENCE: ../src ../cfg-asta ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o ./pkga.%middle 
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj pkga.%middle  -o ./pkgb.%middle 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan imported trait 'Color' cannot be implemented for imported type 'String'

import pkgb.*

func run(): Int64 {
    let x: Int64 = pkgb.boo()
    return x
}

func main(): Int64 {
    return run()
}
