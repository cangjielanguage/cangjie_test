// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a():Int64{0}
func b(){ { input:Int64 => input}}


func main(): Int64 {
    a() |> (b() ~> b())
    return 0
}
