// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

record Roo {
    private prop let a: Int64 {
        get() { return 0 }
    }
    public prop let c: Int64 {
        get() { return 0 }
    }
    prop var d: Int64 {
        get() {
            return a
        }
        set(v){}
    }
}

func main():Int64 {
    if (Roo().c != 0 ){
        return 1
    }
    if (Roo().d != 0 ){
        return 1
    }
    return 0
}
