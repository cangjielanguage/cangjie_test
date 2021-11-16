// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

var aa = 0

class Data<T>{
    Data(var a!: Int64 = 6){
        aa++
    }

    func f1(a: T): This{ //EXPECTED: regex type of function body is incompatible with return type

        func f2() {
            this
        }
        f2()  //EXPECTED: regex no matching function declaration for function call 'f2'
    }
}

func main():Int64{
    var data = Data<Int64>(a: 8)
    if (data.f1(3).a == 8 && aa == 1) {
        return 0
    }
    return 1
}
