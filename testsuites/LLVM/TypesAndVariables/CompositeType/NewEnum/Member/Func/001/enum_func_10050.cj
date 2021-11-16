// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A<T>{
    a(T)
    static protected func foo(){0} // EXPECTED: regex 'protected' modifier is illegal for function declaration in enum body
    func test(){
        A<Int64>.foo()
    }
}

func main(): Int64 {
    return a(1).test()
}