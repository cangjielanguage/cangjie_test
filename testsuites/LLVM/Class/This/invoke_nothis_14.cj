// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var aa = 0

func main():Int64{
    var a = C().f2()
    var b = C().f2(2)
    if (a is C && aa == 2 && a.a == 6 && b.a == 6) {
        return 0
    }
    return 1
}

abstract class Data{
    Data(var a!: Int64 = 6){
        aa++
    }

    func f2(): Data
    func f2(a: Int64): This
}

class C <: Data{
    func f2() {
        return this
    }

    func f2(a: Int64): This{
        return f2()
    }
}