// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

class Coo {
    public prop var a: Int64 {
        get() {
            return 0
        }
        set(v){}
    }
    var b:Unit
    init(){
        b = (a = 1) //EXPECTED:regex 'a' is not allowed to be accessed before all member variables are initialized
    }
}

func main():Int64 {
    if ( Coo().b != ()) {
        return 1
    }
    return 0
}
