// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
}

class Data <: Base {
    var test : Int32 = 1
}

func main(): Int64 {
    var obj : Data = Data()
    var castOP = obj as Base // Base -> Data
    var res : Int32 = obj.test
    if (res != 1) {
        return 1
    }
    return 0
}
