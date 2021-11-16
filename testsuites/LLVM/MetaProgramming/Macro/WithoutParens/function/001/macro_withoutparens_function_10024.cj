// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan macro_pass

import macro define.*

class A<T>{
    @M private init(){
       print("macro_pass")
    }
    init(input:T){
        this()
    }
}



func main(){
    A<Int64>(1)
    return 0
}
