// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T> <: Hashable & Equatable<T>{
    operator func *(b:A<T>):Bool  {
        [this,b]
        return true
    }
    func hashCode() : UInt64 

    operator func == (b:A<T>): Bool

    operator func != (b:A<T>): Bool
}

class A_B<T> <: A<T>{

    A_B(var a: Int64){

    }

    func hashCode() : UInt64 {
        var c = UInt64(a)
        return c
    }

    operator func == (b:A_B<T>){
        return this.a == b.a
    }

    operator func != (b:A_B<T>){
        return this.a != b.a
    }

    operator func == (b:T){
        return true
    }

    operator func != (b:T){
        return false
    }

    operator func == (b:A<T>){
        return true
    }

    operator func != (b:A<T>){
        return false
    }

}

func main(): Int64 {
    var a : A<Int32> = A_B<Int32>(1)
    var b : A<Int32> = A_B<Int32>(2)
    if (!(b*a)) {
        return 1
    }
    return 0
}
