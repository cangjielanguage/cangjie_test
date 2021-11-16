// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import macro define.*

@M
record B{
    let a : Int64 = 1
    func test(){
        this.a
    }
}


func main(){
    A()
    return 0
}