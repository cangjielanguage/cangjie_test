// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt %f pkga.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.TimeUnit

class TimeUnit {
    static var Hour: Int32 = 3
}

func run(): Int64 {
    var timea = pkga.TimeUnit<Int32>.Hour(3)
    var res = TimeUnit.Hour
    var resa: Int32 = match (timea) {
        case Hour(x) => 2
    }
    if (  res + resa ==  5) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
