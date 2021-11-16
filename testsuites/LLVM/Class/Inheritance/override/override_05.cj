// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return Int64(Data().foo() - 4)
}

open class Base {
   private static func foo(): Int32 {
       return 1
   }
}

class Data <: Base {
    func foo(): Int32 {
        return 4
    }
}
