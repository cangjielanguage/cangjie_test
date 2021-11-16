// EXEC-PIPE-1: %compiler %cmp_opt %enableAD %n.cj -o %n.out 2>&1 | compare %f

@differentiable
func foo(x:Float64, y:Float64){
    let a : List<Float64> = [0.0, 1.0, 2.0, 3.0, 4.0] // EXPECTED: regex unsupport list literal in differentiable function
    return for (item in a){ 
        x + item
    }
}

func main(){
    return 0
}