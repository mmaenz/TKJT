################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CXX_SRCS += \
../src/JtData/JtData_DeferredObject.cxx \
../src/JtData/JtData_FileReader.cxx \
../src/JtData/JtData_Inflate.cxx \
../src/JtData/JtData_Model.cxx \
../src/JtData/JtData_Object.cxx \
../src/JtData/JtData_Reader.cxx \
../src/JtData/JtData_Types.cxx 

OBJS += \
./src/JtData/JtData_DeferredObject.o \
./src/JtData/JtData_FileReader.o \
./src/JtData/JtData_Inflate.o \
./src/JtData/JtData_Model.o \
./src/JtData/JtData_Object.o \
./src/JtData/JtData_Reader.o \
./src/JtData/JtData_Types.o 

CXX_DEPS += \
./src/JtData/JtData_DeferredObject.d \
./src/JtData/JtData_FileReader.d \
./src/JtData/JtData_Inflate.d \
./src/JtData/JtData_Model.d \
./src/JtData/JtData_Object.d \
./src/JtData/JtData_Reader.d \
./src/JtData/JtData_Types.d 


# Each subdirectory must supply rules for building sources it contributes
src/JtData/%.o: ../src/JtData/%.cxx
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++0x -I../src/JtNode -I../src/JtDecode -I../src/JtElement -I../src/JtProperty -I../src/JtToTopoDS -I../src/JtAttribute -I../src/JtData -I/usr/local/include/opencascade -I/usr/local/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


