// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

interface A {
    @differentiable[include: [this]]
    static func a(x:Float64):Float64{ // EXPECTED: regex-auto 'this' is not found in parameter list
        return 1.0
    }
}


func main(){
    return 0
}