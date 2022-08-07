module ApplicationHelper
  def inclination(count, one, many)
    return one if count == 1
    many
  end

  def question_author(question)
    return link_to display_at_sign(question.author), user_path(question.author) if question.author
    'anonymous user'
  end
end
