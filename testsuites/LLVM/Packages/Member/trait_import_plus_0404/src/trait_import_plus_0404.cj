// DEPENDENCE: ../src ../cfg-asta ../cfg-ast
// EXEC: %compiler %cmp_opt %pkg_opt -c src/pkga/ src/pkgb -o ./ 2>&1 | compare %f
// ASSERT: regex are in circular dependencies.

import pkgb.*

func run(): Int64 {
    let x: Int64 = pkgb.boo()
    return x
}

func main(): Int64 {
    return run()
}
