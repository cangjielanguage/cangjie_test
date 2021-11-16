// ERRCHECK: %compiler %cmp_opt %f -o %output

trait update{
    func test(a:This,b:List<Int64>):Int64
}

append List<Int32> with update{
    func test(a:List<Int32>,b:List<Int64>):Int64{
        return b.size() - a.size()
    }
}

func main(): Int64 {
    var a = [1]
    var b = [1]
    return test(a,b) // EXPECTED: regex no matching function declaration for function call 'test'
}
