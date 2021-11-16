// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface  C1{
    prop let a: Int64{
        get() {
            return 0
        }
    }
}
class C2 <: C1 {}

func main() {
    var ret = C2()
    return 0
}