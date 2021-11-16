// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    return 0
}

extend List<T>{
    operator func [](index:Int64,value:T):Unit{ // EXPECTED: regex-auto it's illegal to extend index assignment operator '[](index, value)' for immutable type 
        return ()
    }
    static prop var set: Int64 {
        get() { return 1}
        set(v) {}
    }
}

extend Range<T>{
    operator func [](index:Int64,value:T):Unit{
        return ()
    }
    static prop var set: Int64 { 
        get() { return 1 }
        set(v) {}
    }
}

