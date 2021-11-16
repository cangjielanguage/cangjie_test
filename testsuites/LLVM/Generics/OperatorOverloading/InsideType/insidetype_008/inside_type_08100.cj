// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T> <: Hashable & Equatable<A<T>>{
    A(var a: Int64){

    }
    operator func *(b:A<T>):Bool  {
    [this,b]
    return true
    }

    func hashCode() : UInt64 {
        var c = UInt64(a)
        return c
    }

    operator func == (b:A<T>){
        return this.a == b.a
    }

    operator func != (b:A<T>){
        return this.a != b.a
    }
}



func main(): Int64 {
    var a : A<Int32> = A<Int32>(1)
    var b : A<Int32> = A<Int32>(2)
    if (!(b*a)) {
        return 1
    }
    return 0
}
