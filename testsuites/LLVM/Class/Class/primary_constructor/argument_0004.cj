// EXEC:%compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

class Data {
var b: Float32
	Data(let a: Int32)  {
		this.a = a    // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
		b = 2.0
	}
}

func run(): Int64 {
	var value : Data = Data(1);
	if ((value.a == 1) &&  (value.b == 2.0)) {
		return 0
	}
	else {
		return 1
	}
}

func main(): Int64 {
    return run()
}
