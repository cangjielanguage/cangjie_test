// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// EXEC-PIPE-1: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output 2>&1 | compare %f

import macro define.*

func main(){
    var a = @SAME{i=>i} // EXPECTED: regex parameters of this lambda expression must have type annotations

    var b = @SAME[1]{i=>i} // EXPECTED: regex parameters of this lambda expression must have type annotations
    
    a(1)
    b(1)

    0
}
