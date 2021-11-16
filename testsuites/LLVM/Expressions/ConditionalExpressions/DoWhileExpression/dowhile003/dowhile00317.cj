// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A{
    var a = 1
}

class B <: A{
    func test():Int64{
        do{
            var a = super.a
            return 0
        } while (true)
        return 1
    }
}

func main(): Int64 {
    var b = B()
    return b.test()
    return 1
}
