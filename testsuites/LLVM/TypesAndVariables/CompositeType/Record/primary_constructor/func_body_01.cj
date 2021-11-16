// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record Data {
	var a: Int32  = 0
	Data() {
		a = 1
		return
	}
}

func run(): Int64 {
	var value : Data = Data();
	if (value.a == 1) {
		return 0
	}
	else {
		return 1
	}
}

func main(): Int64 {
    return run()
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
