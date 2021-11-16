// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args
import macro test.*

func main(){
    var a = match (1) {
                case _ if (@M[true](0)) => 0
                case _ => 1
            }
    return a
}
