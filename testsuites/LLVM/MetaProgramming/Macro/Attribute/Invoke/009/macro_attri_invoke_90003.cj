// DEPENDENCE: define_func.cj
// EXEC: %compiler %cmp_opt define_func.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import define_func.*

@M[x]
func test():Bool{
    return 0
}

func main(){
    return 0
}
