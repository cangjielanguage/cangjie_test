// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

package aaa

func main():Int64 {
    var a = foo(Int64(1)) // EXPECTED: regex-not error
    var b = match (a) {
        case _ => 0
    }
    if ( b != 0) {
        return 2
    }
    var c = foo(1) // EXPECTED: regex ambiguous match for function call 'foo'
    var d = match (c) {
        case _ => 0
    }
    if ( d != 0) {
        return 2
    }
    return 0
}

external func foo(x:Int32){
    return 1
}

enum TimeUnit {
    foo | foo(Int64) | foo(Int64,String)
}

