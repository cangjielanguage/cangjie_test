// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( B1<String>().m != 1 ){
        return 1
    }
    if ( B2<String>().m != 2 ){
        return 1
    }
    return 0
}

interface I1<T> {
    func foo1():Int64{
        return 1
    }
}

interface I2<T> {
    func foo2():Int64{
        return 2
    }
}

interface J1<T> <: I1<T> & I2<T> {
    prop let m:Int64{
        get(){
            return foo1()
        }
    }
}


interface J2<T> <: I1<T> & I2<T>   {
    prop let m:Int64{
        get(){
            return foo2()
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
            return foo2()
        }
    }
}