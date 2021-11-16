// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*

func main(){
    return @M[E<Int64>.e()if (true) {}else if (false) {}else{}](E<Int64>.e()if (true) {}else if (false) {}else{})
}

