module DeviseHelper
  def devise_error_messages!
    return "" if  resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = "errors.messages.not_saved"
    html = <<-HTML
    <div id="error_explanation">
    <h2>#{sentence}</h2>
    <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def render_identify_category(identify)
    key = IdentifyData.identity_categories.key(identify.identify_category)
    I18n.t("identify_categories.#{key}")
  end



end
