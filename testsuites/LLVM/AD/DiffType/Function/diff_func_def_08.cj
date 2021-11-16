// EXEC-0: %compiler %enableAD %cmp_opt %n.cj -o %output  

@differentiable[include: [y]]
func foo(x: Int64, y: Float64){}

func main():Int64{
	return 0
}