// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A<T>{
    a(T)
    static func foo(){}
    func test():This{ // EXPECTED: regex 'This' type is not allowed here
        this
    }
}

func main(): Int64 {
    return 1
}
