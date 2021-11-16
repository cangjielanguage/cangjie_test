// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan overflow annotation must be used before funcdecl or lambdaExpr

@overflowSaturating
class A{
    static func test(a:Int8,b:Int8){
        return a+b
    }
}

func main(){
    return 0
}
