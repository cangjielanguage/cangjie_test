// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt %f pkga.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*

func main(): Int64 {
    var i: Int32 = 90
    var result = match (i) {
        case grade => test(grade)
    }
    if (result == "good") {
        return 0
    }
    return 1
}

