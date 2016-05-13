class PostPolicy < ApplicationPolicy
    def update?
        user.editor?
    end
end