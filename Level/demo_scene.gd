extends Node3D

@onready var gate = $puzzle/Gate
@onready var gate_2 = $puzzle/Gate2
@onready var player = $Player
@onready var gate_3: StaticBody3D = $puzzle/Gate3
@onready var purple_panel_4: StaticBody3D = $puzzle/purple_panel4
@onready var gate_4: StaticBody3D = $puzzle/Gate4
@onready var gate_5: StaticBody3D = $puzzle/Gate5
@onready var gate_6: StaticBody3D = $puzzle/Gate6
@onready var gate_7 = $puzzle/Gate7
@onready var large_gate = $"puzzle/Large Gate"
@onready var mini_critter_spawner = $Critters/MiniCritterSpawner
@onready var tp_point = $puzzle/tp_point
@onready var gate_8 = $puzzle/Gate8
@onready var puzzle_1_sfx = $puzzle/puzzle1_sfx
@onready var mini_critter_spawner_2 = $Critters/MiniCritterSpawner2
@onready var mini_critter_spawner_3 = $Critters/MiniCritterSpawner3
@onready var mini_critter_spawner_4 = $Critters/MiniCritterSpawner4
@onready var gate_9 = $Gate
@onready var gate_10 = $Gate2
@onready var large_gate2 = $"Large Gate"
@onready var large_gate3 = $"Large Gate2"
@onready var tp1 = $puzzle/tp1
@onready var gate_11: StaticBody3D = $Gate3
@onready var gate_12 = $csg/Gate
@onready var gate_13 = $Gate4
@onready var large_gate4 = $"PlaywatchCams/Large Gate"
@onready var gate_14 = $Gate5
@onready var purple_scanner1 = $"systeme redly/Purple Scanner2"
@onready var large_gate5 = $"Large Gate3"
@onready var gate_15 = $Gate7 
@onready var door = $Door15
@onready var gate_16 = $"systeme redly/Gate6"
@onready var tp_point2 = $puzzle/tp_point2
@onready var door1 = $Door5
@onready var door2 = $Door16
@onready var large_gate6 = $"Large Gate3"
@onready var gate_17 = $Gate6
@onready var gate_18 = $Gate8
@onready var gate_19 = $Node/Gate9
@onready var gate_20 = $Node/Gate16
@onready var gate_21 = $Node/Gate22
@onready var green_scanner1 = $"Node/Green Scanner15"
@onready var gate_22 = $Node/Gate21
@onready var blue_scanner = $"Node/Blue Scanner"
@onready var large_gate7 = $"Node/Large Gate4"
@onready var gate_23 = $Node/Gate28
@onready var large_gate8 = $"Large Gate4"
@onready var large_gate9 = $"Large Gate5"
@onready var ventgate1 = $Gate10
@onready var door3 = $Door17
@onready var gate_24 = $Gate12
@onready var gate_25 = $Gate14
@onready var gate_26 = $Gate15
@onready var gate_27 = $Gate17
@onready var gate_28 = $Gate16
@onready var gate1 = $Gate19
@onready var gate2 = $Gate18
@onready var gate3 = $Gate20
@onready var largegate1 = $"Large Gate7"
@onready var gate4 = $Gate21
@onready var gate5 = $Gate22
@onready var gate6 = $Gate23
@onready var ws1 = $Node3D/WhiteScanner3
@onready var ws2 = $Node3D/WhiteScanner4
@onready var rs1 = $"Node3D/Red Scanner4"
@onready var vs1 = $"Node3D/Purple Scanner4"
@onready var vs2 = $"Node3D/Purple Scanner3"
@onready var gs1 = $"Node3D/Green Scanner3"
@onready var futr1 = $"future door"
@onready var spot1 = $light/SpotLight3D28
@onready var spot2 = $light/SpotLight3D27
@onready var spot3 = $light/SpotLight3D29
@onready var spot4 = $light/SpotLight3D30
@onready var furt2 = $"future door2"

var gate_openned = false
var puzzle1_1 = false
var puzzle1_2 = false
var puzzle1_3 = false
var puzzle1_complete = false

func _ready():
	Game.set_objective("Find a grabpack", 5)

func _on_gate_closer_area_entered(area):
	if not gate_openned:
		gate._close()
		Game.tooltip("hold blue hand on the scanner", 5)
		gate_openned = true


func _on_blue_scanner_scan_complete():
	gate_2._open()

func _on_hand_notify_area_entered(area):
	Game.tooltip("With the purple hand active, press the jump pad", 5)

func _on_grabpack_item_collected():
	Game.set_objective("Explore", 5)
	Game.tooltip("Use keys 1-4 or MOUSE SCROLL to switch hands", 5)


func _on_large_button_pressed():
	gate_3._open()
	purple_panel_4._power()

func _on_large_button_released():
	gate_3._close()
	purple_panel_4._unpower()

func _on_playwatch_camera_obstacle_openned() -> void:
	gate_4._open()

func _on_playwatch_camera_2_obstacle_openned() -> void:
	gate_5._open()

func _on_playwatch_camera_3_obstacle_openned() -> void:
	gate_6._open()

func _on_playwatch_camera_4_obstacle_openned() -> void:
	gate_11._open()

func _on_blue_scanner_2_scan_complete():
	gate_7._open()

func _on_playwatch_collected():
	Game.tooltip("press t to use the playwatch", 3)


func _on_event_trigger_triggered():
	Game.set_objective("find the coordinate device", 5)


func _on_power_reciever_power_recieved():
	large_gate._open()

func _on_event_trigger_3_triggered():
	mini_critter_spawner.spawner_active = true
	mini_critter_spawner_2.spawner_active = true
	mini_critter_spawner_3.spawner_active = true

func _on_event_trigger_4_triggered():
	mini_critter_spawner.spawner_active = false
	mini_critter_spawner_2.spawner_active = false
	mini_critter_spawner_3.spawner_active = false

func _on_door_6_opened():
	player.position = tp_point.position
	mini_critter_spawner.spawner_active = false
	mini_critter_spawner_2.spawner_active = false
	mini_critter_spawner_3.spawner_active = false

func _on_green_reciever_power_recieved():
	puzzle1_1 = true
	Game.tooltip("presser le bouton", 3)

func _on_battery_socket_battery_placed():
	puzzle1_2 = true
	Game.tooltip("presser le bouton", 3)

func _on_battery_socket_2_battery_placed():
	puzzle1_3 = true
	Game.tooltip("presser le bouton", 3)

func _on_button_pressed():
	if puzzle1_1 and puzzle1_2 and puzzle1_3 and not puzzle1_complete:
		gate_8._open()
		puzzle_1_sfx.play()
		puzzle1_complete = true

func _on_purple_scanner_scan_complete():
	gate_9._open()

func _on_green_scanner_scan_complete():
	gate_10._open()

func _on_red_scanner_scan_complete():
	large_gate2._open()

func _on_flare_scanner_scanned_flare():
	large_gate3._open()

func _on_large_gate_2_opened():
		gate_10._close()
		large_gate3._close()
		mini_critter_spawner.spawner_active = false
		mini_critter_spawner_2.spawner_active = false
		mini_critter_spawner_3.spawner_active = false

func _on_door_opened():
	player.position = tp1.position

func _on_vhs_tv_tape_finished():
	gate_12._open()

func _on_power_reciever_2_power_recieved():
	gate_13._open()

func _on_playwatch_camera_5_obstacle_openned():
	large_gate4._open()

func _on_blue_scanner_scan_complete_2():
	gate_12._close()

func _on_battery_socket_battery_placed_2():
	gate_14._open()

func _on_battery_socket_battery_removed():
	gate_14._close()

func _on_purple_scanner_2_scan_complete():
	gate_15._open()

func _on_power_reciever_3_power_recieved():
	purple_scanner1.powered = true

func _on_gate_3_opened():
	door.locked = true 

func _on_purple_scanner_3_scan_complete():
	gate_16._open()

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Level/test.tscn")

func _on_blue_scanner_3_scan_complete():
	door1.locked = false
	gate_9._close()

func _on_power_reciever_4_power_recieved():
	door2.locked = false

func _on_battery_socket_3_battery_placed():
	large_gate6._open()

func _on_green_reciever_1_power_recieved():
	gate_17._open()
	large_gate6._close()

func _on_green_scanner_3_scan_complete():
	gate_18._open()

func _on_gate_closer_2_area_entered(area):
	gate_18._close()

func _on_green_scanner_4_scan_complete():
	gate_19._open()

func _on_green_scanner_10_scan_complete():
	gate_20._open()

func _on_green_reciever_10_power_recieved():
	gate_21._open()

func _on_gate_10_opened():
	green_scanner1.powered = true

func _on_green_scanner_11_scan_complete():
	gate_22._open()

func _on_battery_socket_10_battery_placed():
	blue_scanner.powered = true

func _on_battery_socket_10_battery_removed():
	blue_scanner.powered = false

func _on_blue_scanner_1_scan_complete():
	large_gate7._open()

func _on_green_scanner_12_scan_complete():
	gate_23._open()

func _on_red_scanner_10_scan_complete():
	large_gate8._open()

func _on_red_scanner_11_scan_complete():
	large_gate9._open()

func _on_door_15_opened():
	gate_8._close()

func _on_button_3_pressed():
	ventgate1._open()

func _on_battery_socket_13_battery_placed():
	door3.locked = false

func _on_battery_socket_3_battery_removed():
	door3.locked = true

func _on_ppc_4_scanner_scan_complete():
	gate_24._open()

func _on_white_scanner_scan_complete():
	gate_25._open()

func _on_playwatch_camera_6_obstacle_openned():
	gate_26._open()
	gate_27._open()
	gate_28._open()

func _on_ppc_4_scanner_2_scan_complete():
	gate1._open()

func _on_battery_socket_4_battery_placed():
	gate2._open()

func _on_battery_socket_4_battery_removed():
	gate2._close()

func _on_power_reciever_5_power_recieved():
	largegate1._open()

func _on_green_reciever_2_power_recieved():
	gate3._open()

func _on_large_button_2_pressed():
	gate4._open()

func _on_large_button_2_released():
	gate4._close()

func _on_ppc_4_scanner_3_scan_complete():
	gate6._open()

func _on_white_scanner_2_scan_complete():
	ws1.powered = true

func _on_white_scanner_3_scan_complete():
	ws2.powered = true

func _on_red_scanner_4_scan_complete():
	vs1.powered = true

func _on_purple_scanner_4_scan_complete():
	rs1.powered = true

func _on_purple_scanner_5_scan_complete():
	gate5._open()

func _on_green_scanner_5_scan_complete():
	vs2.powered = true

func _on_white_scanner_4_scan_complete():
	gs1.powered = true

func _on_white_scanner_5_scan_complete():
	futr1._open()
	spot1.spot_range = 0
	spot2.spot_range = 0
	spot3.spot_range = 0
	spot4.spot_range = 0
	Game.set_objective("Power on the Amusement Park", 5)

func _on_green_scanner_6_scan_complete():
	furt2._open()
