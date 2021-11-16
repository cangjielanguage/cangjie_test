// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output  %run_args

import test.*

record A{
    func foo(){
        let a = @M(1)
    }
    operator func +(y:A){
        let a = @M(1)
    }
}

func main(){
    A().foo()
    A()+A()
    return 0
}
