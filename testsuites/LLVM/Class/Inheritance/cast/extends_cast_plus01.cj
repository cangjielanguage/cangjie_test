// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


open class Base2 {
    open func getB(): Int32 {
        var one: Int32 =2
        return one
    }
}


interface Inday2 {
    func getB(): Int32 {
        return 1
    }

}


class Data2 <: Base2 & Inday2  {
    override func getB(): Int32 {
        var one: Int32 = 3
        return one
    }
}

func run(): Int64 {
    var t3: Int32 = Data2().getB()
    if (t3 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
