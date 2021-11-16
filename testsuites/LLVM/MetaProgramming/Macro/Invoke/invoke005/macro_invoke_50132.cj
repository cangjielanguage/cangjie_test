// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// ASSERT: scan invalid node expanded in macro call's father node

import test.*

class A{
    var a = @M(1
    init(input : Int64){
        this.a = input
    }
   )
}


func main(){
    return 0
}

// ASSERT: scan-not core dumped
