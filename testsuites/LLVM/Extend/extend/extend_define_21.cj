// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class Foo {
	
}

class B{
  extend Foo { //EXPECTED: regex illegal class member in class block
    
  }
}


func main(): Int64 {
    return 0
}