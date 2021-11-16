// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

external class Aoo{
    var value = 27
}

external type a = Aoo

var b:a=Aoo()
func main(): Int64 {
    if(b.value == 27){
        return 0
    }else{
        return 1
    }
}
