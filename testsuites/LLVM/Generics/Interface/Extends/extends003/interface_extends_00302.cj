// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A{}

interface B{}

interface C<X> <: A & B{}

func main(){
    var a : C<Int32>
    return 0
}