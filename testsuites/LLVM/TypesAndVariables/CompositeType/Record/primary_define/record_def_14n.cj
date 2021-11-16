// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan expected '>' in the end of collection or tuple type or type parameters
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record Test<T U V> {
    let a: T
    let b: U
    let c: V

    Test(x: T, y: U, z: V){
        a = x
        b = y
        c = z
    }
}

func run(): Int64 {
    var a: Int64 = 1
    var b: Float64 = 2.2
    var c: Int64 = 2
    var res1: Int64
    var res2: Float64
    var res3: Int64
    var test: Test<Int64, Float64, Int64> = Test<Int64, Float64, Int64>(a, b, c)
    res1 = test.a
    res2 = test.b
    res3 = test.c
    if (res1 == 1 && res2 == 2.2 && res3 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
