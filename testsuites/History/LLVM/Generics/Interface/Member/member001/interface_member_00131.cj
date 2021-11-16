// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class I<X>{
    static let a = (input:X):X => {input}
}

interface J<X>{
    let a = (input:X):X => {input}
}


func main(){
    return I<Int64>.a(0) +  J<Int64>.a(0)
}
