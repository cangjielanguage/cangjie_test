// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

from collection import collection.*

func main(): IntNative {
    var set: HashSet<IntNative> = HashSet<IntNative>([1,2,3])
    var set2: HashSet<UIntNative> = HashSet<UIntNative>([1,2,3])
    if (set.isEmpty()) {
        return 1
    }
    if (set2.isEmpty()) {
        return 1
    }
    return 0
}