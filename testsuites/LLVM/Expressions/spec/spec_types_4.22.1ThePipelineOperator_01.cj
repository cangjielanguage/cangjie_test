// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func f(x: Int32): Int32 { x + 1 }
func h(b: Bool) { b }
func g<T>(x: T): T { x }
class A {
    let a: Int32
    let b: Int32
    init(x: Int32) {
        a = x
        b = 0
    }
    init(x: Int32, y: Int32) {
        x |> init  // EXPECTED: regex error.*?'init' is not allowed to call the constructor, use 'this' instead
        b = y
    }
}

func main(): Int64 {
    let a: Int32 = 1
    var res = a |> f  // ok
    var res1 = a |> {x: Int32 => x + 1}  // ok
    let res3 = a < 0 || a > 10 |> h  // Equivalence：(a < 0 || a > 10)  |> h
     
    return 0
     
}


