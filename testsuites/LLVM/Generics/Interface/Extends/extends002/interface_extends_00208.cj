// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{
    func a_foo(a:T):T
    func d_foo(a:T):T{a}
}
interface B<T>{
    func a_foo(a:T):T
    func d_foo(a:T):T{a}
}

interface C<X> <: A<Int64> & B<Int32>{}

class D <: C<Int32>{
    func a_foo(a:Int32):Int32{1}
    func a_foo(a:Int64):Int64{1}
}


func main(){
    var i : C<Int32> = D()
    if (i.a_foo(Int32(1)) != Int32(1)) {
        print("a_foo failed")
        return 1
    }
    if (i.d_foo(Int32(2)) != Int32(2)) {
        print("d_foo failed")
        return 1
    }
    if (i.a_foo(Int64(1)) != Int64(1)) {
        print("Int64 a_foo failed")
        return 1
    }
    if (i.d_foo(Int64(2)) != Int64(2)) {
        print("Int64  d_foo failed")
        return 1
    }

    return 0
}