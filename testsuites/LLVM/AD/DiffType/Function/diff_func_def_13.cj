// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output  

@differentiable[except:[x, y,z]]
func foo(x: Float64, y : Float16, z:Float32){
    x
}

func main(){
	return 0
}