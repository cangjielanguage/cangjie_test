// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Data {
    static var n:Int32 = 1
    var m:Int32 = 1
    init(x:Int32){
        Data.n++;n++
    }
    func get():Int32{
        Data.n++;n++;
        return n
    }
}

func main(): Int64 {
    let a: Int32 = 1
    Data(a).m++ 
    if (Data.n != 3) {return 1}
    return 0
}
