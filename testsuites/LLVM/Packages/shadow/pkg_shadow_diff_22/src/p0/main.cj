// DEPENDENCE: ../p1
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

//catelog:# 包和模块管理## 包### 包的导入#### 导入多个包--8
package p0
import p1.foo

var foo = 11

func main(): Int64 {
    var a2 = foo
    if ( a2 != 11 ){
        return 1
    }
    return 0
}
