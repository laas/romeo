cmake_minimum_required(VERSION 2.8)
project(romeo_description)

find_package(catkin)

catkin_package()

set(PROJECT_DESCRIPTION Model of Romeo robot by Aldebaran Robotics)
set(PROJECT_URL github.com/laas/romeo)

include(cmake/base.cmake)
setup_project()
# Install launch file
install(FILES ${CMAKE_SOURCE_DIR}/launch/display.launch
  ${CMAKE_SOURCE_DIR}/launch/display.rviz
  ${CMAKE_SOURCE_DIR}/launch/sot_display.launch
  DESTINATION ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}/launch
)
# Install generated urdf files
install(FILES ${CMAKE_SOURCE_DIR}/urdf/romeo.urdf
  ${CMAKE_SOURCE_DIR}/urdf/romeo_small.urdf
  DESTINATION ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}/urdf
  )

# Install srdf files
install(FILES
  ${CMAKE_SOURCE_DIR}/srdf/romeo.srdf
  ${CMAKE_SOURCE_DIR}/srdf/romeo_small.srdf
  DESTINATION ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}/srdf
  )

# Install rcpdf files
install(FILES
  ${CMAKE_SOURCE_DIR}/rcpdf/romeo.rcpdf
  DESTINATION ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}/rcpdf
  )

# Install meshes

set (MESHES HeadRoll.dae LAnkleRollBasic.dae LAnkleRoll.dae
  LElbowYaw.dae LHand.dae LHipPitch.dae LKneePitch.dae
  LShoulderYaw.dae LThumb.dae LToePitch.dae LWristPitch.dae
  LWristRoll.dae NeckPitch.dae Phalax.dae PhalaxEnd.dae
  RAnkleRollBasic.dae RAnkleRoll.dae RElbowYaw.dae RHand.dae
  RHipPitch.dae RKneePitch.dae RShoulderYaw.dae RThumb.dae
  RToePitch.dae RWristPitch.dae RWristRoll.dae Torso.dae Waist.dae
  WristYaw.dae
  )

foreach(file ${MESHES})
  install(FILES ${CMAKE_SOURCE_DIR}/meshes/${file}
    DESTINATION ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}/meshes
    PERMISSIONS OWNER_READ GROUP_READ WORLD_READ OWNER_WRITE
    )
endforeach()

setup_project_finalize()
