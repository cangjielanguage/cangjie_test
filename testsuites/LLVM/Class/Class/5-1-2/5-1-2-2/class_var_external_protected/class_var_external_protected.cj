// DEPENDENCE: pkg cfg-ast
// EXEC: %compiler %cmp_opt -c pkg/pkg.cj -o pkg.%middle && %copycharjs pkg
// EXEC: %compiler %cmp_opt %n.cj pkg.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package class_var_external_protected

import pkg.*

class Data <: Base{
    var res : Int64
    init() {
        res = a
    }
}

func run(): Int64 {
    var test : Int64 = Data().res
    if ( test != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
