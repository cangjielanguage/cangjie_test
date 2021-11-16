// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var aa = 0

func main():Int64{
    var b2 = D().f2()

    if (b2 is D && aa == 3) {
        return 0
    }
    return 1
}

abstract class Data{
    Data(var a!: Int64 = 6){
        aa++
    }

    func f2(): This
}

abstract class C <: Data{
    func f2(a: Int64): This{
        aa += a
        return this
    }
}

class D <: C{
    func f2(): This{
        f2(2)
    }
}