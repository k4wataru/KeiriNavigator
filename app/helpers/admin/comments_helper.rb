module Admin::CommentsHelper

  def sentiment_color(score)
    if score.present?
      if score <= -0.6 && score >= -1.0
        'text-danger' #  red color
      elsif score >= 0 && score <= -0.5
        'text-warning' #  yellow color
      else
        'text-success' #  green color
      end
    else
      'text-muted' # Default color if score is nil
    end
  end
end
