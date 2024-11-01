from conans import ConanFile
import os

class S5D9GccNoneEabiToolchain(ConanFile):
    name = "s5d9-gcc-none-eabi-toolchain"
    version = "9-2019-q4"
    exports_sources = "*"
    no_copy_source = True
    generators = "cmake_paths"
    license = "Innovatrics"
    description = "CMake toolchain for gcc-none-eabi on S5D9."
    url = "https://www.innovatrics.com/"

    requires = "gcc-arm-none-eabi/9-2019-q4@algo/testing"

    options = {
        "float_abi": ["soft", "softfp", "hard"]
    }
    default_options = {
        "float_abi": "hard"
    }

    def package(self):
        self.copy("*")

    def package_info(self):
        self.env_info.CONAN_CMAKE_TOOLCHAIN_FILE = os.path.join(self.package_folder, "s5d9-gcc-toolchain.cmake")
        self.env_info.FLOAT_ABI = str(self.options.float_abi)
        bin_folder = os.path.join(self.package_folder)
        self.env_info.PATH.append(bin_folder)
