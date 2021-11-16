// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func test(): Int64 {
    let a : List<Int64> = [1]
    if (a[0] != 0 && a.size() != 1) {
        return 1
    }
    a[0]
    if (a[0] != 0 && a.size() != 1) {
        return 1
    }
    a.get(0)
    if (a[0] != 0 && a.size() != 1) {
        return 1
    }
    a.size()
    if (a[0] != 0 && a.size() != 1) {
        return 1
    }
    a.toArray()
    if (a[0] != 0 && a.size() != 1) {
        return 1
    }
    a.isEmpty()
    if (a[0] != 0 && a.size() != 1) {
        return 1
    }
    a.iterator()
    if (a[0] != 0 && a.size() != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return test()
}
