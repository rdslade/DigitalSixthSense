# Created by Microsemi Libero Software 11.9.0.4
# Thu Apr 11 14:52:41 2019

# (OPEN DESIGN)

open_design "core.adb"

# set default back-annotation base-name
set_defvar "BA_NAME" "core_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {C:\Users\rdslade\Desktop\373final\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"


# import of input files
import_source  \
-format "edif" -edif_flavor "GENERIC" -netlist_naming "VERILOG" {../../synthesis/core.edn} -merge_physical "no" -merge_timing "yes"
compile
report -type "status" {core_compile_report.txt}
report -type "pin" -listby "name" {core_report_pin_byname.txt}
report -type "pin" -listby "number" {core_report_pin_bynumber.txt}

save_design
