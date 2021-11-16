// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var i : Int64 = 1

interface I<X>{
    let a = match i{
        case _ : X => 1
        case _ => 0
    }
}

func main(){
    print(I<Int32>.a.toString())
    print("\n")
    print(I<Int64>.a.toString())
    print("\n")
    if I<Int32>.a != 0 {
        return 1
    }
    if I<Int64>.a != 1 {
        return 1
    }
    return 0
}