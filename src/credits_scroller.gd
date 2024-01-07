extends Node2D
class_name CreditsScroller
## Credits scroller node.
##
## Written by benbishopnz, amended by Zoidmania.
## See: https://github.com/benbishopnz/godot-credits/tree/master


const section_time := 2.0
const line_time := 0.3
const base_speed := 50
const speed_up_multiplier := 10.0

var scroll_speed := base_speed
var speed_up := false

@onready var line: Label = $CreditsContainer/Line
@onready var credits_container: Control = $CreditsContainer

const CREDIT_LABEL_SETTINGS = preload("res://menus/credit_label_settings.tres")
const CREDIT_SECTION_LABEL_SETTINGS = preload("res://menus/credit_section_label_settings.tres")

var started := false
var finished := false

var section
var section_next := true
var section_timer := 0.0
var line_timer := 0.0
var curr_line := 0
var lines := []

var credits = [
    [
        "Made by Team Beeg Chungus for the\nWinter 2023 GDEX Game Game",
        "https://thegdex.com/gamejam"
    ],[
        "Programming",
        "jgotty777",
        "Zoidmania",
    ],[
        "Art",
        "Shawnedia",
        "jgotty777",
        "Lord_Amonkira",
    ],[
        "Music",
        "easterisland_"
    ],[
        "Sound Effects",
        "easterisland_",
        "jgotty777",
        "Zoidmania",
    ],[
        "Testers",
        "Various significant others and friends",
    ],[
        "Tools used",
        "Developed with Godot Engine",
        "https://godotengine.org/license",
        "",
        "Art created with Aseprite",
        "https://www.aseprite.org/",
        "",
        "Music created with LMMS",
        "https://github.com/LMMS/lmms",
        "",
        "Sound effects created with Audactity",
        "https://www.audacityteam.org/",
        "",
        "Font asset from Kenney",
        "https://kenney.nl",
        "",
        "Some effects and code from HeartBeast",
        "https://github.com/uheartbeast/galaxy_defiance_resources/tree/main",
        "",
        "Credits scroller code based on work by benbishopnz",
        "https://github.com/benbishopnz/godot-credits/tree/master",
        "",
    ],[
        "Special thanks",
        "argembarger, for delightful conversation and excellent moderation\nin the GDEX Discord server.",
    ]
]


func _process(delta):
    var scroll_speed = base_speed * delta

    if section_next:
        section_timer += delta * speed_up_multiplier if speed_up else delta
        if section_timer >= section_time:
            section_timer -= section_time

            if credits.size() > 0:
                started = true
                section = credits.pop_front()
                curr_line = 0
                add_line()

    else:
        line_timer += delta * speed_up_multiplier if speed_up else delta
        if line_timer >= line_time:
            line_timer -= line_time
            add_line()

    if speed_up:
        scroll_speed *= speed_up_multiplier

    if lines.size() > 0:
        for l in lines:
            l.position.y -= scroll_speed
    else:
        await get_tree().create_timer(38.0).timeout
        finish()


func finish():
    if not finished:
        finished = true
        get_tree().change_scene_to_file("res://menus/main_menu.tscn")


func add_line():
    var new_line: Label = line.duplicate()
    new_line.text = section.pop_front()
    lines.append(new_line)
    if curr_line == 0:
        new_line.label_settings = CREDIT_SECTION_LABEL_SETTINGS
        line_timer -= 0.3
    credits_container.add_child(new_line)

    if section.size() > 0:
        curr_line += 1
        section_next = false
    else:
        section_next = true


func _unhandled_input(event):
    if event.is_action_pressed("ui_cancel"):
        finish()
    if event.is_action_pressed("ui_down") and !event.is_echo():
        speed_up = true
    if event.is_action_released("ui_down") and !event.is_echo():
        speed_up = false
