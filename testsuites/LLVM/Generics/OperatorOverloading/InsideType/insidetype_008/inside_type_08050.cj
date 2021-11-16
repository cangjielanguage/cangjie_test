// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{
    operator func *(b:A<T>):Bool  {
    var res1 = 1 > 1
    var res2 = 1 >= 1
    var res3 = 1 < 1
    var res4 = 1 <= 1
    return res4
    }
}

class A_B<T> <: A<T>{}

func main(): Int64 {
    var a : A<Int32> = A_B<Int32>()
    var b : A<Int32> = A_B<Int32>()
    if (!(b*a)) {
        return 1
    }
    return 0
}
