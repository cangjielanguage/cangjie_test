// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

open class Boo {
    func foo(){
        return 1
    }
}

class Coo <: Boo {
    redef static func foo() {  // EXPECTED: regex error.*?static member 'foo' cannot have the same name with non-static member in parent class or interfaces
        return 2
    }
}