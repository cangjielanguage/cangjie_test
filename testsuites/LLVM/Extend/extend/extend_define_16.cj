// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class Foo <: I{
	
}

interface I{
	
}

extend Foo <: I { //EXPECTED: regex type 'Class-Foo' inherits or implements duplicate interface 'Interface-I'
    
}

func main(): Int64 {
    return 0
}