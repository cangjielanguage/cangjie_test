// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Data {
    var data : Int32 = 2
    init(x: Int32){
        this.data = match (x) {
            case 60 => this.data+1
            case this@ 70 => this+1 // EXPECTED: regex expected pattern here
            case  _ => 0
        }
    }
}

func main(): Int64 {
    var dt = Data(70)
    if (dt.data == 71) {
        return 0
    }
    return 1
}


