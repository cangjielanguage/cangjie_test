// DEPENDENCE: ../src ../cfg-ast ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o ./pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt %f  pkga.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*

func main(): Int64 {
    let a: Int32 = 1
    var b: Int32 = Data(a).get()
    Data(a).m++
    var c: Data = Data(a)
    c.m++
    pkga.Data(a).m++
    pkga.ext++
    print("n:"+Data.n.toString())
    if (b != 40 || c.m != 19 || pkga.ext != 2) {
        return 1
    }
    return 0
}
