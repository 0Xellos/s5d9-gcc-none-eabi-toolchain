# CMake toolchain file for Renesas S5D9

# Include generic ARM GCC settings
include(${CMAKE_CURRENT_LIST_DIR}/armgcc.cmake)

# Device specific compile flags
set(FLOAT_ABI_FLAG $ENV{FLOAT_ABI})
set(S5D9_ABI "-mfloat-abi=${FLOAT_ABI_FLAG} -mfpu=fpv4-sp-d16 -fabi-version=0")
set(S5D9_DEFINITIONS "-D_RENESAS_SYNERGY_")
set(S5D9_FLAGS "${S5D9_ABI} ${S5D9_DEFINITIONS} -mcpu=cortex-m4 -mthumb -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -Wall -Wextra -Wmissing-declarations -Wconversion -Wpointer-arith -Wshadow -Wlogical-op -Waggregate-return -Wfloat-equal")
set(S5D9_LINK_FLAGS "-T${CMAKE_CURRENT_LIST_DIR}/s5d9_flash.ld -Xlinker --gc-sections -Wl,-Map,s5d9.map --specs=nano.specs -u _printf_float")

set(CMAKE_ASM_FLAGS_DEBUG_INIT "${S5D9_FLAGS}")
set(CMAKE_ASM_FLAGS_RELEASE_INIT "${S5D9_FLAGS}")
set(CMAKE_ASM_FLAGS_RELWITHDEBINFO_INIT "${S5D9_FLAGS}")
set(CMAKE_ASM_FLAGS_MINSIZEREL_INIT "${S5D9_FLAGS}")

set(CMAKE_C_FLAGS_DEBUG_INIT "${S5D9_FLAGS}")
set(CMAKE_C_FLAGS_RELEASE_INIT "${S5D9_FLAGS}")
set(CMAKE_C_FLAGS_RELWITHDEBINFO_INIT "${S5D9_FLAGS}")
set(CMAKE_C_FLAGS_MINSIZEREL_INIT "${S5D9_FLAGS}")

set(CMAKE_CXX_FLAGS_DEBUG_INIT "${S5D9_FLAGS} --no-exceptions")
set(CMAKE_CXX_FLAGS_RELEASE_INIT "${S5D9_FLAGS} --no-exceptions")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT "${S5D9_FLAGS} --no-exceptions")
set(CMAKE_CXX_FLAGS_MINSIZEREL_INIT "${S5D9_FLAGS} --no-exceptions")

set(CMAKE_EXE_LINKER_FLAGS_DEBUG_INIT "${S5D9_LINK_FLAGS} --specs=rdimon.specs -lc -lrdimon")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE_INIT "${S5D9_LINK_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO_INIT "${S5D9_LINK_FLAGS} --specs=rdimon.specs -lc -lrdimon")
set(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL_INIT "${S5D9_LINK_FLAGS}")

