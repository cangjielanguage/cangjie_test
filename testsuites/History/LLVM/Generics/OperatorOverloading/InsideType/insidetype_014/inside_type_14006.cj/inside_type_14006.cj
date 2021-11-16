// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait update{
    operator func *(a:This,b:This):Bool
}

append B<Int32> with update{
    operator func *(a:B<Int32>,b:B<Int32>):Bool  {return false}
}

record B<T>{
    operator func *(a:B<T>,b:B<T>):Bool  {return true}
}




func main(): Int64 {
    var b : B<Int32> = B<Int32>()
    if (b*b == true) {
        return 0
    }
    return 1
}
