// EXEC-0: %compiler %enableAD %cmp_opt %n.cj -o %output
@differentiable[include: [y]]
func foo(x: Float16, y: Float16){
    return x + y
}

func main():Int64{
	return 0
}