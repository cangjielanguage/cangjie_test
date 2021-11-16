// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj -o pkgb.%middle && %copycharjs src/pkgb
// EXEC: %compiler %cmp_opt %f   pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package pkg
import pkga.test
import pkgb.*


func run(): Int64 {
    var res1: Int32 = pkga.test
    var res2: Int32 = pkgb.test
    var res3: Int32 = pkga.test
    if (  res1 + res2 + res3 ==  4) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
