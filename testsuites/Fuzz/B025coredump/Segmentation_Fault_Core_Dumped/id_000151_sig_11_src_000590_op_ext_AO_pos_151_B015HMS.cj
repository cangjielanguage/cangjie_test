// EXEC: %compiler %cmp_opt %f -o %output

func main(): Int64 {
    let a = 1
    func f1():Int64{
        func f2(): Int64 {
            return 0
        }
        let a = 2
        return 0
    }
    f1()

    return 0
}

