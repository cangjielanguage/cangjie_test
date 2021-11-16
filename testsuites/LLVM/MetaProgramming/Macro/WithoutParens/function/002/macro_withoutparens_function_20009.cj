// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// ASSERT: scan foreign function can not have body

import macro define.*


foreign{
    @M func test():Int64
}

func main(){
    return 0
}
