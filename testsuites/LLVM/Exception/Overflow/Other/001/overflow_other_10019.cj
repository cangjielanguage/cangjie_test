// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan overflow annotation must be used before funcdecl or lambdaExpr

@overflowSaturating
enum E{
    e
    func test(a:Int8,b:Int8){
        return a+b
    }
}

func main(){
    var x : E = e
    var res = Int64(x.test(127,100) - 127)
    print("success")
    return 0
}
