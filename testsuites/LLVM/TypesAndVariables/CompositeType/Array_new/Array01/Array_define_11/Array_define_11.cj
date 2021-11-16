// DEPENDENCE: Array_define11 import.conf
// EXEC: %compiler %cmp_opt -c Array_define11/Array_define11.cj -o Array_define11.%middle
// EXEC: %compiler %cmp_opt %f Array_define11.%middle -o %output
// EXEC: %run %run_opt %output %run_args
import Array_define11.*

func main(): Int64 {
    if(define11){
        return define_11
    }

    return 1
}
