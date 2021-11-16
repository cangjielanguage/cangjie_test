// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj -o pkgb.%middle && %copycharjs src/pkgb
// EXEC: %compiler %cmp_opt %f  pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.f
import pkgb.*

open class Base{
    var count: Int32
    init(x: Int32){
        count = x
    }
    init(){this(0)}
}

class Data <: Base{
    var result: Int32
    init(res: Int32){
        result = res + 1
    }
}

func run(): Int64 {
    var res1: Data = pkga.f<Data>(Data(3))
    var res2: Base = pkgb.f<Base>(Base(3))
    if (res1.result == 4 && res2.count == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
