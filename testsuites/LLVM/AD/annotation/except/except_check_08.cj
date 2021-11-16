// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output

@differentiable[except: [y]]
func foo(x:Float64, y:(Float64, Float64)->Float64){
    return 1.0
}

func main(){
    return 1
}