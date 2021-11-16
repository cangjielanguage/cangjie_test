// EXEC-PIPE: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// EXEC: %run %run_opt %output %run_args

var a = {
    let a: Int32 = 1
    func foo(){
    let b:Int32 = 1
    {
        var a = a+b; // EXPECTED: regex warning.*?the variable 'a' actually captures this decl
        var y = a;
        return a+y // 4
    }()
    let a: Int32 = 1
    }
    foo()
}

func main():Int64 {
    if ( a() != () ) {
        return 1
    }
    return 0
}
