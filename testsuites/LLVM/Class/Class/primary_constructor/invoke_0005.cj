// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
class A{
	A(){
	A()
	}
}

class B{
	init(){
		this() // EXPECTED: regex recursive constructor calling in class 'B'
	}
}

class C{
	init(){
		C()
	}
}

func main(): Int64 {
  return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
