// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T>{
    var i: T
    func setNum(x: T):Unit{
        i = x
    }
    init(x:T){i=x}
}

func main(): Int64 {
    var data = Data<Int32>(123)
    var myTuple = (data,1)
    data.setNum(4)
    print(data.i.toString())
    if (myTuple[0].i == 4) {
        return 0
    }
    return 1
}
