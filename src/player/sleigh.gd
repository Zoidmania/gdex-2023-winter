class_name Sleigh
extends Node2D
## Represents the player sleigh.


## Must be a subclass of Projectile
@export var weapon: PackedScene


@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var move_component: MoveComponent = $MoveComponent
@onready var bounding_box: CollisionShape2D = $HurtboxComponent/CollisionShape2D
@onready var weapon_mount: Marker2D = $WeaponMount


# Set in ready().
var x_margin: int
var y_margin: int

var left_border = 0
var right_border = ProjectSettings.get_setting("display/window/size/playable_area_width")
var top_border = 0
var bottom_border = ProjectSettings.get_setting("display/window/size/viewport_height")


## Called when the node enters the scene tree for the first time.
##
## Computes the margins of the actor, and mounts the default weapon.
func _ready() -> void:

    # Set the margin equal to half the width of the hurtbox..
    x_margin = bounding_box.shape.get_rect().size.x / 2
    y_margin = bounding_box.shape.get_rect().size.y / 2

    # Mount the starting weapon on init.
    switch_weapon(weapon)


## Switches the weapon mounted on the sleigh to the given weapon scene.
func switch_weapon(scene: PackedScene) -> void:

    weapon = scene
    var instance = weapon.instantiate()
    weapon_mount.add_child(instance)
    instance.global_position = weapon_mount.global_position


## Called every frame.
##
## Clamps the position of the assocaited actor within the borders of the playable area, accounting
## for the associated margin.
##
## Also scales the sleigh briefly when firing.
func _process(delta: float) -> void:

    self.global_position.x = clamp(
        self.global_position.x, left_border+x_margin, right_border-x_margin
    )

    self.global_position.y = clamp(
        self.global_position.y, top_border+y_margin, bottom_border-y_margin
    )

    if Input.is_action_just_pressed("santa_shoot"):
        scale_component.tween_scale()
