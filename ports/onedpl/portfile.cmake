vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO oneapi-src/oneDPL
    REF oneDPL-2021.6.1-release
    SHA512 57345f4789c86d5b71cba525c11ff7d2fc925791f6c5fe9099960afa2c42e05d04a6d024be65d6b52a9e3f1fd0f44412ea064ea84def7f7008adce4db0e78b21
    HEAD_REF master
    PATCHES
      cmake-config-include-path.cmake
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${DPLL_OPTIONS}
)
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME onedpl CONFIG_PATH lib/cmake/oneDPL)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib" "${CURRENT_PACKAGES_DIR}/lib")

# Copyright and license
file(INSTALL "${SOURCE_PATH}/licensing/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
