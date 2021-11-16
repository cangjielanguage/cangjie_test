// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan macro_pass

import macro define.*

record A{
    @M init(){
        print("macro_pass")
    }
}

func main(){
    A()
    return 0
}