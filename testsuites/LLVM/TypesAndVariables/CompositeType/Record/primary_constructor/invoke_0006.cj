// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data {
var b: Int32
    Data(){
        this.b = 3
    }
    init(input:Int32){
        this.b = input 

        this()//EXPECTED: regex call to 'this' must be first expression in constructor of record 'Data'
        // Data() is ok, same as Java new Data()
        // this() is same as Java this()
    }
}
func run(): Int32 {
var a:Int32 = 5
    var data: Data = Data(a)
    return data.b - 5
}
func main(): Int64 {
    return Int64(run())
}

