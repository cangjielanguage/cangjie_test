// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args | grep -z  "DataA.*DataB.*DataA.*DataC.*DataA.*DataD"


open class DataA {
    var a : Int32 = 1
    init()  {
        a = a + 1    
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

open class DataC <: DataA {
    var b : Int32
    init() {
        b = 30
        print("DataC\n")
    }
}

class DataD <: DataA {
    var b : Int32
    init() {
        b = 40
        print("DataD\n")
    }
}

func run(): Int64 {
    var value1 : DataB = DataB()
    if (value1.a != 2)  {
        return 1
    }

    if ((value1.b != 20)) {
        return 2
    }

    var value2 : DataC = DataC()
    if (value2.a != 2)  {
        return 3
    }

    if (value2.b != 30) {
        return 4
    }

    var value3 : DataD = DataD()
    if (value3.a != 2)  {
        return 5
    }

    if ((value3.b != 40)) {
        return 6
    }

    return 0
}

func main(): Int64 {
    return run()
}