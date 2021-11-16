// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a():Int64{0}
func b(){ { input:Int64 => input}}
var A = (a(),a())
var B = (b(),b())


func main(): Int64 {
    A[0] |> (B[0] ~> B[0])
    return 0
}
