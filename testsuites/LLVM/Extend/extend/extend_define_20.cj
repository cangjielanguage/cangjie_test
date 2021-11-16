// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class Foo <: I{
	
}

class I{
	
}

extend Foo <: I { //EXPECTED: regex expected an interface here
    
}

func main(): Int64 {
    return 0
}
