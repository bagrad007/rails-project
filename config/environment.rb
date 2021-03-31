# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  ### Original Code
  #"<div class=\"field_with_errors\">#{html_tag}</div>".html_safe
  ### Cancelling additional <div> w/ class="adding field_with_errors"
  # html_tag.html_safe
  if html_tag.include?("<input")
    html_tag.scan(/(.*)<input (.+)/).flatten.join('<input class="field_with_errors ').html_safe
  else
    html_tag.html_safe
  end
end
