// EXEC-PIPE-1: %compiler %enableAD -overflow no  %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex function foo failed the differentiability check

@differentiable[except: [x,y]]
func foo(x: Int64, y: Int64){
    return x + y
}

func main():Int64{
	return 0
}