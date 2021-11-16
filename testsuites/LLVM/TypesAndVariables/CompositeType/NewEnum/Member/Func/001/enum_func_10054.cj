// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A<T>{
    a(T)
    static func foo(){this} // EXPECTED: regex non-static variable 'this' cannot be referenced from a static context
    func test(){
    }
}

func main(): Int64 {
    return 1
}
