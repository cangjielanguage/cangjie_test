// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var aa = 0

func main():Int64{
    var b1 = C().f2()
    var b2 = D().f2()

    if (b1 is C && b2 is D && aa == 5) {
        return 0
    }
    return 1
}

abstract class Data{
    Data(var a!: Int64 = 6){
        aa++
    }

    func f2(a: Int64): This{
        aa += a
        return this
    }

    func f2(): This
}

class C <: Data{
    func f2(): This{
        f2(1)
    }
}

class D <: Data{
    func f2(): This{
        f2(2)
    }
}