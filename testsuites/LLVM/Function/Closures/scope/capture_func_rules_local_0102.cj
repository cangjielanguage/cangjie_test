// EXEC-PIPE: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// EXEC: %run %run_opt %output %run_args

var a = {
    let a: Int32 = 1
    let b:Int32 = 1
    func foo1(a!:Int32=a+b, // EXPECTED: regex warning.*?the variable 'a' actually captures this decl
        y!:Int32 = a){
        return a+y // 4
        }
    foo1() 
}

func main():Int64 {
    if ( a() != 4 ) {
        return 1
    }
    return 0
}
