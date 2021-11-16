// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


open class Base {
    private static func f() : Int64 {
        return 1
    }
    static func get() : Int64 {
        return f()
    }
}

class Data <: Base {
    
}

func main(): Int64 {
    return Int64(Data.get() - 1)
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
