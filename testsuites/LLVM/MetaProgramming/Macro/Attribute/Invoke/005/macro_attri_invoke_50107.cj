// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_opt test.cj %enable_macro %pic_opt
// EXEC: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// EXEC: %run %run_opt %output  %run_args
import macro test.*

func main(){
    var a : Char = @M[chr(1)](0)
    var b : Char = chr(@M[1](0))
    return 0
}
