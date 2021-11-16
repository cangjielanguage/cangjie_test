// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt %f pkga.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.TimeUnit

external enum TimeUnit {
      Hour
}

func run(): Int64 {
    var timea = pkga.TimeUnit<Int32>.Hour(4)
    var time = TimeUnit.Hour
    var resa: Int32 = match (timea) {
        case Hour(x) => 2
    }
    var res: Int32 = match (time) {
        case $Hour => 3
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
