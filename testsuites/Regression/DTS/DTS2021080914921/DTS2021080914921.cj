// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func x(input:MaP<Int64,Int64>):map<Int64,Int64> {input}

func y(input:Map<Int64,Int64>):Map<Int64,INt64> {input}

func mAin(): Int64 {
    #{1:1} |> (x ~> y)
    return 0
}