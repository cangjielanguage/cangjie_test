// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base<T>{
	private Base(){

	}
}

class Data <: Base<Int32>{ //EXPECTED: regex there is no non-parameter constructor in super class, please invoke super call explicitly
    var a: Int64 = 5
}

func run(): Int64 {
    var value : Data = Data()
    return value.a - 5
}

func main(): Int64 {
    return run()
}
