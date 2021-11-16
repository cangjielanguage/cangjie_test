// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt %f pkga.%middle   -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*

func main(): Int64 {
    var c = [1,2,*a,5,6]
    var d = [1,2,*b,5,6]
    if (c[2] == 3 && d.size() == 4) {
        return 0
    }
    return 1
}
