// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A<T>{
    a(T)
    static private func foo(){0}
    func test(){
        A<Int64>.foo()
    }
}

func main(): Int64 {
    return A<Int64>.foo() // EXPECTED: regex no matching function declaration for function call 'foo'
}
