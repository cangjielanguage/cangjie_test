// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj -o pkgb.%middle && %copycharjs src/pkgb
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.add
import pkgb.*


func run(): Int64 {
    var res1: Int32 = pkga.add(2, 3)
    var res2: Int32 = pkgb.add(3, 4)
    if (  res1 == 5 && res2 ==  8) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
