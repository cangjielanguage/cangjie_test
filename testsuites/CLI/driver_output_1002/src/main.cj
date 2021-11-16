// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.cjo 2>&1 | compare %f
// ASSERT: regex file extension '.cjo' is not allowed, please change it

import pkga.*

func run(): Int64 {
    if (x != 1) {return 1}
    return 0
}

func main(): Int64 {
    return run()
}