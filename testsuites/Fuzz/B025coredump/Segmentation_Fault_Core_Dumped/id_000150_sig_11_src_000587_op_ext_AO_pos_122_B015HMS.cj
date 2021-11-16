// EXEC: %compiler %cmp_opt %f -o %output

func main(): Int64 {
    var a = 1

    func f1():Int64{
        return 0
    }

    f1()

    return 0
}

