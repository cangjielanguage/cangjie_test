// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<T>{
    a(T)
    operator func +(y:A<T>){return 1}
}


func main(): Int64 {
    var i = A<Int64>.a(1)
    var x   = i+i
    if (x==1) {
       return 0
    }
    return 1
}
