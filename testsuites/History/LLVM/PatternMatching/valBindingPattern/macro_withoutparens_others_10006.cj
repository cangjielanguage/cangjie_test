// DEPENDENCE: define.cj
// EXEC: echo "define=./define.cjo" >> define.conf
// EXEC: %compiler %cmp_opt define.cj %enable_macro %pic_opt
// ERRCHECK: %run %compiler %cmp_opt %macro_lib_opt %f -o %output
// ASSERT: scan illegal macro expand input args
import macro define.*

func main(){
    var i = 1
    @M
    var a = match (1){
        case _ => 0
        case x@y => 1
    }
    return 1
}
