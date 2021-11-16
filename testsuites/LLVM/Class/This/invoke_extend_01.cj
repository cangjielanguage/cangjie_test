// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
var aa = 0

class Data{
    Data(var a!: Int64 = 6){
        aa++
    }
}

extend Data{
    func f1(): This{
        this
    }
}

func main():Int64{
    var data = Data(a: 8)
    if (data.f1().a == 8 && aa == 1) {
        return 0
    }
    return 1
}
