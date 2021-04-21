; ModuleID = 'Reptile'
source_filename = "Reptile"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"

declare i32 @printf(i8*, ...)

declare { i32, i32, i32 } @Rgb(i32, i32, i32)

declare { i32, i32, { i32, i32, i32 }, double } @Pointer(i32, i32, { i32, i32, i32 }, double)

declare { i32, i32 } @Canvas(i32, i32)

declare { i8*, { i32, i32 } } @File(i8*, { i32, i32 })

declare i32 @create({ i32, i32 })

declare i32 @save(i8*)

declare { i32, i32, { i32, i32, i32 }, double } @pixel({ i32, i32, { i32, i32, i32 }, double }, i32, i32)

define i32 @main() {
entry:
  %color = alloca { i32, i32, i32 }
  %Rgb = call { i32, i32, i32 } @Rgb(i32 1, i32 2, i32 5)
  store { i32, i32, i32 } %Rgb, { i32, i32, i32 }* %color
  %pt = alloca { i32, i32, { i32, i32, i32 }, double }
  %color1 = load { i32, i32, i32 }, { i32, i32, i32 }* %color
  %Pointer = call { i32, i32, { i32, i32, i32 }, double } @Pointer(i32 50, i32 60, { i32, i32, i32 } %color1, double 9.000000e+01)
  store { i32, i32, { i32, i32, i32 }, double } %Pointer, { i32, i32, { i32, i32, i32 }, double }* %pt
  ret i32 0
}
