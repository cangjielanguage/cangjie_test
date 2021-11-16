// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class Foo {
	
}


extend Foo { 
  Foo(){ //EXPECTED: regex illegal class member in extend block

  }
}

func main(): Int64 {
    return 0
}