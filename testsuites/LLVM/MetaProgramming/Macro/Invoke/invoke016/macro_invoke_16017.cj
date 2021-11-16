// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args

import macro define.*

func test(a:(Int64)->Int64){}
func foo(a:Int64):(Int64)->Int64{bar}
func bar(a:Int64):Int64{a}


func main(){
    bar|>test
    @SAME{a:(Int64)->Int64 => return bar}(bar) |> test
    @SAME[1]{a:(Int64)->Int64 => return bar}(bar) |> test
    0
}
