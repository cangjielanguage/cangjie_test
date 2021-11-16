// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

package aaa

func main():Int64 {
    var a = foo(Int32(1)) // EXPECTED: regex ambiguous match for function call 'foo'
    var c = foo(1) // EXPECTED: regex ambiguous match for function call 'foo'
    return 0
}

external func foo(x:Int32){
    return 1
}

enum TimeUnit {
    foo | foo(Int32) | foo(Int64,String)
}

