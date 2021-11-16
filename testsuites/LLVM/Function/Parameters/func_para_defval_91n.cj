// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
return run()
}

func run(): Int64 {
var res1 = Data(3) // EXPECTED: regex ambiguous match for constructor call
if (res1.x == 7){
return 0
}
return 1
}


class Data{
var x: Int32 = 1
var y: Int32 = 2
init(x:Int32,y:Int32 = 4){
init()
this.x = x+y
}
init(x:Int32){
init()
this.x = x+1
}
init(){
print("yes")
}
}



