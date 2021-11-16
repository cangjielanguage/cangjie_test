// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{
    operator func *(b:A<T>):Bool  {
    var lambda = { input_a:A<T>,input_b:A<T> => true}
    return lambda(this,b)
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
