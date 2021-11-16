// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

enum A{a(Int32)}

func g<T>(b:T){
let a : A = A.a(1)
var i : Int32 = match (a) {
case $a => 1 // EXPECTED: regex-auto no overloaded '==' function in match case pattern
case test => 2
case a(x) => 3
case b : Int32 => 4
case _ => 0
}
return 0
}

func main(){
return g<A>(A.a(1))
}
