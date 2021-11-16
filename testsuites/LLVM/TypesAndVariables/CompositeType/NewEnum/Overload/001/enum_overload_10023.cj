// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
package p

enum E {
| f(Int64)
| f(Int64, Int64, Int64)
}

func f(a: Int64) {}
func f(a: Int64, b: Int64) {}
func main() {
// f(1) // error
p.f(1) // ok
E.f(1) // ok
f(1, 2) // ok, find f(a: Int64, b: Int64)
f(1, 2, 3) // ok, find E.f(Int64, Int64, Int64)
return 0
}