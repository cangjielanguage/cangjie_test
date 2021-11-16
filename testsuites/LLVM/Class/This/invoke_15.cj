// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var aa = 0

func main():Int64{
    var a = Data(a:8).f2()
    if (a is Data && aa == 1 && a.a == 8) {
        return 0
    }
    return 1
}

class Data{
    Data(var a!: Int64 = 6){
        aa++
    }

    func f2(): Data{
        return f2(2)
    }

    func f2(a: Int64): This{
        return this
    }
}