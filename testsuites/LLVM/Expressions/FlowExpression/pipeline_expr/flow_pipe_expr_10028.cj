// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a():Int64{0}
func b():(Int64)->Int64{ { a:Int64 => a}}


func main(): Int64 {
    return a() |> b()
}
