// EXEC: %compiler %cmp_opt -c %n.cj -o %output

enum TimeUnit {
    Year | Month | Day | Hour
}

trait Num {
    func plus(a: This, b: This): Int32
}

append TimeUnit with Num {
    func plus(a: TimeUnit, b: TimeUnit): Int32{
        return 2
    }
}

