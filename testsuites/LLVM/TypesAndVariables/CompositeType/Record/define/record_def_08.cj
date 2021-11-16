// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    let a1: Int32
    let b1: Int32

    init(a: Int32){
        a1 = a
        b1 = 2
    }
    init(a: Int32, b: Int32){
        a1 = a
        b1 = b
    }
    func perimeter(): Int32 {
        return (a1 + b1) * 2
    }
    func area(): Int32 {
        return a1 * b1
    }
}

let test1 = Test(2)
let res1 = test1.perimeter()
let res2 = test1.area()

let test2 = Test(2, 3)
let res3 = test2.perimeter()
let res4 = test2.area()
func run(): Int64 {
    if (res1 == 8 && res2 == 4 && res3 == 10 && res4 == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

