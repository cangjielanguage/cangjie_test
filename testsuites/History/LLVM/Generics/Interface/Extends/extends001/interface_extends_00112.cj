// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A<X>{
    let a  = 1
}

interface B <: A<Int64>{let a = 4}

interface C<X> <: A<Int64>{let a = 2}

interface D<X> <: A<X>{let a = 2}

interface E<X,Y> <: A<X>{let a = 1}


func main(){
    if A<Int64>.a + B.a
     + C<Int32>.a + D<Int64>.a
     + E<Int32,Int32>.a != 10 {
        return 1
    }
    return 0
}
