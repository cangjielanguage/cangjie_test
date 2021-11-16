// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {   //设置断点：8/11/16/18行，第11和18行设置断点后，显示失败图标
    let score: Int64 = 90
    let PASS = 60
    let FULL = 100
    var scoreResult: Int64 = match (score) { //scoreResult = 5
        case 0 => 1
        case 10 | 20 | 30 | 40 | 50 => 2
        case $PASS => 3
        case 70 | 80 => 4
        case 90 | $FULL => 5
        case _ => 0
    }
    return scoreResult
}

// DEPENDENCE: ../parseDebugInfo.py 027_debuginfun_match_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 027_debuginfun_match_expected.txt



// ASSERT:scan  8: label
// ASSERT:scan  19: label
// ASSERT:scan-not  18: