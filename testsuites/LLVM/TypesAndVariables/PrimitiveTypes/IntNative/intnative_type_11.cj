// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func a():IntNative{0}
func b(){ { input:IntNative => input}}
var A = [a()]
var B = [b()]


func main(): IntNative {
    A[0] |> (B[0] ~> B[0])
    return 0
}
