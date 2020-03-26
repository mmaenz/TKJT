################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CXX_SRCS += \
../src/JtElement/JtElement_MetaData_PMIManager.cxx \
../src/JtElement/JtElement_ShapeLOD_Base.cxx \
../src/JtElement/JtElement_ShapeLOD_TriStripSet.cxx \
../src/JtElement/JtElement_ShapeLOD_Vertex.cxx \
../src/JtElement/JtElement_XTBRep.cxx 

OBJS += \
./src/JtElement/JtElement_MetaData_PMIManager.o \
./src/JtElement/JtElement_ShapeLOD_Base.o \
./src/JtElement/JtElement_ShapeLOD_TriStripSet.o \
./src/JtElement/JtElement_ShapeLOD_Vertex.o \
./src/JtElement/JtElement_XTBRep.o 

CXX_DEPS += \
./src/JtElement/JtElement_MetaData_PMIManager.d \
./src/JtElement/JtElement_ShapeLOD_Base.d \
./src/JtElement/JtElement_ShapeLOD_TriStripSet.d \
./src/JtElement/JtElement_ShapeLOD_Vertex.d \
./src/JtElement/JtElement_XTBRep.d 


# Each subdirectory must supply rules for building sources it contributes
src/JtElement/%.o: ../src/JtElement/%.cxx
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++0x -I../src/JtNode -I../src/JtDecode -I../src/JtElement -I../src/JtProperty -I../src/JtToTopoDS -I../src/JtAttribute -I../src/JtData -I/usr/local/include/opencascade -I/usr/local/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


