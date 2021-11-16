// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B1<String>().m != 1 ){
        return 1
    }
    if ( B2<String>().m != 1 ){
        return 1
    }
    return 0
}

interface I<T> {
    func foo1():Int64{
        return 1
    }
}

interface J1<T> <: I<T>  {
    prop let m:Int64{
        get(){
            return foo1()
        }
    }
}


interface J2<T> <: I<T>  {
    prop let m:Int64{
        get(){
            return foo1()
        }
    }
}

class B1<T> <: J1<T>  {
    prop let m:Int64{
        get(){
            return foo1()
        }
    }
}

class B2<T> <: J2<T>  {
    prop let m:Int64{
        get(){
            return foo1()
        }
    }
}