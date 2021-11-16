// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o a.%middle
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle %f -o %output 2>&1 | compare %f

//catelog:# 包和模块管理## 包### 包的导入#### 导入多个包--8
import p1.foo as A // EXPECTED: regex redefinition of declaration 'A'

var A = 1 // EXPECTED: regex redefinition of declaration 'A'
func main(): Int64 {

    return 0
}