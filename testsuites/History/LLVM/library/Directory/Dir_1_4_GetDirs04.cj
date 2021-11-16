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
    if (Directory.Exist(test_dir + "/" + "/tmp/dir1")) {
        Directory.Delete(test_dir + "/" + "/tmp/dir1", true)
    }

    // Round 1 Create Directory dir1
    if (!Directory.Create(test_dir + "/" + "/tmp/dir1")) {
        return 1
    }

    // Create Directory dir1/sub_1_dir1 dir1/sub_2_dir1 dir1/sub_3_dir1
    if (!Directory.Create(test_dir + "/" + "/tmp/dir1/sub_1_dir1") || !Directory.Create(test_dir + "/" + "/tmp/dir1/sub_2_dir1") || !Directory.Create(test_dir + "/" + "/tmp/dir1/sub_3_dir1")) {
        return 1
    }

    // Create Files dir1/sub_1_file1 dir1/sub_2_file1
    if (!File.Create(test_dir + "/" + "/tmp/dir1/sub_1_file1") || !File.Create(test_dir + "/" + "/tmp/dir1/sub_2_file1")) {
        return 1
    }

    // Check sub-Directories and files
    /* coredump
    if (Directory.GetDirectories(test_dir + "/" + "/tmp/dir1").size() != 3) {
        return 1
    }

    if (Directory.GetFiles(test_dir + "/" + "/tmp/dir1").size() != 2) {
        return 1
    }*/

    var num_Dirs1: Array<String> = Directory.GetDirectories(test_dir + "/" + "/tmp/dir1")
    var num_Files1: Array<String> = Directory.GetFiles(test_dir + "/" + "/tmp/dir1")

    if (num_Dirs1.size != 3 || num_Files1.size != 2) {
        return 1
    }


    if (!Directory.Delete(test_dir + "/" + "/tmp/dir1",true)) {
        return 1
    }


    // restore Environment
    if (Directory.Exist(test_dir + "/" + "../dir2")) {
        Directory.Delete(test_dir + "/" + "../dir2", true)
    }

    // Round 2 Create Directory dir2
    if (!Directory.Create(test_dir + "/" + "../dir2")) {
        return 1
    }

    // Create Directory dir2/sub_1_dir2 dir2/sub_2_dir2 dir2/sub_3_dir2
    if (!Directory.Create(test_dir + "/" + "../dir2/sub_1_dir2") || !Directory.Create(test_dir + "/" + "../dir2/sub_2_dir2") || !Directory.Create(test_dir + "/" + "../dir2/sub_3_dir2")) {
        return 1
    }

    // Create Files dir2/sub_1_file2 dir2/sub_2_file2
    if (!File.Create(test_dir + "/" + "../dir2/sub_1_file2") || !File.Create(test_dir + "/" + "../dir2/sub_2_file2")) {
        return 1
    }

    // Check sub-Directories and files
    /* coredump
    if (Directory.GetDirectories(test_dir + "/" + "../dir2").size() != 3) {
        return 1
    }

    if (Directory.GetFiles(test_dir + "/" + "../dir2").size() != 2) {
        return 1
    }*/

    var num_Dirs2: Array<String> = Directory.GetDirectories(test_dir + "/" + "../dir2")
    var num_Files2: Array<String> = Directory.GetFiles(test_dir + "/" + "../dir2")

    if (num_Dirs2.size != 3 || num_Files2.size != 2) {
        return 1
    }

    if (!Directory.Delete(test_dir + "/" + "../dir2",true)) {
        return 1
    }


    // restore Environment
    if (Directory.Exist(test_dir + "/" + "./dir3")) {
        Directory.Delete(test_dir + "/" + "./dir3", true)
    }

    // Round 3 Create Directory dir3 and file3
    if (!Directory.Create(test_dir + "/" + "./dir3")) {
        return 1
    }

    // Create Directory dir3/sub_1_dir3 dir3/sub_2_dir3
    if (!Directory.Create(test_dir + "/" + "./dir3/sub_1_dir3") || !Directory.Create(test_dir + "/" + "./dir3/sub_2_dir3")) {
        return 1
    }

    // Create Files dir3/sub_1_file3 dir3/sub_2_file3
    if (!File.Create(test_dir + "/" + "./dir3/sub_1_file3") || !File.Create(test_dir + "/" + "./dir3/sub_2_file3")) {
        return 1
    }


    // Round 3 Check sub-Directories and files
    /* coredump
    if (Directory.GetDirectories(test_dir + "/" + "./dir3").size() != 2) {
        return 1
    }

    if (Directory.GetFiles(test_dir + "/" + "./dir3").size() != 2) {
        return 1
    }*/

    var num_Dir3: Array<String> = Directory.GetDirectories(test_dir + "/" + "./dir3")
    var num_Files3: Array<String> = Directory.GetFiles(test_dir + "/" + "./dir3")

    if (num_Dir3.size != 2 || num_Files3.size != 2) {
        return 1
    }


    if (!Directory.Delete(test_dir + "/" + "./dir3",true)) {
        return 1
    }
	if (!deleteTestDirInPwd()) {
		return 1 
	}
    return 0
}