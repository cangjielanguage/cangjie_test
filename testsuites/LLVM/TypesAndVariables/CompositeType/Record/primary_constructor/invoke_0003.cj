// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Data{// EXPECTED: regex value type recursive detected: 'Data->Data'
  Data(var a!: Data = Data()){
  }
}

func main(): Int64 {
  var a: Data = Data()
  return 0
}

record Data2{// EXPECTED: regex value type recursive detected: 'Data2->Data2'
  Data2(let a!: Data2 = Data2()){
  } 
}

