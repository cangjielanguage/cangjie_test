// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

package packageTest

internal class Aoo{
    static var b: Range<Int64> = 0..10
}

external var a = Aoo.b

func main(): Int64 {
    for (i in a){
        print(i.toString())
    }
    return 0
}
