// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

var n = { // EXPECTED: regex error.*?lambda captured a mutable variable transitively, lambda cannot be assigned to a variable
    var a: Int32 = 1
    let b:Int32 = 1
    {var x = a+b;return x}()
}

