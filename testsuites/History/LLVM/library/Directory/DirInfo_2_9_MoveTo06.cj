// EXEC: %compiler %libdir/io/cangjieIO.o %libdir/os/cangjieOS.o %f -o %output
// EXEC: %run %run_opt %output %run_args

from os import os.*
from io import io.*

// CREATE A TEST DIR TO TEST FOR PLATFORM ADAPTION
var pwd_path: String = Directory.GetWorkingDirectory().GetCanonicalPath()
var test_path0 = pwd_path + "/test0"
var nameCnt: Int64 = 0;
var testPathBaseLength = pwd_path.size() + 5
let nameCntLimit = 15;
let maxPathLength = 512

func tryNewName() {
    if ("${nameCnt}".size() < nameCntLimit) {
        test_path0 = test_path0.substring(0, testPathBaseLength) + "_${nameCnt}"
        nameCnt = nameCnt + 1
        return
    }
    nameCnt = 0
    testPathBaseLength = testPathBaseLength + nameCntLimit
    return
}

func createAndGetTestDirInPwd(): String {
    // TO AVOID THERE EXISTS SAME-NAME FILE IN THE CURRENT WORKING DIRECTORY
    while (Directory.Exist(test_path0) && test_path0.size() < maxPathLength) {
        tryNewName()
    }
    if (test_path0.size() >= maxPathLength) {
        return ""
    }
    var test_path1 = test_path0 + "/test1"
    var test_path2 = test_path1 + "/test2"
    var test_path3 = test_path2 + "/test3"
    var test_path_tmp = test_path3 + "/tmp"

    if (!Directory.Create(test_path0)) { return "" }
    if (!Directory.Create(test_path1)) { return "" }
    if (!Directory.Create(test_path2)) { return "" }
    if (!Directory.Create(test_path3)) { return "" }
    if (!Directory.Create(test_path_tmp)) { return "" }
    return test_path3
}

func deleteTestDirInPwd(): Bool {
    if (!Directory.Delete(test_path0, true)) { return false }
    if (Directory.Exist(test_path0)) { return false }
    return true
}


func main(): Int64{

    var test_dir: String = createAndGetTestDirInPwd()
    if (test_dir.size() <= 0) {
        if (test_path0.size() >= maxPathLength) {
            return 1
        }
        if (Directory.Exist(test_path0)) {
            deleteTestDirInPwd()
        }
        return 1
    }
	
    // restore Environment
    if (Directory.Exist(test_dir + "/" + "../src1")) {
        Directory.Delete(test_dir + "/" + "../src1", true)
    }

    // Round 1: Create folder src1 including file1 and folder2, file2
    var src: DirectoryInfo = DirectoryInfo(test_dir + "/" + "../src1")
    let src_file: FileInfo = FileInfo(test_dir + "/" + "../src1/file1")
    var src_sub = src.CreateSubdirectory("src2")
    let src_sub_file: FileInfo = FileInfo(test_dir + "/" + "../src1/src2/file2")

    if (!src.Create() || !src_sub.Create() || !src_sub.Exist() || !src.Exist()) {
        return 1
    }

    if (!src_file.Create() || !src_file.Exist()) {
        return 1
    }

    if (!src_sub_file.Create() || !src_sub_file.Exist()) {
        return 1
    }


    // Round 2: ../src1 Move To /tmp/des1
    let des: DirectoryInfo = src.MoveTo(test_dir + "/" + "/tmp/des1")



    // Round 3: Check that file and folder are Exist
    // Check folder:
    if (!des.Exist()) {
        return 1
    }

    // Check file:
    let des_file: FileInfo[] = des.GetFiles()

    if (des_file[0].GetPath() != test_dir + "/" + "/tmp/des1/file1") {
        return 1
    }

    // Check sub folder and file
    let des_sub: DirectoryInfo[] = des.GetDirectories()

    if (des_sub[0].GetPath() != test_dir + "/" + "/tmp/des1/src2") {
        return 1
    }


    let des_sub_file: FileInfo[] = des_sub[0].GetFiles()

    if (des_sub_file[0].GetPath() != test_dir + "/" + "/tmp/des1/src2/file2") {
        return 1
    }


    // Round 4: Check that src are not Exist
    if (src.Exist() || src_file.Exist() || src_sub.Exist() || src_sub_file.Exist()) {
        return 1
    }

    if (!des.Delete(true)) {
        return 1
    }
	if (!deleteTestDirInPwd()) {
		return 1 
	}
    return 0
}