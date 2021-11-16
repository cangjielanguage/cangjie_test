// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex 7
open class Base {
    static let base_a: Int32 = 10
}

class Data <: Base {
    static let a: Int32 = 1
    var b: Int32 = 2
    init() {}
    init(x:Int32){
        this()
        let i_a: Int32 = 2*a // expected is 2*1
        func foo():Int32{
            var i_f_a: Int32 = 2*a // expected is 2*1
            var i_f_b: Int32 = 2*i_a // expected is 2*2
            var res: Int32 = a + i_f_a + i_f_b // expected is 1+ 2 + 4
            return res
        }
        print(foo().toString()+"\n") // expected is 7
    }
    func foo():Int32{
        var f_a = 3*a // expected is 3
        var f_b = 3*(Base.base_a) // expected is 30
        var f_c = b
        var res: Int32 = f_a + f_b + f_c
        return res
    }
}

func run(): Int64 {
    var res : Data = Data(2);
    if (res.foo() != 35 ) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
