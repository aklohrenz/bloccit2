# app/policies/topic_policy.rb

class TopicPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    user.present? && (record.user == user || user.role?(:admin) || user.role?(:moderator))
  end

  def show?
    record.public? || user.present?
  end
  
end