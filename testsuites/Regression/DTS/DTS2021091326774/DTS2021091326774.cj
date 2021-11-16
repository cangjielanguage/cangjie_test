// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface I3<T1,T2> {
    func foo3(a: T1): Int64 
    func foo1(a: T1): Int64 
    {
        return 1
    }
}



record R1<T> <: I3<T,T> {
    // 成员变量
    var width: T
    var length: T

    init (width: T, length: T) {
        this.width = width
        this.length = length
    }
    func foo3(a: T): Int64 {
        return 9
    }
    func foo1(a: T): Int64 {
        return 1
    }

}

func main(){
	var r1:R1<Int64> = R1(10,10)
	r1.foo1(2)
	r1.foo3(10)
	return 0
}


