// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt %f pkga.%middle  -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*

func run(): Int64 {
    var time = pkga.TimeUnit.Hour(3)
    var res: Int64 = match (time) {
        case Hour(x) => x-1
    }
    if (res == 2) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
