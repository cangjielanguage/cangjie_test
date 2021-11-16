// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan overflow annotation must be used before funcdecl or lambdaExpr


enum E{
    e
    @overflowSaturating
    prop let a : Int64 {
        get(){1}
    }
}


func main(){
    return 0
}
