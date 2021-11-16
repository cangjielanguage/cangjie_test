// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{func asFunc(x:This,y:Unit):Unit}
append Unit with X{func asFunc(x:Unit,y:Unit):Unit{}}
var a = 1

func main(): Int64 {
    a++ |> a++
    return 0
}
