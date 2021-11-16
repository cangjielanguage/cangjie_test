// DEPENDENCE: b importcfg
// EXEC: %compiler %cmp_opt -c ./b/b.cj -o b.%middle
// ERRCHECK: %compiler %cmp_opt %f b.%middle -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


import b

interface b{
static func test(a:Int8):Int64{return 2}
}


func main(){
if (b.test(1) == 2) {
return 0
}
return 1
}


