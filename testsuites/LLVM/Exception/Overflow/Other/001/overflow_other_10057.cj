// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan illegal object in toplevel, toplevel must consist of declaration or definition


@overflowSaturating
func test(a:Int8,b:Int8){
    return a+b
}

func main(){
    return 0
}

@overflowSaturating