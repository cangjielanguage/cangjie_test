// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_lib_opt %f -o %output
// ASSERT: scan call_expr is illegal before this increment or decrement expression
import macro define.*

func main(){
    var a = @SAME{1}()++
    var b = @SAME[0]{1}()++
    return 0
}
