// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var result: Bool = true

func main(): Int64 {
    let fut1: Future<Bool> = spawn {
        result = 1 >= 10
        return result
    }
    sleep(1000*1000*100);
    let fut2: Future<Bool> = spawn {
        result = 1 <= 10
        return result
    }
    sleep(1000*1000*100);
    let fut3: Future<Bool> = spawn {
        result = 1 != 10
        return result
    }
    sleep(1000*1000*100);
    let fut4: Future<Bool> = spawn {
        result = 1 == 10
        return result
    }
    sleep(1000*1000*100);
    if (result ) {
        return 1
    }
    return 0
}
