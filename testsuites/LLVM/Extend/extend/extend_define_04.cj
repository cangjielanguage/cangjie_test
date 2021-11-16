// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

interface I{
	
}

extend I {  // EXPECTED: regex extending type 'Interface-I' is not allowed
    func plus() { 1 }
}

func main(): Int64 {
    return 0
}