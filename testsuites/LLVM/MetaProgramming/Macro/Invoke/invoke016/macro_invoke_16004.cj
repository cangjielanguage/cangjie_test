// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro define.*


func test(a:(Int64)->Int64){}

func main(){
    test@SAME{i:Int64=>i}

    test@SAME[1]{i:Int64=>i}


    0
}
