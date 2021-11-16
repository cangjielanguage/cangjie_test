// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex illegal class member in class block

func main(): Int64 {
return run()
}

func run(): Int64 {
var res1 = Data().foo
print(res1.toString()+"n")
if (res1 == 5){
return 0
}
return 1
}


class Data{
let a: Int32 = 2
let b: Int32 = 3
var foo:(Int32,Int32)->Int32 =(a,c=3)=>a+c
}



