; ModuleID = 'Reptile'
source_filename = "Reptile"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"

declare i32 @printf(i8*, ...)

declare { i32, i32, i32 } @Rgb(i32, i32, i32)

declare { double, double, { i32, i32, i32 }, double } @Pointer(double, double, { i32, i32, i32 }, double)

declare { double, double } @Canvas(double, double)

declare { i1, { double, double } } @File(i1, { double, double })

define i32 @main() {
entry:
  %Rgb = call { i32, i32, i32 } @Rgb(i32 1, i32 2, i32 3)
  ret i32 0
}
