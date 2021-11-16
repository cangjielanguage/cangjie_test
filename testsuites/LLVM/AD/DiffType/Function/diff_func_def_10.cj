// EXEC-0: %compiler %enableAD %cmp_opt %n.cj -o %output  

@differentiable[include: [y]]
func foo(x: Int64, y: Float16){}

func main():Int64{
    print("test\n")
	return 0
}