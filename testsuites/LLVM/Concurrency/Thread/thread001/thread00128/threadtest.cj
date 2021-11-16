// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var ch = '仓'

func add(a: Char): Char {
    ch = a
    return ch
}

func main(): Int64 {
    let fut1: Future<Char> = spawn {
        add('颉')
        return '仓'
        add('!')
    }
    sleep(1000*1000*1000);
    if (ch != '颉' ) {
        return 1
    }
    return 0
}
