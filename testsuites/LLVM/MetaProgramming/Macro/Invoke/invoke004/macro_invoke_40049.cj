// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f  -o %output
// ASSERT: scan illegal macro expand input args
import test.*

func main(){
    @M(/*)
    return 1
    @M(*/)
    return 0
}
