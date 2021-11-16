// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{}

trait update{
    operator func *(a:This,b:This):Bool
}

append<T> A<T> with update {
    operator func *(a:A<T>,b:A<T>):Bool  {
    var i = (a,b)
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
