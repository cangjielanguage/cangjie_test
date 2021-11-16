// DEPENDENCE: caserunner.cj seek_cz.txt
// EXEC: %compiler %stdx_cmp_opt %f caserunner.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan-not AssertionError
from std import io.*

func main() {
  var fs = FileStream("seek_cz.txt")
  fs.openFile()
  var fs_seek_0 = fs.seek(1,EndPos)
  fs.seek(0,BeginPos) //置零
  var fs_seek_1 = fs.seek(0,EndPos)
  fs.seek(0,BeginPos) //置零
  var fs_seek_2 = fs.seek(-1,EndPos)
  fs.seek(0,BeginPos) //置零
  var fs_seek_3 = fs.seek(-10,EndPos)
  fs.seek(0,BeginPos) //置零
  var fs_seek_4 = fs.seek(0,BeginPos)
  fs.seek(0,BeginPos) //置零
  var fs_seek_5 = fs.seek(10,BeginPos)
  fs.seek(0,BeginPos) //置零
  var fs_seek_6 = fs.seek(11,BeginPos)
  fs.seek(0,BeginPos) //置零
  var fs_seek_7 = fs.seek(200,BeginPos)
  fs.seek(0,BeginPos) //置零
  fs.seek(5,BeginPos)  //置于索引5的位置
  var fs_seek_8 = fs.seek(0,CurPos)
  fs.seek(0,BeginPos) //置零
  fs.seek(5,BeginPos)  //置于索引5的位置
  var fs_seek_9 = fs.seek(-1,CurPos)
  fs.seek(0,BeginPos) //置零
  fs.seek(5,BeginPos)  //置于索引5的位置
  var fs_seek_10 = fs.seek(-5,CurPos)
  fs.seek(0,BeginPos) //置零
  fs.seek(5,BeginPos)  //置于索引5的位置
  var fs_seek_11 = fs.seek(4,CurPos)
  fs.seek(0,BeginPos) //置零
  fs.seek(5,BeginPos)  //置于索引5的位置
  var fs_seek_12 = fs.seek(5,CurPos)
  fs.seek(0,BeginPos) //置零
  fs.seek(5,BeginPos)  //置于索引5的位置
  var fs_seek_13 = fs.seek(200,CurPos)





  CaseRunner<Int64>().runCases(
    [
      (fs_seek_0,11),
      (fs_seek_1,10),
      (fs_seek_2,9),
      (fs_seek_3,0),
      (fs_seek_4,0),
      (fs_seek_5,10),
      (fs_seek_6,11),
      (fs_seek_7,200),
      (fs_seek_8,5),
      (fs_seek_9,4),
      (fs_seek_10,0),
      (fs_seek_11,9),
      (fs_seek_12,10),
      (fs_seek_13,205)
    ],
    description: "test case 1" /**用例描述**/
  )

   return 0
}