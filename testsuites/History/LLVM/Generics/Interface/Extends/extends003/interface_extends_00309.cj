// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A{
let a = 1
}

interface C<X> <: A{
let a = Option<X>.None
}

func main(){
var a : C<Int32>
return 0
}
