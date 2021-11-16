// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args | grep -z  "DataA.*DataB"


open class DataA {
    var a : Int32
    init()  {
        a = 10    
        print("DataA\n")
    }
}

class DataB <: DataA {
    var b : Int32
    init() {
        b = 20
        print("DataB\n")
    }
}

func run(): Int64 {
    var value1 : DataB = DataB()
    if (value1.a != 10) {
        return 1
    }
    if (value1.b != 20) {
        return 2
    }
    return 0
}

func main(): Int64 {
    return run()
}
