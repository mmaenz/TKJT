################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CXX_SRCS += \
../src/JtProperty/JtProperty_Base.cxx \
../src/JtProperty/JtProperty_LateLoaded.cxx \
../src/JtProperty/JtProperty_String.cxx 

OBJS += \
./src/JtProperty/JtProperty_Base.o \
./src/JtProperty/JtProperty_LateLoaded.o \
./src/JtProperty/JtProperty_String.o 

CXX_DEPS += \
./src/JtProperty/JtProperty_Base.d \
./src/JtProperty/JtProperty_LateLoaded.d \
./src/JtProperty/JtProperty_String.d 


# Each subdirectory must supply rules for building sources it contributes
src/JtProperty/%.o: ../src/JtProperty/%.cxx
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++0x -I../src/JtNode -I../src/JtDecode -I../src/JtElement -I../src/JtProperty -I../src/JtToTopoDS -I../src/JtAttribute -I../src/JtData -I/usr/local/include/opencascade -I/usr/local/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


