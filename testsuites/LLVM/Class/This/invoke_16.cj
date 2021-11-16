// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

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

    func f2(): This{  // EXPECTED: regex type of function body is incompatible with return type
        return f2(2)  //EXPECTED: regex type of return expression is incompatible with return type
    }

    func f2(a: Int64): Data{
        return this
    }
}