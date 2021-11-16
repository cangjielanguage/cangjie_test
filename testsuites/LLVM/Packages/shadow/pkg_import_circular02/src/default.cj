// DEPENDENCE: ../src
// EXEC-PIPE-1: %compiler %cmp_opt %mod_opt ./ -o ./ 2>&1 | compare %f
// ASSERT: regex packages pkg.* pkg.* pkg.* are in circular dependencies

import pkga.*

func main(): Int64 {
    return 0
}
