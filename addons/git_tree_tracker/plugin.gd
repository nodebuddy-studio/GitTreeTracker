@tool
extends EditorPlugin

var label: Label

func _enter_tree() -> void:
	label = Label.new()
	label.text = " Git: " + _get_current_git_branch()

	label.add_theme_color_override("font_color", Color.DARK_TURQUOISE)

	add_control_to_container(EditorPlugin.CONTAINER_TOOLBAR, label)

func _exit_tree() -> void:
	if is_instance_valid(label):
		remove_control_from_container(EditorPlugin.CONTAINER_TOOLBAR, label)
		label.queue_free()

func _get_current_git_branch() -> String:
	var git_path := "res://.git"

	if not FileAccess.file_exists(git_path):
		return "No Worktree Found"

	var file := FileAccess.open(git_path, FileAccess.READ)
	if not file:
		return "Error reading .git"

	var first_line := file.get_line().strip_edges()
	file.close()

	if first_line.begins_with("gitdir:"):
		return first_line.get_file()

	var head_path := "res://.git/HEAD"
	if FileAccess.file_exists(head_path):
		var head_file := FileAccess.open(head_path, FileAccess.READ)
		var head_line := head_file.get_line().strip_edges()
		head_file.close()
		if head_line.begins_with("ref:"):
			return head_line.get_file()

	return "Unknown Branch"
