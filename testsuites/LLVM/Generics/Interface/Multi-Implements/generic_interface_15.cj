// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( C1<String>().m != 4 ){
        return 1
    }
    if ( B2<String>().m != 3 ){
        return 1
    }
    return 0
}

interface I<T> {
    func foo1():Int64{
        return 1
    }
}

interface J<V> <: I<V>  {
    prop let m:Int64{
        get(){
            return foo1()
        }
    }
}


class B2<K> <: I<K>  {
    prop let m:Int64{
        get(){
            return foo1()+2
        }
    }
}

class C1<M> <: J<M>{
    prop let m:Int64{
        get(){
            return foo1()+3
        }
    }
}