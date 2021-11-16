// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan function A::foo failed the differentiability check

record A {
    var x : String
    @differentiable[include: [this, y]]
    func foo(x:Float64, y : Float64){
        return x
    }
}


func main(){
    return 1
}