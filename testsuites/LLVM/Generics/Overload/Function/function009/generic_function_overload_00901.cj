// DEPENDENCE: a.cj a.cfg
// EXEC: %compiler %cmp_opt -c a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %f  a.%middle -o %output
// EXEC: %run %run_opt %output %run_args
package pkg901
import a.*

func main():Int64{
    var I = a.test(1)
    return I-2
}
