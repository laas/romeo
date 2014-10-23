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
  ${CMAKE_SOURCE_DIR}/launch/display_small.launch
  ${CMAKE_SOURCE_DIR}/launch/display.rviz
  ${CMAKE_SOURCE_DIR}/launch/sot_display.launch
  ${CMAKE_SOURCE_DIR}/launch/sot_display_small.launch
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

set (COLLISIONMESHES HeadRoll.dae LElbowYaw.dae LKneePitch.dae 
  LToePitch.dae LWristYaw.dae PhalaxEnd.dae RElbowYaw.dae 
  RKneePitch.dae RToePitch.dae RWristYaw.dae LAnkleRollBasic.dae 
  LHand.dae LShoulderYaw.dae LWristPitch.dae NeckPitch.dae 
  RAnkleRollBasic.dae RHand.dae RShoulderYaw.dae RWristPitch.dae 
  Torso.dae LAnkleRoll.dae LHipPitch.dae LThumb.dae LWristRoll.dae 
  Phalax.dae RAnkleRoll.dae RHipPitch.dae RThumb.dae RWristRoll.dae 
  TrunkYaw.dae
)

set (VISUALMESHES HeadRoll.dae LElbowYaw.dae LKneePitch.dae 
  LToePitch.dae LWristYaw.dae PhalaxEnd.dae RElbowYaw.dae
  RKneePitch.dae RToePitch.dae RWristYaw.dae LAnkleRoll.dae
  LHand.dae LShoulderYaw.dae LWristPitch.dae NeckPitch.dae RAnkleRoll.dae
  RHand.dae RShoulderYaw.dae RWristPitch.dae Torso.dae LAnkleRollWithouToe.dae
  LHipPitch.dae LThumb.dae LWristRoll.dae Phalax.dae RAnkleRollWithoutToe.dae
  RHipPitch.dae RThumb.dae RWristRoll.dae TrunkYaw.dae
  )

foreach(file ${COLLISIONMESHES})
  install(FILES ${CMAKE_SOURCE_DIR}/meshes/V1/collision/${file}
    DESTINATION ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}/meshes/V1/collision/
    PERMISSIONS OWNER_READ GROUP_READ WORLD_READ OWNER_WRITE
    )
endforeach()

foreach(file ${VISUALMESHES})
  install(FILES ${CMAKE_SOURCE_DIR}/meshes/V1/visual/${file}
    DESTINATION ${CMAKE_INSTALL_DATADIR}/${PROJECT_NAME}/meshes/V1/visual/
    PERMISSIONS OWNER_READ GROUP_READ WORLD_READ OWNER_WRITE
    )
endforeach()



setup_project_finalize()
