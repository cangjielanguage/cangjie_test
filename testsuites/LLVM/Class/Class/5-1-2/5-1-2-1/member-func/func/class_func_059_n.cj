// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex  object cannot access static member 'get'


class Data {
	static func get() : Int32 {
		return  1
	}
}

func run(): Int64 {
	var data : Data = Data()
	if (data.get() != 1) {
		return 1 
	}
	return 0
}

func main(): Int64 {
    return run()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
