// DEPENDENCE: enum_type_0502a cfg-ast
// EXEC: %compiler %cmp_opt -c enum_type_0502a/enum_type_0502a.cj -o enum_type_0502a.%middle && %copycharjs enum_type_0502a
// EXEC: %compiler %cmp_opt %n.cj enum_type_0502a.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import enum_type_0502a.*

func run(): Int64 {
    var time = TimeUnit.Day
    var res: Int32 = match (time) {
        case $Year => 0
        case $Month => 1
        case $Day => 2
        case $Hour => 3
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
