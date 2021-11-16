// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt %f pkga.%middle  -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.TimeUnit


func run(): Int64 {
    var time = TimeUnit<Int32>.Hour(3)
    var time2 = Hour<Int32>(3)
    var res: Int32 = match (time) {
        case Hour(x) => 2
    }
    var res2: Int32 = match (time2) {
        case Hour(x) => 3
    }
    if ( res ==  2 && res2 == 3) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
