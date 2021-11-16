// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

interface I {} 
extend Int64 <: I{ 
  override func f(a: String, b: String) {} // EXPECTED: regex 'override' modifier is illegal for function declaration in extend body
}

func main(): Int64{
	return 0;
}