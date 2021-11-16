// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait X{func asFunc(x:This,y:Char):Char}
append Char with X{func asFunc(x:Char,y:Char):Char{x}}


func main(): Int64 {
    'a' |> 'a'
    return 0
}
