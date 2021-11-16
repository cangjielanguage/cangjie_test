// DEPENDENCE: pkg cfg-ast
// EXEC: %compiler %cmp_opt -c pkg/pkg.cj -o pkg.%middle && %copycharjs pkg
// EXEC: %compiler %cmp_opt %n.cj pkg.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package class_var_external_static

import pkg.Data

func main(): Int64 {
    let b = Data.a
    if (b != 1) {
        return 1
    }
    return 0
}
