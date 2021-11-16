// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*


func test<T>(){
@M[func test(a:T,b!:Int64=1){0}]
func test(a:T,b!:Int64=1){0}

@M[var i : Int64 = 1]
var i : Int64 = 1
}

func main(){
    return 0
}

