// EXEC: %compiler %cmp_opt  %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class foo{
    init(){}
    var num: Int32 = 0
    init(num: Int32){
        this.num = num
    }
}

trait Big {
    func compare(a: This, b: This): This
}

append foo with Big {
    func compare(a: foo, b: foo): foo {
        if(a.num > b.num){
            return a
        }
        return b
    }
}

func run(): Int64 {
    var a = foo(2)
    var b = foo(3)
    let x = compare(a , b)
    if (x.num == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
