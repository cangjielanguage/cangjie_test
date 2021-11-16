// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A<T>{
    a(T)
    static func foo(){test()} // EXPECTED: regex 'test' is non-static member, cannot be accessed by static function 'foo'
    func test(){
    }
}

func main(): Int64 {
    return 1
}
