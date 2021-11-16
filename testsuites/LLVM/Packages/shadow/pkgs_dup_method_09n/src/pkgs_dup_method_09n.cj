// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj -o pkgb.%middle && %copycharjs src/pkgb
// EXEC: %compiler %cmp_opt %f   pkga.%middle pkgb.%middle
// EXEC： %run %run_opt %output %run_args

package pkg
import pkga.*
import pkgb.*


func run(): Int64 {
    var res1: Int32 = pkga.test
    var res2: Int32 = pkgb.test
    if (  res1 + res2  ==  3) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
