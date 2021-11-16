// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T>{
    var i: T*Int32
    init(x: T*Int32){
        this.i = x
    }
    func getMem1():Int32{
        return this.i[1]
    }
}

func main(): Int64 {
    var data = Data<Int64>((2,3))
    var res = data.getMem1()
    if (res == 3) {
        return 0
    }
    return 1
}
