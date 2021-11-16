// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan try_expr is illegal before this increment or decrement expression

class A <: Exception{}

func main(){
    var a : Int64 = 1
    try{a}finally{}++
    return 0
}