// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
var b: Float32
	Data(abstract var a: Int32)  { //EXPECTED: regex 'abstract' modifier is illegal for variable declaration in primary constructor
		this.a = a
		b = 2.0
	}
}

func run(): Int64 {
	var value : Data = Data(1);
	if (value.a == 1) &&  (value.b == 2.0) {
		return 0
	}
	else {
		return 1
	}
}

func main(): Int64 {
    return run()
}
