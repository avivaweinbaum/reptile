; ModuleID = 'Reptile'
source_filename = "Reptile"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%g\0A\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@str = private unnamed_addr constant [14 x i8] c"pixeltest.png\00"

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
  %can = alloca { i32, i32 }
  %Canvas = call { i32, i32 } @Canvas(i32 400, i32 400)
  store { i32, i32 } %Canvas, { i32, i32 }* %can
  %can1 = load { i32, i32 }, { i32, i32 }* %can
  %create = call i32 @create({ i32, i32 } %can1)
  %ptr = alloca { i32, i32, { i32, i32, i32 }, double }
  %Rgb = call { i32, i32, i32 } @Rgb(i32 100, i32 100, i32 100)
  %Pointer = call { i32, i32, { i32, i32, i32 }, double } @Pointer(i32 200, i32 200, { i32, i32, i32 } %Rgb, double 3.100000e+00)
  store { i32, i32, { i32, i32, i32 }, double } %Pointer, { i32, i32, { i32, i32, i32 }, double }* %ptr
  %ptr2 = load { i32, i32, { i32, i32, i32 }, double }, { i32, i32, { i32, i32, i32 }, double }* %ptr
  %pixel = call { i32, i32, { i32, i32, i32 }, double } @pixel({ i32, i32, { i32, i32, i32 }, double } %ptr2, i32 200, i32 200)
  store { i32, i32, { i32, i32, i32 }, double } %pixel, { i32, i32, { i32, i32, i32 }, double }* %ptr
  %ptr3 = load { i32, i32, { i32, i32, i32 }, double }, { i32, i32, { i32, i32, i32 }, double }* %ptr
  %pixel4 = call { i32, i32, { i32, i32, i32 }, double } @pixel({ i32, i32, { i32, i32, i32 }, double } %ptr3, i32 201, i32 200)
  store { i32, i32, { i32, i32, i32 }, double } %pixel4, { i32, i32, { i32, i32, i32 }, double }* %ptr
  %ptr5 = load { i32, i32, { i32, i32, i32 }, double }, { i32, i32, { i32, i32, i32 }, double }* %ptr
  %pixel6 = call { i32, i32, { i32, i32, i32 }, double } @pixel({ i32, i32, { i32, i32, i32 }, double } %ptr5, i32 202, i32 200)
  store { i32, i32, { i32, i32, i32 }, double } %pixel6, { i32, i32, { i32, i32, i32 }, double }* %ptr
  %ptr7 = load { i32, i32, { i32, i32, i32 }, double }, { i32, i32, { i32, i32, i32 }, double }* %ptr
  %pixel8 = call { i32, i32, { i32, i32, i32 }, double } @pixel({ i32, i32, { i32, i32, i32 }, double } %ptr7, i32 203, i32 200)
  store { i32, i32, { i32, i32, i32 }, double } %pixel8, { i32, i32, { i32, i32, i32 }, double }* %ptr
  %ptr9 = load { i32, i32, { i32, i32, i32 }, double }, { i32, i32, { i32, i32, i32 }, double }* %ptr
  %pixel10 = call { i32, i32, { i32, i32, i32 }, double } @pixel({ i32, i32, { i32, i32, i32 }, double } %ptr9, i32 204, i32 200)
  store { i32, i32, { i32, i32, i32 }, double } %pixel10, { i32, i32, { i32, i32, i32 }, double }* %ptr
  %ptr11 = load { i32, i32, { i32, i32, i32 }, double }, { i32, i32, { i32, i32, i32 }, double }* %ptr
  %pixel12 = call { i32, i32, { i32, i32, i32 }, double } @pixel({ i32, i32, { i32, i32, i32 }, double } %ptr11, i32 205, i32 200)
  store { i32, i32, { i32, i32, i32 }, double } %pixel12, { i32, i32, { i32, i32, i32 }, double }* %ptr
  %save = call i32 @save(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @str, i32 0, i32 0))
  ret i32 0
}
