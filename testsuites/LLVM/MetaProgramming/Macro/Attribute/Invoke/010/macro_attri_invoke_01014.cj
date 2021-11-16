// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*


foreign {
@M[func test():Unit]
func test():Unit

@M[var i : Int64 = 1]
var i : Int64 = 1
}

func main(){
    return 0
}

