// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a = Aoo()
    if ( a.hashCode() != 52 ){
        return 1
    }
    return 0
}

class Aoo <: Hashable{
    func hashCode():UInt64{
        return 52
    }

}
