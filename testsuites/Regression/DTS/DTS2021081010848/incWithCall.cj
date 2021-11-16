// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Data {
    static var n:Int32 = 1
    var m:Int32 = 1

    init(x:Int32){
        Data.n++;n++
    }

    func getData(a:Int32) {
        return Data(a)
    }
}

func main(): Int64 {
    let a: Int32 = 1
    Data(a).getData(a).getData(a).m++
    if (Data.n != 7) {
        return 1
    }
    return 0
}
