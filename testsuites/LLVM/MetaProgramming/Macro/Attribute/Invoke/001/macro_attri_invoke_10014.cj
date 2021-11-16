// DEPENDENCE: define10014.cj
// EXEC: %compiler %cmp_opt define10014.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

package use

import define10014.*

func test(input:Int64){0}

func main(){
    var z : Int64 = 1
    return @M(x)(z)
}