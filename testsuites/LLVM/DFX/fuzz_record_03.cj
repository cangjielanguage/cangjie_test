// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

record A<T>{
    private func asFunc(input:T){}
    return 1;    func test(input:T){ // EXPECTED:regex illegal record member in record block
        var a : A<T> = A<T>()
        a(input)
   }
}

func main(){
    var a : A<Int64> = A<Int64>()
    return 0
}
