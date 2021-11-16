// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// https://code.huawei.com/MapleKernel/MapleLang/Char-spec/issues/421
// return should not be inside of init.
class A{
init(){
}
init(a:Int64){ // init1
this(return,return) // EXPECTED: regex invalid return expression
}
init(a:Int64,b:Int64){ //init2
this(return)
}
}


func main(): Int64 {
A(1,1)
A(1)
return 0
}
