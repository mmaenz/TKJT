################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CXX_SRCS += \
../src/JtAttribute/JtAttribute_Base.cxx \
../src/JtAttribute/JtAttribute_GeometricTransform.cxx \
../src/JtAttribute/JtAttribute_Material.cxx 

OBJS += \
./src/JtAttribute/JtAttribute_Base.o \
./src/JtAttribute/JtAttribute_GeometricTransform.o \
./src/JtAttribute/JtAttribute_Material.o 

CXX_DEPS += \
./src/JtAttribute/JtAttribute_Base.d \
./src/JtAttribute/JtAttribute_GeometricTransform.d \
./src/JtAttribute/JtAttribute_Material.d 


# Each subdirectory must supply rules for building sources it contributes
src/JtAttribute/%.o: ../src/JtAttribute/%.cxx
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++0x -I../src/JtNode -I../src/JtDecode -I../src/JtElement -I../src/JtProperty -I../src/JtToTopoDS -I../src/JtAttribute -I../src/JtData -I/usr/local/include/opencascade -I/usr/local/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


