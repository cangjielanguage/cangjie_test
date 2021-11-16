// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
record A{
	A(){
	A()
	}
}

record B{
	init(){ // EXPECTED: regex recursive constructor calling detected
		this()
	}
}

record C{
	init(){
		C()
	}
}

func main(): Int64 {
  return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
