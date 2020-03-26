################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CXX_SRCS += \
../src/JtNode/JtNode_Base.cxx \
../src/JtNode/JtNode_Group.cxx \
../src/JtNode/JtNode_Instance.cxx \
../src/JtNode/JtNode_LOD.cxx \
../src/JtNode/JtNode_MetaData.cxx \
../src/JtNode/JtNode_Part.cxx \
../src/JtNode/JtNode_Partition.cxx \
../src/JtNode/JtNode_RangeLOD.cxx \
../src/JtNode/JtNode_Shape_Base.cxx \
../src/JtNode/JtNode_Shape_TriStripSet.cxx \
../src/JtNode/JtNode_Shape_Vertex.cxx 

OBJS += \
./src/JtNode/JtNode_Base.o \
./src/JtNode/JtNode_Group.o \
./src/JtNode/JtNode_Instance.o \
./src/JtNode/JtNode_LOD.o \
./src/JtNode/JtNode_MetaData.o \
./src/JtNode/JtNode_Part.o \
./src/JtNode/JtNode_Partition.o \
./src/JtNode/JtNode_RangeLOD.o \
./src/JtNode/JtNode_Shape_Base.o \
./src/JtNode/JtNode_Shape_TriStripSet.o \
./src/JtNode/JtNode_Shape_Vertex.o 

CXX_DEPS += \
./src/JtNode/JtNode_Base.d \
./src/JtNode/JtNode_Group.d \
./src/JtNode/JtNode_Instance.d \
./src/JtNode/JtNode_LOD.d \
./src/JtNode/JtNode_MetaData.d \
./src/JtNode/JtNode_Part.d \
./src/JtNode/JtNode_Partition.d \
./src/JtNode/JtNode_RangeLOD.d \
./src/JtNode/JtNode_Shape_Base.d \
./src/JtNode/JtNode_Shape_TriStripSet.d \
./src/JtNode/JtNode_Shape_Vertex.d 


# Each subdirectory must supply rules for building sources it contributes
src/JtNode/%.o: ../src/JtNode/%.cxx
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++0x -I../src/JtNode -I../src/JtDecode -I../src/JtElement -I../src/JtProperty -I../src/JtToTopoDS -I../src/JtAttribute -I../src/JtData -I/usr/local/include/opencascade -I/usr/local/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


