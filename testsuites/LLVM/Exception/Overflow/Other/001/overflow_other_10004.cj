// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args | compare %f
// ASSERT: scan aaa
// ASSERT: scan-not bbb
// ASSERT: scan overflow_other_10004.cj:12
// ASSERT: scan overflow_other_10004.cj:24
@overflowThrowing
func test(a:Int8,b:Int8){
    a-b
    a/b
    print("aaa")
    a+b
    print("bbb")
    a*b
    a**b;
    -a;
    var c = a
    c++
    c--
    return 1 // a+b will overflow.
}

func main(){
    return Int64(test(100,100))
}
