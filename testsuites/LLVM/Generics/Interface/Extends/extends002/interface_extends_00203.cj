// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

interface A<T>{
    func a_foo(a:T):T
    func d_foo(a:T):T{a}
    static func s_foo(a:T):T{a}
}
interface B<T>{
    func a_foo(a:T):T
    func d_foo(a:T):T{a}
    static func s_foo(a:T):T{a}
}

interface C <: A<Int32> & B<Int32>{
    func d_foo(a:Int32):Int32{a}
    static func s_foo(a:Int32):Int32{a}
}

class D <: C{
    func a_foo(a:Int32):Int32{1}
}


func main(){
    var i : C = D()
    if (i.a_foo(Int32(1)) != Int32(1)) {
        print("a_foo failed")
        return 1
    }
    if (i.d_foo(Int32(2)) != Int32(2)) {
        print("d_foo failed")
        return 1
    }
    if (D.s_foo(Int32(3)) != Int32(3)) {
        print("s_foo failed")
        return 1
    }
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
