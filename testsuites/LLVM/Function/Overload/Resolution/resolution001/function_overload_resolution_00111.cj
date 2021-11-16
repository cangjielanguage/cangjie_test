// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
class Child{
    func result():Int64{
        func test(a:Int16):Int64{return 1}
        func test(a:Int32):Int64{return 2}
        return test(1)  // EXPECTED: regex ambiguous match for function call
    }
}

func main(){
    if (Child().result() == 2) {
        return 0
    }
    return 1
}