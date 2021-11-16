// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args | grep -z  "DataA.*DataB.*DataC"


open class DataA {
    var a : Int32
    init()  {
        a = 10    
        print("DataA\n")
    }
}

open class DataB <: DataA {
    var b : Int32
    init() {
        b = 20
        print("DataB\n")
    }
}

class DataC <: DataB {
    var c : Int32
    init() {
        c = 30
        print("DataC\n")
    }
}

func run(): Int64 {
    var value1 : DataC = DataC()
    if (value1.a != 10) {
        return 1
    }
    if (value1.b != 20) {
        return 2
    }
    if (value1.c != 30) {
        return 3
    }

    return 0
}

func main(): Int64 {
    return run()
}
