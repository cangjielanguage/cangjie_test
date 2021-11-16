// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A{
}

interface B<X> <: A{}



func main(){
    var a : B<Int32>
    return 0
}