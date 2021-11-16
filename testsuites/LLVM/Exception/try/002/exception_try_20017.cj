// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan 'me' is not a member of class 'Exception'


class A <: Exception{
    func me(){print("Hello A!")}
}

class B <: Exception{
    func me(){print("Hello B!")}
}

class C <: Exception{
    func me(){print("Hello C!")}
}

func main(){
    try{throw B()}
    catch (a:A|B|C) {a.me();return 0}
    finally{}
    return 1
}