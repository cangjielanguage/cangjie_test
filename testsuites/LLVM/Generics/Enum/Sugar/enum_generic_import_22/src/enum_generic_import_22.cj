// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt %f pkga.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*

record TimeUnit {
    TimeUnit(let a : Int64) {}
    func Hour(): Int64 {
        return a
    }
}

func run(): Int64 {
    var timea = pkga.TimeUnit.Hour(5)
    var res = TimeUnit(3).Hour()
    var resa: Int64 = match (timea) {
        case Hour(x) => 2
    }
    if (res + resa ==  5) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
