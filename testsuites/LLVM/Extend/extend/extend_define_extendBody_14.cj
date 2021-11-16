// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

interface I {} 
extend Int64 <: I{ 
  open func f(a: String, b: String) {} // EXPECTED: regex 'open' modifier is illegal for function declaration in extend body
}

func main(): Int64{
	return 0;
}