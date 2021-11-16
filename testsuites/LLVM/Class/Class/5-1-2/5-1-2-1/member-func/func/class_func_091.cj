// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class Data {
	static var a : Int32 = 2
	init() {

	}

	static func get() : Int32 {
		return  a
	}
}

func main(): Int64 {
    if (Data.get() == 2) {
        return 0
    }

    return 1
}
