class Todo < ApplicationRecord
    validates :name, presence: true
    scope :ordered, -> { order(id: :desc) }
    after_create_commit -> { broadcast_prepend_to "todos", partial: "todos/todo", locals: { todo: self }, target: "todos" }
    after_update_commit -> { broadcast_replace_to "todos" }
    after_destroy_commit -> { broadcast_remove_to "todos" }
end
