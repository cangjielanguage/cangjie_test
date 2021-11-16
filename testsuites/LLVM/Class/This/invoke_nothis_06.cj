// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var aa = 0

class Data<T>{
    Data(var a!: Int64 = 6){
        aa++
    }

    func f2(){
        this
    }

    func f1(a: T): This{
        if(true){
            return f2()
        } else {
           return this
        }
    }
}

func main():Int64{
    var data = Data<Int64>(a: 8)
    if (data.f1(3).a == 8 && aa == 1) {
        return 0
    }
    return 1
}
