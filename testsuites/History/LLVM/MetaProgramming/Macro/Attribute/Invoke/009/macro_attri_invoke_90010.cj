// DEPENDENCE: define_func.cj
// EXEC: %compiler %cmp_opt define_func.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import define_func.*


trait X{
    @M[x] func test():Int64 // ASSERT: scan only abstract functions are allowed in trait body
}

func main(){
    return 0
}

