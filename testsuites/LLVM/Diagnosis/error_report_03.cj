// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

func foo(x:Int64):Int64 {
    var i = x
    i = a        // EXPECTED: regex undeclared identifier 'a'
    var b = i + 1
    return b
}

func main():Int64{
    var res = foo(1) - 1
    return 0
}