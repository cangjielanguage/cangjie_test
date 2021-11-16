// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{
    operator func *(b:A<T>):Bool  {
    var i = if (true) {this}else{b}
    return true
    }
}



func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    if (!(b*a)) {
        return 1
    }
    return 0
}
