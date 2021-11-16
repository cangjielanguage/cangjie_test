// DEPENDENCE: pkgs cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs/pkgs.%middle 2>&1 | compare %f
// ASSERT: scan value type recursive detected: 'Data->Data'
import pkgs.*

func main(): Int64 {
  return 0
}
