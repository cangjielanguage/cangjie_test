// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dump

func main():Int64 {
    if ( Aoo().foo() != 8 ) {
        return 1
    }
    return 0
}

let c:Int32 = 1
class Aoo{
    func foo(){
        let a: Int32 = 1
        let b:Int32 = 1
        func foo1(a!:Int32=a+b, // EXPECTED: regex warning.*?the variable 'a' actually captures this decl
            y!:Int32 = a){
            return a+y // 4
            }
        func foo2(){
            var a = a+c; // EXPECTED: regex warning.*?the variable 'c' actually captures this decl
            var y = a;
            return a+y // 4
        }
        let c:Int32 = 1
        foo1() + foo2()
    }
}
