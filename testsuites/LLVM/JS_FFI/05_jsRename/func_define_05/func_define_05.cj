// DEPENDENCE: momentMember.js
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// 形参默认值，使用js中的值
@JsRename["moment1"]
@JsMember["./momentMember"]
foreign func funcDefine05(a!: Int64 = 0) : String

unsafe func main() {
  if(funcDefine05() == "1" && funcDefine05(a: 2) == "2"){
    return 0;
  }
  return 1;
}
