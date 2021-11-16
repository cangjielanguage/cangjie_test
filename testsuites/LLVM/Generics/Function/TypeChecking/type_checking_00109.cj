// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A{}

func g<T>(b:T){
    var a : Array<Int32> = @{1}
    for (i in a) {}
    for (j in 0..10) {}
    return 0
}

func main(){
    return g<A>(A())
}