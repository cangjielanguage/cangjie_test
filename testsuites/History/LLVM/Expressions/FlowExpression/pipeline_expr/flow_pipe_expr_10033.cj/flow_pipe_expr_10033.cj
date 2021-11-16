// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{func asFunc(x:This,y:Char):Int64}
append Char with X{func asFunc(x:Char,y:Char):Int64{0}}


func main(): Int64 {
    return 'a' |> 'a'
}
