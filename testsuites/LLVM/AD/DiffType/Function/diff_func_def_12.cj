// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output  

@differentiable[except:[y,z]]
func foo(x: Float16, y : Float32, z:Float64){
    x
}

func main(){
	return 0
}