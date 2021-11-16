// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC: %run %run_opt %output  %run_args
import test.*

func main(){
    @M(Array<Int64>(1,1)[0])
    @M(Array<Int64>(1,1))[0]
    Array<Int64>(1,1)[@M(0)]
    return 0
}
