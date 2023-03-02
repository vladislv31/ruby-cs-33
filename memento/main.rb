class TextEditor
  attr_accessor :text

  def initialize
    @text = ""
  end

  def create_mem
    Memento.new(@text)
  end

  def restore_mem(mem)
    @text = mem.text
  end
end

class Memento
  attr_reader :text

  def initialize(text)
    @text = text
  end
end

class TextEditorHistory
  def initialize
    @history = []
  end

  def save_state(editor)
    @history << editor.create_mem
  end

  def undo(editor)
    return if @history.empty?

    mem = @history.pop
    editor.restore_mem(mem)
  end
end

editor = TextEditor.new
history = TextEditorHistory.new

editor.text = "Memento Pattern"
history.save_state(editor)

editor.text += " on Ruby"

history.undo(editor)

puts editor.text
