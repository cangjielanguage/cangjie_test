// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
}

class Data <: Base {
    func foo(): Int32 {
        return 3
    }
}

func main(): Int64 {
    var obj : Data = Data() 
    var castOP = obj as Base // Base->Data
    var res1 : Int32 = obj.foo()
    if (res1 != 3) {
        return 1
    }

    return 0
}
