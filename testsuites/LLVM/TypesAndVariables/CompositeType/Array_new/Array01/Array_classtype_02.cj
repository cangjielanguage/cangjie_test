// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class A{
	A(var ra!: Int64 = 0, let rb!: Int64 = 0){

	}
}

class B <:A{
	B(var rc!: Int64 = 0, let rd!: Int64 = 0){

	}
}

var a1 = Array<B>([B(rc:0,rd:0),A(ra:1,rb:1)]) // EXPECTED:regex error.*?return type for 'init' is mismatched

func main(): Int64 {
    return 0
}
