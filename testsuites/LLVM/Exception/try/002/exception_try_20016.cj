// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Hello B!

open class A <: Exception{
    open func me(){print("Hello A!")}
}

class B <: A{
    override func me(){print("Hello B!")}
}

class C <: A{
    override func me(){print("Hello C!")}
}

func main(){
    try{throw B()}
    catch (a:A|B|C) {a.me();return 0}
    finally{}
    return 1
}