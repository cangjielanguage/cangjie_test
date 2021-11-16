// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface I<T> {
    let a  = Option<T>.None
}

func main(){
    var i = I<Int32>.a
    return 0
}