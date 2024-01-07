class_name Sleigh
extends Node2D
## Represents the player sleigh.


@export var game_stats: GameStats

## Must be a subclass of Projectile
@export var default_weapon: PackedScene

@onready var sleigh_sprite: AnimatedSprite2D = $SleighSprite

@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var move_component: MoveComponent = $MoveComponent
@onready var bounding_box: CollisionShape2D = $HurtboxComponent/CollisionShape2D
@onready var weapon_mount: Marker2D = $WeaponMount
@onready var move_input_component = $MoveInputComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var health_component: HealthComponent = $HealthComponent
@onready var destroyed_component: DestroyedComponent = $DestroyedComponent

@onready var shield: Sheild = $Shield
@onready var hurt_sfx: AudioStreamPlayer = $HurtSFX
@onready var shield_break_sfx: AudioStreamPlayer = $ShieldBreakSFX
@onready var hot_choco_sfx: AudioStreamPlayer = $HotChocoSFX


var weapon: Weapon

# Set in ready().
var x_margin: int
var y_margin: int

var left_border = 0
var right_border = ProjectSettings.get_setting("display/window/size/playable_area_width")
var top_border = 0
var bottom_border = ProjectSettings.get_setting("display/window/size/viewport_height")


signal dead


## Called when the node enters the scene tree for the first time.
##
## Computes the margins of the actor, and mounts the default weapon.
func _ready() -> void:

    # Set the margin equal to half the width of the hurtbox..
    x_margin = bounding_box.shape.get_rect().size.x / 2
    y_margin = bounding_box.shape.get_rect().size.y / 2

    # Mount the starting weapon on init.
    switch_weapon(default_weapon)

    # Configure the health bar
    health_component.health = game_stats.player_health
    game_stats.health_initialized.emit()
    health_component.health_changed.connect(func(health):
        if health < game_stats.player_health:
            hurt_sfx.play()
        game_stats.player_health = health
    )

    # handle sheild break
    shield.destroyed.connect(func():
        shield_break_sfx.play()
    )

    # handle death
    health_component.no_health.connect(func():
        dead.emit()
        move_component.velocity = Vector2(0, 0)
    )


## Switches the weapon mounted on the sleigh to the given weapon scene.
##
## Also connects to the weapon's [signal Weapon.fired] to the [member Sleigh.scale_component]'s
## tween function, for juice.
func switch_weapon(scene: PackedScene) -> void:

    weapon = scene.instantiate()
    weapon_mount.add_child(weapon)
    weapon.global_position = weapon_mount.global_position

    weapon.fired.connect(func():
        scale_component.tween_scale()
    )


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
