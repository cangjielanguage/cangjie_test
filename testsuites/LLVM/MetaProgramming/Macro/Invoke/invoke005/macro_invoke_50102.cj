// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output

import test.*

func main(){
    var a : Int64*Int64 = @M((1,1))
    var b : Int64*Int64 = (@M(1,1)) // EXPECTED: regex invalid node expanded in macro call's father node
    var c : Int64*Int64 = (@M(1),@M(1))
    return 0
}
