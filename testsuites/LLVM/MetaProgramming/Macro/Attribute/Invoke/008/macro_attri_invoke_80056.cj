// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import macro define.*

@M[@]  // EXPECTED: regex-auto illegal attribute tokens in macro call, which is '@'
func test<T>(a:T,b!:Int64=1){0}

class C<T>{}

record R<T>{}

var i : Int64 = 1

func main(){
    C<Int64>()
    R<Int64>()
    return test<Int64>(0,b:0) + i - 1
}

