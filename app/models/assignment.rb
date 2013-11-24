class Assignment < ActiveRecord::Base
  belongs_to :group
	belongs_to :task

	has_many :scores
	has_many :submissions
	has_many :posts

	delegate :title, :description, :due_date, :to => :task

  attr_accessible :id, :title, :due_date, :score, :description, :group_id, :task_id
  def self.create_from_group_and_task(group, task)
    assignment = Assignment.create()
    assignment.group = group
    assignment.task = task
    assignment.save
    return assignment
  end

  def posts_in_chronological_order
    posts = Post.where(:assignment_id => self.id)
                .order(:date => :asc)
  end

  def total_score
    total_max_score, total_score = 0, 0
    scores.each do |s|
      total_max_score += s.max_score
      total_score += s.score
    end

    if [total_score, total_max_score] == [0, 0]
      return nil
    else
      return total_score, total_max_score
    end
  end
end
