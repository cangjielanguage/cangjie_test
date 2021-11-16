// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum Time{Day(Int64) | Hour}

record GenRec{
    let b: Time
    var c: Int64
    GenRec(){
        var time = Day(3)
        b= time
        this.c = match (this.b) {
            case Day(x)=> x+1
            case $Hour => 2
        }
    }
}

func main():Int64{
    var rec = GenRec()
    if (rec.c == 4) {
        return 0
    }
    return 1
}
