extends Node2D


@onready var muzzle: Marker2D = $Muzzle
@onready var projectile_spawner_component: SpawnerComponent = $ProjectileSpawnerComponent

@onready var fire_rate_timer: Timer = $FireRateTimer

@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var move_component: MoveComponent = $MoveComponent
@onready var bounding_box: CollisionShape2D = $HurtboxComponent/CollisionShape2D


# Set in ready().
var x_margin: int

var left_border = 0
var right_border = ProjectSettings.get_setting("display/window/size/playable_area_width")


## Called when the node enters the scene tree for the first time.
##
## Connects the fire rate timeout.
func _ready() -> void:

    fire_rate_timer.timeout.connect(fire_projectile)

    # Set the margin equal to half the width of the hurtbox..
    x_margin = bounding_box.shape.get_rect().size.x / 2


## Spawns lasers from the muzzle locations.
func fire_projectile() -> void:

    projectile_spawner_component.spawn(muzzle.global_position)
    scale_component.tween_scale()


## Called every frame.
##
## Clamps the x position of the assocaited actor between the left and right borders of the viewport,
## accounting for the associated margin. Does *not* affect the top and bottom borders viewport.
func _process(delta: float) -> void:

    self.global_position.x = clamp(
        self.global_position.x, left_border+x_margin, right_border-x_margin
    )