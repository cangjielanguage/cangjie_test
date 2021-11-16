// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a : ?Int64 = None
    match (a){ // EXPECTED: regex all enum constructors must be covered in match
        case Some(v) => v
    }
}
