// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C {
    var num: Int64 = 0
}

func returnIncrementer(): ()->Unit {
    let c: C = C()
    func incrementer() {
        c.num++
    }
    incrementer
}

func main() {
    let f = returnIncrementer()
    f()
    print(C().num.toString())
}
