// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record Data {
var a: Int32 =1
var b: Int32 = this.a // EXPECTED: regex 'this' is only allowed to be used inside constructor or function for record
Data(){
var b: Int32 = this.a
}
func f(): Int32 {
var one: Int32 =2
var b: Int32 = this.a
return one
}
}
func run(): Int64 {
var data: Data = Data()
var res: Int32 = data.f()
print(res.toString()+"n")
return 0
}


func main(): Int64 {
return run()
}
