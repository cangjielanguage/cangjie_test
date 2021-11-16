// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{
    operator func [](b:A<T>*A<T>):Bool {true}
    operator func +(b:A<T>*A<T>):Bool {true}
}

class A_B<T> <: A<T>{}

func main(): Int64 {
    //var a:A<Int32>*A<Int32> = (A_B<Int32>(),A_B<Int32>()) // pass
    var a = (A_B<Int32>(),A_B<Int32>()) // fail
    var b = A_B<Int32>()
    if (!(b[a])) {
        return 1
    }
    if (!(b+a)) {
        return 13
    } 
    return 0
}
