// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt  %f pkga.%middle -o %output
// EXEC:  %run %run_opt %output %run_args

import pkga.*

func main(): Int64 {
    let a: Int32 = pkga.one
    let b: Int32 = pkga.t
//    let c: ()->Unit = pkga.test // 'test' is not a member of package 'pkga'
//    let d: Int32 = pkga.test() // 'test' is not a member of package 'pkga'
    if (a != 1) {
        return 1
    }
    if (b != 3) {
        return 1
    }
    return 0
}
