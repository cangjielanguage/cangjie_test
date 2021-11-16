// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record Time {
let year: Int32 = 1
let day: Int32 = 2
}

trait TimeTrait {
func update(a: This): This
}

append Time with TimeTrait {
func update(a: Time): Time {
a.year = a.year + 1 // EXPECTED: regex-auto cannot assign to value : 'Record-Time.year' is an initialized 'let' constant
a.day = a.day + 2 // EXPECTED: regex-auto cannot assign to value : 'Record-Time.day' is an initialized 'let' constant
return a
}
}

let res = Time().update()
let res1 = res.year
let res2 = res.day

func run(): Int64 {
if ( res1 == 2 && res2 == 4) {
return 0
}
return 1
}

func main(): Int64 {
return run()
}
