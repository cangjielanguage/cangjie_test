// DEPENDENCE: enum_type_0501a cfg-ast
// EXEC: %compiler %cmp_opt -c enum_type_0501a/enum_type_0501a.cj -o enum_type_0501a.%middle
// EXEC: %compiler %cmp_opt %n.cj enum_type_0501a.%middle   -o %n.%middle 2>&1 | compare %f
// ASSERT: regex-auto undeclared identifier 'TimeUnit'
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

import enum_type_0501a.*

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
