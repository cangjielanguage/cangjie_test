// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var aa = 0

func main():Int64{    
    if (C().f2() is C && aa == 1) {
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

class C <: Data{
    func f2(): This{
        return this
    }
}