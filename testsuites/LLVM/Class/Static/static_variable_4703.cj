// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class Data {
var b: Int32 = 2
init(x:Int32){
init()
var i_b: Int32 = 2*b // expected is 2*2,this "b" is "this.b"
func foo():Int32{
var i_f_c: Int32 = 2*i_b
return i_f_c
}
print(foo().toString()+"n")
}
func foo():Int32{
var f_c = b // expected is 2,this "b" is "this.b"
return f_c
}
}

func run(): Int64 {
var res : Data = Data(2);
return 0
}

func main(): Int64 {
return run()
}
