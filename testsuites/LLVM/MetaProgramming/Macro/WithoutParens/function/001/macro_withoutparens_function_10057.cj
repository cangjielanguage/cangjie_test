// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f %pic_opt

import macro define.*


foreign{
    @M func test():Int64
}


func main(){
    return 0
}