// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
enum A<T>{
    a(T)
    func test(){
        super // EXPECTED: regex 'super' can only be used in class
    }
}

func main(): Int64 {
    var i = a(1).test()
    return 1
}
