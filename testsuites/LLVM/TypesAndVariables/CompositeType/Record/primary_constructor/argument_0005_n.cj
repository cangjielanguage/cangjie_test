// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data {
var b: Float32
	Data(private var a: Int32)  {
		this.a = a
		b = 2.0
	}
}

func run(): Int64 {
	var value : Data = Data(1);
	if ((value.a == 1) &&  (value.b == 2.0)) { //EXPECTED: regex can not access field 'a'
		return 0
	}
	else {
		return 1
	}
}

func main(): Int64 {
    return run()
}
