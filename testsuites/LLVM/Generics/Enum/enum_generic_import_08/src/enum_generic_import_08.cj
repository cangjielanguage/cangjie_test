// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle  -o %output 2>&1 | compare %f

import pkga // EXPECTED: regex it doesn't support importing package by package name

func run(): Int64 {
    var time = pkga.TimeUnit<Int32>.Hour(3)
    var res: Int32 = match (time) {
        case Hour(x) => x-1
    }
    if ( res ==  2) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
