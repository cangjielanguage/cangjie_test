// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro test.*

interface A{
    func foo(){
        let a = @M[1-](1)
    }
    static func bar(){
        let a = @M[1==](1)
    }
    operator func +(y:A){
        let a = @M[1!=](1)
    }
}

class Test <: A{}

func main(){
    Test.bar()
    return 0
}
