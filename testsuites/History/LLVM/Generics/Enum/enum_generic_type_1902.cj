// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex-not [Error] unimplemented generate for 'Generics-T' type!
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
Day(T) | Hour
}

interface I<T> {
let time = TimeUnit<T>.Hour
}

func run(): Int64 {
let res1: Int32 = match I<Int32>.time{
case Day(x) => 16
case $Hour => 11
}

if ( res1 == 11 ) {
return 0
}
return 1
}

func main(): Int64 {
return run()
}
