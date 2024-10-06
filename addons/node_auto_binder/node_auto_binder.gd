@tool
extends EditorPlugin

const START = "# Autogenerated Bindings Start"
const END = "# Autogenerated Bindings End"

const TYPE = {
	"Img_": "TextureRect",
	"Txt_": "Label",
}

var btn_bind: Button


func _enter_tree() -> void:
	btn_bind = Button.new()
	btn_bind.text = "Bind"
	btn_bind.pressed.connect(bind)
	add_control_to_dock(DOCK_SLOT_RIGHT_BL, btn_bind)
	
	# Initialization of the plugin goes here.
	pass


func _exit_tree() -> void:
	remove_control_from_docks(btn_bind)
	btn_bind.queue_free()
	# Clean-up of the plugin goes here.
	pass



func bind() -> void:
	var root: = get_editor_interface().get_edited_scene_root()
	var bindings: = ""
	for child in root.get_children():
		var c_name: = child.name
		for type in TYPE:
			if c_name.begins_with(type):
				bindings += "@onready var " + c_name + ": " + TYPE.type + " = " + root.get_path_to(child)
				break
	
	var script: Script = root.get_script()
	if script:
		var file: = FileAccess.open(script.resource_path, FileAccess.READ_WRITE)
		if file:
			var content: = file.get_as_text()
			
		
	pass
