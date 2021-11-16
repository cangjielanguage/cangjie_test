// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data {
    let p0 : Int32
    var p1 = 9
    Data(x : Int32,  var p0 : Int64, //EXPECTED: regex redefinition of declaration 'p0'
    let p1: Float64){ //EXPECTED: regex redefinition of declaration 'p1'
        this.p0 = 3
    }
}

func run(): Int32 {
    let a: Int32 = 5
    var data: Data = Data(a, a)
    return data.p0 - 5
}
func main(): Int64 {
    return Int64(run())
}

