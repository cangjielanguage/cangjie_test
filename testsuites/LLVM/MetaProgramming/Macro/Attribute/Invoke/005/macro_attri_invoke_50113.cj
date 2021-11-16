// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args
import macro test.*

func main(){
    var a = @M[match (Some<Bool>(true)) {
                case x : Bool => 1
                case $None => 2
                case _ if (false) => 3
                case y => 0
    }](0)
    return a
}
