// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record B<T>{
    operator func *(b:B<T>):Bool  {return true}
}

class A<T>{
    operator func *(b:B<T>):Bool  {return true}
}



func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : B<Int32> = B<Int32>()
    if(a*b ){
    	return 0
    }
    return 1
}
