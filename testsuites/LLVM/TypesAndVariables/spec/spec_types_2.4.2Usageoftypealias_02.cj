// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type A = B
class B {
    static var b : Int32 = 0;
    static func foo() {} 
}

func foo() { 
//     A.foo()  // Use A to access static method in class B
//     A.b
}
func main(){
    
    return 0

}

