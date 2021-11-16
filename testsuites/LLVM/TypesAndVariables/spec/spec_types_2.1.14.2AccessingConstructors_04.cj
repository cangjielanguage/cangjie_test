// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

package p

enum E {
    | f(Int64)
    | f(Int64, Int64, Int64)
}
func f(a: Int64) {}
func f(a: Int64, b: Int64) {}
func g() {
    f(1)  // EXPECTED: regex error.*?ambiguous match for function call 'f'
    p.f(1)  // ok
    E.f(1)  // ok
    f(1, 2)  // ok, find f(a: Int64, b: Int64) 
    f(1, 2, 3)  // ok, find E.f(Int64, Int64, Int64)
}
func main(){
    g()
    return 0
}

