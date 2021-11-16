// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

class Data {
	var a: Int32	// EXPECTED: regex the uninitialized member variable 'a' is not initialized in the constructor of class or record
}

func run(): Int64 {
	var value: Data = Data()  
	var b: Int32 = value.a
  return 1
}

func main(): Int64 {
    return run()
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
