################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CXX_SRCS += \
../src/JtDecode/JtDecode_BitReader.cxx \
../src/JtDecode/JtDecode_Int32CDP.cxx \
../src/JtDecode/JtDecode_Int32CDP_Arithmetic.cxx \
../src/JtDecode/JtDecode_Int32CDP_Bitlength.cxx \
../src/JtDecode/JtDecode_Int32CDP_Bitlength2.cxx \
../src/JtDecode/JtDecode_Int32CDP_Bits.cxx \
../src/JtDecode/JtDecode_Int32CDP_Chopper.cxx \
../src/JtDecode/JtDecode_Int32CDP_Huffman.cxx \
../src/JtDecode/JtDecode_Int32CDP_Null.cxx \
../src/JtDecode/JtDecode_MeshCoderDriver.cxx \
../src/JtDecode/JtDecode_ProbContext.cxx \
../src/JtDecode/JtDecode_Unpack.cxx \
../src/JtDecode/JtDecode_VertexData.cxx \
../src/JtDecode/JtDecode_VertexData_Deering.cxx \
../src/JtDecode/JtDecode_VertexData_ExpMant.cxx \
../src/JtDecode/JtDecode_VertexData_Quantized.cxx 

OBJS += \
./src/JtDecode/JtDecode_BitReader.o \
./src/JtDecode/JtDecode_Int32CDP.o \
./src/JtDecode/JtDecode_Int32CDP_Arithmetic.o \
./src/JtDecode/JtDecode_Int32CDP_Bitlength.o \
./src/JtDecode/JtDecode_Int32CDP_Bitlength2.o \
./src/JtDecode/JtDecode_Int32CDP_Bits.o \
./src/JtDecode/JtDecode_Int32CDP_Chopper.o \
./src/JtDecode/JtDecode_Int32CDP_Huffman.o \
./src/JtDecode/JtDecode_Int32CDP_Null.o \
./src/JtDecode/JtDecode_MeshCoderDriver.o \
./src/JtDecode/JtDecode_ProbContext.o \
./src/JtDecode/JtDecode_Unpack.o \
./src/JtDecode/JtDecode_VertexData.o \
./src/JtDecode/JtDecode_VertexData_Deering.o \
./src/JtDecode/JtDecode_VertexData_ExpMant.o \
./src/JtDecode/JtDecode_VertexData_Quantized.o 

CXX_DEPS += \
./src/JtDecode/JtDecode_BitReader.d \
./src/JtDecode/JtDecode_Int32CDP.d \
./src/JtDecode/JtDecode_Int32CDP_Arithmetic.d \
./src/JtDecode/JtDecode_Int32CDP_Bitlength.d \
./src/JtDecode/JtDecode_Int32CDP_Bitlength2.d \
./src/JtDecode/JtDecode_Int32CDP_Bits.d \
./src/JtDecode/JtDecode_Int32CDP_Chopper.d \
./src/JtDecode/JtDecode_Int32CDP_Huffman.d \
./src/JtDecode/JtDecode_Int32CDP_Null.d \
./src/JtDecode/JtDecode_MeshCoderDriver.d \
./src/JtDecode/JtDecode_ProbContext.d \
./src/JtDecode/JtDecode_Unpack.d \
./src/JtDecode/JtDecode_VertexData.d \
./src/JtDecode/JtDecode_VertexData_Deering.d \
./src/JtDecode/JtDecode_VertexData_ExpMant.d \
./src/JtDecode/JtDecode_VertexData_Quantized.d 


# Each subdirectory must supply rules for building sources it contributes
src/JtDecode/%.o: ../src/JtDecode/%.cxx
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -std=c++0x -I../src/JtNode -I../src/JtDecode -I../src/JtElement -I../src/JtProperty -I../src/JtToTopoDS -I../src/JtAttribute -I../src/JtData -I/usr/local/include/opencascade -I/usr/local/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


