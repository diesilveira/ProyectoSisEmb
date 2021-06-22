#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/ProyectoFinalSisEmb.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/ProyectoFinalSisEmb.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=freeRTOS/croutine.c freeRTOS/event_groups.c freeRTOS/list.c freeRTOS/queue.c freeRTOS/tasks.c freeRTOS/timers.c freeRTOS/portable/MemMang/heap_4.c freeRTOS/portable/MPLAB/PIC32MM/port.c freeRTOS/portable/MPLAB/PIC32MM/port_asm.S mcc_generated_files/usb/usb_device_events.c mcc_generated_files/usb/usb_device.c mcc_generated_files/usb/usb_descriptors.c mcc_generated_files/usb/usb_device_cdc.c mcc_generated_files/system.c mcc_generated_files/clock.c mcc_generated_files/exceptions.c mcc_generated_files/interrupt_manager.c mcc_generated_files/mcc.c mcc_generated_files/pin_manager.c mcc_generated_files/rtcc.c mcc_generated_files/spi1.c mcc_generated_files/adc1.c main.c framework/Accelerometer/Accelerometer.c platform/LIS3DH/LIS3DH.c framework/Analog/Analog.c platform/WS2812.c platform/serial_port_manager.c framework/user_communications.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/freeRTOS/croutine.o ${OBJECTDIR}/freeRTOS/event_groups.o ${OBJECTDIR}/freeRTOS/list.o ${OBJECTDIR}/freeRTOS/queue.o ${OBJECTDIR}/freeRTOS/tasks.o ${OBJECTDIR}/freeRTOS/timers.o ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/exceptions.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/rtcc.o ${OBJECTDIR}/mcc_generated_files/spi1.o ${OBJECTDIR}/mcc_generated_files/adc1.o ${OBJECTDIR}/main.o ${OBJECTDIR}/framework/Accelerometer/Accelerometer.o ${OBJECTDIR}/platform/LIS3DH/LIS3DH.o ${OBJECTDIR}/framework/Analog/Analog.o ${OBJECTDIR}/platform/WS2812.o ${OBJECTDIR}/platform/serial_port_manager.o ${OBJECTDIR}/framework/user_communications.o
POSSIBLE_DEPFILES=${OBJECTDIR}/freeRTOS/croutine.o.d ${OBJECTDIR}/freeRTOS/event_groups.o.d ${OBJECTDIR}/freeRTOS/list.o.d ${OBJECTDIR}/freeRTOS/queue.o.d ${OBJECTDIR}/freeRTOS/tasks.o.d ${OBJECTDIR}/freeRTOS/timers.o.d ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o.d ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o.d ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d ${OBJECTDIR}/mcc_generated_files/system.o.d ${OBJECTDIR}/mcc_generated_files/clock.o.d ${OBJECTDIR}/mcc_generated_files/exceptions.o.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/rtcc.o.d ${OBJECTDIR}/mcc_generated_files/spi1.o.d ${OBJECTDIR}/mcc_generated_files/adc1.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/framework/Accelerometer/Accelerometer.o.d ${OBJECTDIR}/platform/LIS3DH/LIS3DH.o.d ${OBJECTDIR}/framework/Analog/Analog.o.d ${OBJECTDIR}/platform/WS2812.o.d ${OBJECTDIR}/platform/serial_port_manager.o.d ${OBJECTDIR}/framework/user_communications.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/freeRTOS/croutine.o ${OBJECTDIR}/freeRTOS/event_groups.o ${OBJECTDIR}/freeRTOS/list.o ${OBJECTDIR}/freeRTOS/queue.o ${OBJECTDIR}/freeRTOS/tasks.o ${OBJECTDIR}/freeRTOS/timers.o ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/exceptions.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/rtcc.o ${OBJECTDIR}/mcc_generated_files/spi1.o ${OBJECTDIR}/mcc_generated_files/adc1.o ${OBJECTDIR}/main.o ${OBJECTDIR}/framework/Accelerometer/Accelerometer.o ${OBJECTDIR}/platform/LIS3DH/LIS3DH.o ${OBJECTDIR}/framework/Analog/Analog.o ${OBJECTDIR}/platform/WS2812.o ${OBJECTDIR}/platform/serial_port_manager.o ${OBJECTDIR}/framework/user_communications.o

# Source Files
SOURCEFILES=freeRTOS/croutine.c freeRTOS/event_groups.c freeRTOS/list.c freeRTOS/queue.c freeRTOS/tasks.c freeRTOS/timers.c freeRTOS/portable/MemMang/heap_4.c freeRTOS/portable/MPLAB/PIC32MM/port.c freeRTOS/portable/MPLAB/PIC32MM/port_asm.S mcc_generated_files/usb/usb_device_events.c mcc_generated_files/usb/usb_device.c mcc_generated_files/usb/usb_descriptors.c mcc_generated_files/usb/usb_device_cdc.c mcc_generated_files/system.c mcc_generated_files/clock.c mcc_generated_files/exceptions.c mcc_generated_files/interrupt_manager.c mcc_generated_files/mcc.c mcc_generated_files/pin_manager.c mcc_generated_files/rtcc.c mcc_generated_files/spi1.c mcc_generated_files/adc1.c main.c framework/Accelerometer/Accelerometer.c platform/LIS3DH/LIS3DH.c framework/Analog/Analog.c platform/WS2812.c platform/serial_port_manager.c framework/user_communications.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/ProyectoFinalSisEmb.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MM0256GPM064
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o: freeRTOS/portable/MPLAB/PIC32MM/port_asm.S  .generated_files/flags/default/2431f00103596f8b065e13a2932b1aff4d60512f .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM" 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.ok ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.d"  -o ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o freeRTOS/portable/MPLAB/PIC32MM/port_asm.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.d" "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o: freeRTOS/portable/MPLAB/PIC32MM/port_asm.S  .generated_files/flags/default/b25ceb423f1efbf94a33c9154c9e95004fadd109 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM" 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.ok ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.d"  -o ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o freeRTOS/portable/MPLAB/PIC32MM/port_asm.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.asm.d",--gdwarf-2 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.d" "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/freeRTOS/croutine.o: freeRTOS/croutine.c  .generated_files/flags/default/39803ec01f0b4cc59d6ccd296b8e4772f1d3d1c1 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/croutine.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/croutine.o.d" -o ${OBJECTDIR}/freeRTOS/croutine.o freeRTOS/croutine.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/event_groups.o: freeRTOS/event_groups.c  .generated_files/flags/default/e8548bcaa83510e2d832319432547a22d530930f .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/event_groups.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/event_groups.o.d" -o ${OBJECTDIR}/freeRTOS/event_groups.o freeRTOS/event_groups.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/list.o: freeRTOS/list.c  .generated_files/flags/default/74dbfff03a72c71940a04e8c8e4a81647b020a00 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/list.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/list.o.d" -o ${OBJECTDIR}/freeRTOS/list.o freeRTOS/list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/queue.o: freeRTOS/queue.c  .generated_files/flags/default/5c33c9667d2c58ef12d72fa3b24f91167b47be5f .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/queue.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/queue.o.d" -o ${OBJECTDIR}/freeRTOS/queue.o freeRTOS/queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/tasks.o: freeRTOS/tasks.c  .generated_files/flags/default/279771a36cab18131d6c6d11aa9177179c5f17d8 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/tasks.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/tasks.o.d" -o ${OBJECTDIR}/freeRTOS/tasks.o freeRTOS/tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/timers.o: freeRTOS/timers.c  .generated_files/flags/default/134ce4d784a5cda94dea5611cd8c1a06bf28f203 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/timers.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/timers.o.d" -o ${OBJECTDIR}/freeRTOS/timers.o freeRTOS/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o: freeRTOS/portable/MemMang/heap_4.c  .generated_files/flags/default/d48027a444d1a1427f177f9b4c0bfeb989494567 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS/portable/MemMang" 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o freeRTOS/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o: freeRTOS/portable/MPLAB/PIC32MM/port.c  .generated_files/flags/default/af323de5ff276b7e171e1e8f82dbb1d88bbb265a .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM" 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o.d" -o ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o freeRTOS/portable/MPLAB/PIC32MM/port.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o: mcc_generated_files/usb/usb_device_events.c  .generated_files/flags/default/88b9676c2fda69ff76af8362f6489239b36b8c79 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o mcc_generated_files/usb/usb_device_events.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device.o: mcc_generated_files/usb/usb_device.c  .generated_files/flags/default/10610182148e5eb8f20e640fce7aee17b1b5c634 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o mcc_generated_files/usb/usb_device.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o: mcc_generated_files/usb/usb_descriptors.c  .generated_files/flags/default/3cabfb3a3fad5dfde3f9920b2b38b6b2baec264 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o mcc_generated_files/usb/usb_descriptors.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o: mcc_generated_files/usb/usb_device_cdc.c  .generated_files/flags/default/dd2d2d9de8f9da19896a2849ba244e93189cb73b .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o mcc_generated_files/usb/usb_device_cdc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/e5952da0ff4dfb4bfedc8024018c2db618e6d125 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d" -o ${OBJECTDIR}/mcc_generated_files/system.o mcc_generated_files/system.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/1df1b42d1c401f68cac92a4e9e74bf8907a5e048 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d" -o ${OBJECTDIR}/mcc_generated_files/clock.o mcc_generated_files/clock.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/exceptions.o: mcc_generated_files/exceptions.c  .generated_files/flags/default/fe24078d45d08adc78e72b17c7878f14c5afa185 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/exceptions.o.d" -o ${OBJECTDIR}/mcc_generated_files/exceptions.o mcc_generated_files/exceptions.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/d3b6f943b3ac70734454ec07018a1f71b9aaf861 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o mcc_generated_files/interrupt_manager.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/ab35d608de6f8eb2c4d52b5aea87b417aa25ef31 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/ad0c063df6cd3da1edb1b6d19882197dd516e0dc .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o mcc_generated_files/pin_manager.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/rtcc.o: mcc_generated_files/rtcc.c  .generated_files/flags/default/76e621b1bb07fab7d2c9f1202ada4c8be7bf4dbe .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/rtcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/rtcc.o mcc_generated_files/rtcc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/spi1.o: mcc_generated_files/spi1.c  .generated_files/flags/default/f9cdf407e83e66e2179ac148b1f112c2833611b3 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi1.o.d" -o ${OBJECTDIR}/mcc_generated_files/spi1.o mcc_generated_files/spi1.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  .generated_files/flags/default/9eef85c15f00df3a15e3df363f246f4b156d60af .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d" -o ${OBJECTDIR}/mcc_generated_files/adc1.o mcc_generated_files/adc1.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/3fa4e817e53b9309ad4e1face1d6d017c10900ba .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/framework/Accelerometer/Accelerometer.o: framework/Accelerometer/Accelerometer.c  .generated_files/flags/default/38c7b0ae3f3da8cbdfa5c98e6bea43a53145014a .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/framework/Accelerometer" 
	@${RM} ${OBJECTDIR}/framework/Accelerometer/Accelerometer.o.d 
	@${RM} ${OBJECTDIR}/framework/Accelerometer/Accelerometer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/framework/Accelerometer/Accelerometer.o.d" -o ${OBJECTDIR}/framework/Accelerometer/Accelerometer.o framework/Accelerometer/Accelerometer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/platform/LIS3DH/LIS3DH.o: platform/LIS3DH/LIS3DH.c  .generated_files/flags/default/189d4451fb6e5d81714d2b67cc27cf9c814faebd .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/platform/LIS3DH" 
	@${RM} ${OBJECTDIR}/platform/LIS3DH/LIS3DH.o.d 
	@${RM} ${OBJECTDIR}/platform/LIS3DH/LIS3DH.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/platform/LIS3DH/LIS3DH.o.d" -o ${OBJECTDIR}/platform/LIS3DH/LIS3DH.o platform/LIS3DH/LIS3DH.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/framework/Analog/Analog.o: framework/Analog/Analog.c  .generated_files/flags/default/ef34386a5df5a23d60513a82dee5896c4d14bb76 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/framework/Analog" 
	@${RM} ${OBJECTDIR}/framework/Analog/Analog.o.d 
	@${RM} ${OBJECTDIR}/framework/Analog/Analog.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/framework/Analog/Analog.o.d" -o ${OBJECTDIR}/framework/Analog/Analog.o framework/Analog/Analog.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/platform/WS2812.o: platform/WS2812.c  .generated_files/flags/default/9ec06d27accc917601c9e6f9cb353b2d268a4c6b .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/platform" 
	@${RM} ${OBJECTDIR}/platform/WS2812.o.d 
	@${RM} ${OBJECTDIR}/platform/WS2812.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/platform/WS2812.o.d" -o ${OBJECTDIR}/platform/WS2812.o platform/WS2812.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/platform/serial_port_manager.o: platform/serial_port_manager.c  .generated_files/flags/default/912c1d3d4e2d53543aaafb272161b200b8da7a7d .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/platform" 
	@${RM} ${OBJECTDIR}/platform/serial_port_manager.o.d 
	@${RM} ${OBJECTDIR}/platform/serial_port_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/platform/serial_port_manager.o.d" -o ${OBJECTDIR}/platform/serial_port_manager.o platform/serial_port_manager.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/framework/user_communications.o: framework/user_communications.c  .generated_files/flags/default/c76684c18aaf30353787dd56fd3ffc81337de85c .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/framework" 
	@${RM} ${OBJECTDIR}/framework/user_communications.o.d 
	@${RM} ${OBJECTDIR}/framework/user_communications.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/framework/user_communications.o.d" -o ${OBJECTDIR}/framework/user_communications.o framework/user_communications.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/freeRTOS/croutine.o: freeRTOS/croutine.c  .generated_files/flags/default/64b94fc8ed027698266364545a8d4d4635b6b31 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/croutine.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/croutine.o.d" -o ${OBJECTDIR}/freeRTOS/croutine.o freeRTOS/croutine.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/event_groups.o: freeRTOS/event_groups.c  .generated_files/flags/default/b53978a1d93c19c0e5582b443ab5b4e1a69bc62c .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/event_groups.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/event_groups.o.d" -o ${OBJECTDIR}/freeRTOS/event_groups.o freeRTOS/event_groups.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/list.o: freeRTOS/list.c  .generated_files/flags/default/809765e45fe3b5910395b4c43007f8caaa547fcf .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/list.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/list.o.d" -o ${OBJECTDIR}/freeRTOS/list.o freeRTOS/list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/queue.o: freeRTOS/queue.c  .generated_files/flags/default/679667157b5710200e93f57365e1a68a5d1a8749 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/queue.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/queue.o.d" -o ${OBJECTDIR}/freeRTOS/queue.o freeRTOS/queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/tasks.o: freeRTOS/tasks.c  .generated_files/flags/default/8b7f24531eeebac5aed3fea04a6708f67d658715 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/tasks.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/tasks.o.d" -o ${OBJECTDIR}/freeRTOS/tasks.o freeRTOS/tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/timers.o: freeRTOS/timers.c  .generated_files/flags/default/c5375596a9bd0f43c9cf61425c7da8636b3d4bbd .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS" 
	@${RM} ${OBJECTDIR}/freeRTOS/timers.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/timers.o.d" -o ${OBJECTDIR}/freeRTOS/timers.o freeRTOS/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o: freeRTOS/portable/MemMang/heap_4.c  .generated_files/flags/default/9c2061205920287ae271d91eca4d3f37dd81505 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS/portable/MemMang" 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o.d" -o ${OBJECTDIR}/freeRTOS/portable/MemMang/heap_4.o freeRTOS/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o: freeRTOS/portable/MPLAB/PIC32MM/port.c  .generated_files/flags/default/a69d31ff614b6a60e7dab35dbcb270c71d6eea40 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM" 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o.d 
	@${RM} ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o.d" -o ${OBJECTDIR}/freeRTOS/portable/MPLAB/PIC32MM/port.o freeRTOS/portable/MPLAB/PIC32MM/port.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o: mcc_generated_files/usb/usb_device_events.c  .generated_files/flags/default/105e83fc17ae4b144c3753ed3f3461305aa5a3c0 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_events.o mcc_generated_files/usb/usb_device_events.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device.o: mcc_generated_files/usb/usb_device.c  .generated_files/flags/default/b8c720c494e40cab4e0717822730cf6c1620ef71 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device.o mcc_generated_files/usb/usb_device.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o: mcc_generated_files/usb/usb_descriptors.c  .generated_files/flags/default/df4ea7a2364fc5b8ea75f902a2687cd1c8482c3a .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_descriptors.o mcc_generated_files/usb/usb_descriptors.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o: mcc_generated_files/usb/usb_device_cdc.c  .generated_files/flags/default/71eee950071f0384289962c6547495f249076152 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/usb" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o.d" -o ${OBJECTDIR}/mcc_generated_files/usb/usb_device_cdc.o mcc_generated_files/usb/usb_device_cdc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/39ee2dde0a38b6f1e05fece2009903cebea369 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d" -o ${OBJECTDIR}/mcc_generated_files/system.o mcc_generated_files/system.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/afcde77fef234a54c97306f5096d1e4dbb418bc9 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d" -o ${OBJECTDIR}/mcc_generated_files/clock.o mcc_generated_files/clock.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/exceptions.o: mcc_generated_files/exceptions.c  .generated_files/flags/default/53541c7459660dca9ecccce991fa605809af2d03 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/exceptions.o.d" -o ${OBJECTDIR}/mcc_generated_files/exceptions.o mcc_generated_files/exceptions.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/7abfd28860616a7e6a5b4dc700fdf675b98747d0 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o mcc_generated_files/interrupt_manager.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/6aa6f5c784835dc748fbef1a8dc1ab3d4761aa62 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/mcc.o mcc_generated_files/mcc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/2a4b2b81585c7eeef85a915764600835be1484d3 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d" -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o mcc_generated_files/pin_manager.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/rtcc.o: mcc_generated_files/rtcc.c  .generated_files/flags/default/315662e01019252a50407632ff3068f5b475f225 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/rtcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/rtcc.o.d" -o ${OBJECTDIR}/mcc_generated_files/rtcc.o mcc_generated_files/rtcc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/spi1.o: mcc_generated_files/spi1.c  .generated_files/flags/default/3a64368c7faca096c5d2a5da98045187a52349ff .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi1.o.d" -o ${OBJECTDIR}/mcc_generated_files/spi1.o mcc_generated_files/spi1.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mcc_generated_files/adc1.o: mcc_generated_files/adc1.c  .generated_files/flags/default/5374dd04b86dbe118b184e8f4a346812cf0c151 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/adc1.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/adc1.o.d" -o ${OBJECTDIR}/mcc_generated_files/adc1.o mcc_generated_files/adc1.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/66218463bf6ec35665d32b04e0d9fd5497edfd3b .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/framework/Accelerometer/Accelerometer.o: framework/Accelerometer/Accelerometer.c  .generated_files/flags/default/5d66d38129e4a2e6c7f7e1fee8ebbd67dcbbbc3b .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/framework/Accelerometer" 
	@${RM} ${OBJECTDIR}/framework/Accelerometer/Accelerometer.o.d 
	@${RM} ${OBJECTDIR}/framework/Accelerometer/Accelerometer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/framework/Accelerometer/Accelerometer.o.d" -o ${OBJECTDIR}/framework/Accelerometer/Accelerometer.o framework/Accelerometer/Accelerometer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/platform/LIS3DH/LIS3DH.o: platform/LIS3DH/LIS3DH.c  .generated_files/flags/default/4b169bee823321e18ed36513970217199c59d8e8 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/platform/LIS3DH" 
	@${RM} ${OBJECTDIR}/platform/LIS3DH/LIS3DH.o.d 
	@${RM} ${OBJECTDIR}/platform/LIS3DH/LIS3DH.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/platform/LIS3DH/LIS3DH.o.d" -o ${OBJECTDIR}/platform/LIS3DH/LIS3DH.o platform/LIS3DH/LIS3DH.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/framework/Analog/Analog.o: framework/Analog/Analog.c  .generated_files/flags/default/35fdaaa251d1d4e9596ae0941d4b8f462ed5a673 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/framework/Analog" 
	@${RM} ${OBJECTDIR}/framework/Analog/Analog.o.d 
	@${RM} ${OBJECTDIR}/framework/Analog/Analog.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/framework/Analog/Analog.o.d" -o ${OBJECTDIR}/framework/Analog/Analog.o framework/Analog/Analog.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/platform/WS2812.o: platform/WS2812.c  .generated_files/flags/default/2b0482b59072f9d3f20ea3e238d53287155c3195 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/platform" 
	@${RM} ${OBJECTDIR}/platform/WS2812.o.d 
	@${RM} ${OBJECTDIR}/platform/WS2812.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/platform/WS2812.o.d" -o ${OBJECTDIR}/platform/WS2812.o platform/WS2812.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/platform/serial_port_manager.o: platform/serial_port_manager.c  .generated_files/flags/default/a5b60bae64541cd6d8499e87bf48c2070e4d8449 .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/platform" 
	@${RM} ${OBJECTDIR}/platform/serial_port_manager.o.d 
	@${RM} ${OBJECTDIR}/platform/serial_port_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/platform/serial_port_manager.o.d" -o ${OBJECTDIR}/platform/serial_port_manager.o platform/serial_port_manager.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/framework/user_communications.o: framework/user_communications.c  .generated_files/flags/default/15523d3b1c500f217ed2c2b0c827801cebedb5ae .generated_files/flags/default/90b386029bd3786c6bb60d0a18451b496f288066
	@${MKDIR} "${OBJECTDIR}/framework" 
	@${RM} ${OBJECTDIR}/framework/user_communications.o.d 
	@${RM} ${OBJECTDIR}/framework/user_communications.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"freeRTOS/include" -I"freeRTOS/portable/MPLAB/PIC32MM" -MP -MMD -MF "${OBJECTDIR}/framework/user_communications.o.d" -o ${OBJECTDIR}/framework/user_communications.o framework/user_communications.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -I freeRTOS/include -I freeRTOS/portable/MPLAB/PIC32MM -I .. -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/ProyectoFinalSisEmb.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/ProyectoFinalSisEmb.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC016FF -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=1024,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/ProyectoFinalSisEmb.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/ProyectoFinalSisEmb.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=1024,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/ProyectoFinalSisEmb.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
