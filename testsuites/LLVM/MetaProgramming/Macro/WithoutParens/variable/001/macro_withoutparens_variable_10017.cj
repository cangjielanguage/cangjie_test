// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*


record A{
    @M private var a : Int64 = 0
    var b : Int64 = a
}

func main(){
    return A().b
}