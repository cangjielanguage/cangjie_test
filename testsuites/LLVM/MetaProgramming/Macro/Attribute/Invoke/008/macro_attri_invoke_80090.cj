// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*

@M[Float32]
func test<T>(a:T,b!:Int64=1){0}

@M[Float32]
class C<T>{}

@M[Float32]
record R<T>{}

@M[Float32]
var i : Int64 = 1

func main(){
    C<Int64>()
    R<Int64>()
    return test<Int64>(0,b:0) + i - 1
}

