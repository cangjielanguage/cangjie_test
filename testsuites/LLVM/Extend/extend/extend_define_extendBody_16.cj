// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

interface I {} 
extend Int64 <: I{
  // TODO: redef not implemented 
  redef static func f(a: String, b: String) {} // EXPECTED: regex error.*?'redef' modifier is illegal for function declaration in extend body
}

func main(): Int64{
	return 0;
}
