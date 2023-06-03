project(CasterSoundboard)

cmake_minimum_required(VERSION 3.16 FATAL_ERROR)
set(QT_MIN_VERSION "5.15.2")

################# set KDE specific information #################

find_package(ECM 5.86.0 REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})

find_package(Qt5 ${QT_MIN_VERSION} CONFIG REQUIRED COMPONENTS Core DBus Quick Widgets QuickControls2)

find_package(KF5 REQUIRED Notifications)

include(KDEInstallDirs)
include(KDECMakeSettings)
include(KDECompilerSettings NO_POLICY_SCOPE)

include(ECMInstallIcons)
include(ECMPackageConfigHelpers)
include(ECMOptionalAddSubdirectory)

include_directories(${Qt5Core_PRIVATE_INCLUDE_DIRS})

qt5_add_resources(CasterSoundboard_SRCS qml.qrc)

add_executable(CasterSoundboard ${CasterSoundboard_SRCS}
    casterplayer_controller.cpp 
    casterplayer_model.cpp
    main.cpp
)

set_target_properties(CasterSoundboard PROPERTIES INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR}/CasterSoundboard)

target_link_libraries(CasterSoundboard LINK_PUBLIC Qt5::QuickControls2 Qt5::Widgets Qt5::Quick Qt5::DBus Qt5::Core KF5::Notifications)

install(TARGETS CasterSoundboard ${INSTALL_TARGETS_DEFAULT_ARGS})

install(PROGRAMS com.covarianttensor.CasterSoundboard.desktop  DESTINATION ${KDE_INSTALL_APPDIR})
install(FILES com.covarianttensor.CasterSoundboard.appdata.xml DESTINATION ${KDE_INSTALL_METAINFODIR})
