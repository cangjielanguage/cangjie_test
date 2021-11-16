// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var b = foo(1,'a') // EXPECTED: regex-auto no matching function declaration for function call 'foo'
    return 0
}

func foo(x:Int32){
    return 1
}

func foo(x:Int64){
    return 2
}

func foo(x:Int64,y:String){
    return 3
}

enum TimeUnit {
    foo | foo(Int32) | foo(Int64,String)
}
