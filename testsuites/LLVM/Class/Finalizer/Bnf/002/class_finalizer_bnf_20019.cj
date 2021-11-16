// DEPENDENCE:  macro_define.cj
// EXEC: %compiler %cmp_opt macro_define.cj %pic_opt
// EXEC: %run %compiler  %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

var flag = 0


class A{
    ~init(){
    @M[1]
    var x = 1
    flag += x
    }
}

func test(){
    var a = A()
}

func main(){
    test()
    NativeGC()
    print("flag is ${flag}.\n")
    return 0
}