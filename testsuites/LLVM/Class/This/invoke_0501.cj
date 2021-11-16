// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

var aa = 0

class Data<T>{
    Data(var a!: Int64 = 6){
        aa++
    }

    func f1(a: T): This{
        func f2() {
            f3()
        }
        f2()

    }

    func f3(): This{
       this
    }
}

func main():Int64{
    var data = Data<Int64>(a: 8)
    if (data.f1(3).a == 8 && aa == 1) {
        return 0
    }
    return 1
}
