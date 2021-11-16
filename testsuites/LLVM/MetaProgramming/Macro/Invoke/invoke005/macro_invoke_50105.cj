// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output  %run_args
import test.*

func main(){
    var a : UInt32 = @M(ord('1'))
    var b : UInt32 = ord(@M('1'))
    return 0
}
