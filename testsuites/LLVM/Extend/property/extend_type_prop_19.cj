// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    return 0
}

class Data{
    Data(var x:Int64){
        this.x = x
    }
    func foo():This{
        if( this.n != 1) {
            return this
        }
        this.m = 10
        if( this.m != 2) {
            return this
        }
    }
}

extend This { // EXPECTED: regex error.*?'This' type is not allowed here
    prop var m: Int64 {
        get() {
            return 2
        }
        set(v){}
    }
    prop let n: Int64 {
        get() {
            return 1
        }
    }
}