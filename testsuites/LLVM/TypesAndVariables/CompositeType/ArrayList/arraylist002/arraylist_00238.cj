// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class test<T>{
var a : T
init(input : T){
a = input
}
func x(input:Int64):T{a}
var i : Int64 = 10
var myArray : ArrayList<T> = ArrayList<T>(i,x)
}

func main(): Int64 {
test<Int64>(1)
return 0
}
